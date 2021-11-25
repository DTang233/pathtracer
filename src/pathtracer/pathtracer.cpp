#include "pathtracer.h"

#include "scene/light.h"
#include "scene/sphere.h"
#include "scene/triangle.h"


using namespace CGL::SceneObjects;

namespace CGL {

PathTracer::PathTracer() {
  gridSampler = new UniformGridSampler2D();
  hemisphereSampler = new UniformHemisphereSampler3D();

  tm_gamma = 2.2f;
  tm_level = 1.0f;
  tm_key = 0.18;
  tm_wht = 5.0f;
}

PathTracer::~PathTracer() {
  delete gridSampler;
  delete hemisphereSampler;
}

void PathTracer::set_frame_size(size_t width, size_t height) {
  sampleBuffer.resize(width, height);
  sampleCountBuffer.resize(width * height);
}

void PathTracer::clear() {
  bvh = NULL;
  scene = NULL;
  camera = NULL;
  sampleBuffer.clear();
  sampleCountBuffer.clear();
  sampleBuffer.resize(0, 0);
  sampleCountBuffer.resize(0, 0);
}

void PathTracer::write_to_framebuffer(ImageBuffer &framebuffer, size_t x0,
                                      size_t y0, size_t x1, size_t y1) {
  sampleBuffer.toColor(framebuffer, x0, y0, x1, y1);
}

Spectrum
PathTracer::estimate_direct_lighting_hemisphere(const Ray &r,
                                                const Intersection &isect) {
  // Estimate the lighting from this intersection coming directly from a light.
  // For this function, sample uniformly in a hemisphere.

  // make a coordinate system for a hit point
  // with N aligned with the Z direction.
  Matrix3x3 o2w;
  make_coord_space(o2w, isect.n);
  Matrix3x3 w2o = o2w.T();

  // w_out points towards the source of the ray (e.g.,
  // toward the camera if this is a primary ray)
  const Vector3D &hit_p = r.o + r.d * isect.t;
  const Vector3D &w_out = w2o * (-r.d);

  // This is the same number of total samples as
  // estimate_direct_lighting_importance (outside of delta lights). We keep the
  // same number of samples for clarity of comparison.
  int num_samples = scene->lights.size() * ns_area_light;
  Spectrum L_out;

  // TODO (Part 3): Write your sampling loop here
  // TODO BEFORE YOU BEGIN
  // UPDATE `est_radiance_global_illumination` to return direct lighting instead of normal shading
    
    for (int i = 0; i <= num_samples; ++i) {
        Vector3D wi = hemisphereSampler->get_sample();
        Ray r = Ray(hit_p + EPS_D * (o2w * wi), (o2w * wi));
        Intersection inst;
        if (bvh->intersect(r, &inst)){
            float pdf = 1/(2 * PI);
            L_out += inst.bsdf->get_emission() * isect.bsdf->f(w_out, wi) * wi.z / pdf;
        }
    }

    
    if(L_out == 0){
        return zero_bounce_radiance(r, isect);
    }

    return L_out/num_samples;
}

Spectrum
PathTracer::estimate_direct_lighting_importance(const Ray &r,
                                                const Intersection &isect) {
  // Estimate the lighting from this intersection coming directly from a light.
  // To implement importance sampling, sample only from lights, not uniformly in
  // a hemisphere.

  // make a coordinate system for a hit point
  // with N aligned with the Z direction.
  Matrix3x3 o2w;
  make_coord_space(o2w, isect.n);
  Matrix3x3 w2o = o2w.T();

  // w_out points towards the source of the ray (e.g.,
  // toward the camera if this is a primary ray)
  const Vector3D &hit_p = r.o + r.d * isect.t;
  const Vector3D &w_out = w2o * (-r.d);
  Spectrum L_out;
    
    //scene->lights is a vector storing pointers of all the lights in the scene
    for (SceneLight* sl : scene->lights){
        //SceneLight::is_delta_light() returns true if the light is a point light source
        if (sl->is_delta_light()){
            
            Vector3D wi;//unit vector giving the direction from hit_p to the light source
            float distToLight;
            float pdf;//giving the probability density function evaluated at the returned wi direction.
            
//            samples the light and:
//            returns the emitted radiance as a Spectrum
            Spectrum s = sl->sample_L(hit_p, &wi, &distToLight, &pdf);
            
            Vector3D w_in = w2o * wi;
            if (w_in.z > 0){
                //cast a ray from hit_p
                Ray r = Ray(hit_p + EPS_D * wi, wi);
                r.max_t = distToLight - EPS_F;
                Intersection inst;
                if (!bvh->intersect(r, &inst)){
                    Spectrum bsdf = isect.bsdf->f(w_out, w_in);
                    //transform it to irradiance
                    L_out += (s * bsdf * w_in.z)/pdf;
                }
            }
        }else{
    
            for (int i = 0; i < ns_area_light; ++i) {
                Vector3D wi;
                float distToLight;
                float pdf;
                Spectrum s = sl->sample_L(hit_p, &wi, &distToLight, &pdf);
                
                Vector3D w_in = w2o * wi;
                if (w_in.z > 0){
                    Ray r = Ray(hit_p + EPS_D * wi, wi);
                    r.max_t = distToLight;
                    Intersection inst;
                    if (!bvh->intersect(r, &inst)){
                        Spectrum bsdf = isect.bsdf->f(w_out, w_in);
                        L_out += (s * bsdf * w_in.z)/pdf;
                    }
                }
            }
        }
    }
    if(L_out == 0){
        return zero_bounce_radiance(r, isect);
    }
    
  return L_out/ns_area_light;
}

Spectrum PathTracer::zero_bounce_radiance(const Ray &r,
                                          const Intersection &isect) {
  // TODO: Part 3, Task 2
  // Returns the light that results from no bounces of light

  return isect.bsdf->get_emission();
}

Spectrum PathTracer::one_bounce_radiance(const Ray &r,
                                         const Intersection &isect) {
  // TODO: Part 3, Task 3
  // Returns either the direct illumination by hemisphere or importance sampling
  // depending on `direct_hemisphere_sample`
    

    return estimate_direct_lighting_importance(r, isect);

}

Spectrum PathTracer::at_least_one_bounce_radiance(const Ray &r,
                                                  const Intersection &isect) {
//    Matrix3x3 o2w;
//    make_coord_space(o2w, isect.n);
//    Matrix3x3 w2o = o2w.T();
//
//    Vector3D hit_p = r.o + r.d * isect.t;
//    Vector3D w_out = w2o * (-r.d);
//
//    Spectrum L_out(0, 0, 0);
//
//
//
//    Vector3D w_in;
//    float pdf;
//
//    Spectrum bsdf = isect.bsdf->sample_f(w_out, &w_in, &pdf);
//
//
////    if(pdf == 0){
////        return one_bounce_radiance(r, isect);
////    }
//    // at least one bounce
//    if(r.depth == max_ray_depth){
//
//        Ray new_r = Ray(hit_p + EPS_D * (o2w * w_in), (o2w * w_in));
//        new_r.depth = r.depth - 1;
//        Intersection inst;
//        // if there is intersection
//        if(bvh->intersect(new_r, &inst)){
//          L_out += at_least_one_bounce_radiance(new_r, inst) * bsdf * w_in.z/pdf;
//        }
//    }
//
//    //Russian Roulette to terminate
//    double rrp = 0.7;
//    if(r.depth >= 1 && coin_flip(rrp)){
//
//        Ray new_r = Ray(hit_p + EPS_D * (o2w * w_in), (o2w * w_in));
//        new_r.depth = r.depth - 1;
//        Intersection inst;
//        if(bvh->intersect(new_r, &inst)){
//          L_out += at_least_one_bounce_radiance(new_r, inst) * bsdf * w_in.z/pdf/rrp;
//        }
//    }
    Matrix3x3 o2w;
    make_coord_space(o2w, isect.n);
    Matrix3x3 w2o = o2w.T();

    Vector3D hit_p = r.o + r.d * isect.t;
    Vector3D w_out = w2o * (-r.d);

    Spectrum L_out = one_bounce_radiance(r, isect);

    // TODO (Part 4.2):
    // Here is where your code for sampling the BSDF,
    // performing Russian roulette step, and returning a recursively
    // traced ray (when applicable) goes
    Vector3D w_in;
    float pdf;
    Spectrum bsdf = isect.bsdf->sample_f(w_out, &w_in, &pdf);
    Vector3D wi = o2w * w_in;
    if (pdf == 0) return L_out; // gets rid of white specks
    
//    cout << r.depth;
    if (r.depth == 0) { // guarantees at least one bounce
        //std::cout << "first" << std::endl;
     
        Ray r1 = Ray(hit_p + EPS_D * wi, wi);
        r1.depth = r.depth - 1;
        Intersection isect1;
        if (bvh->intersect(r1, &isect1)) L_out += at_least_one_bounce_radiance(r1, isect1) * bsdf * w_in.z / pdf;
        
    }

    double RRp = 0.3; // Russian Roulette probability
    if (coin_flip(1.0 - RRp) && r.depth < max_ray_depth) {
        Ray r1 = Ray(hit_p + EPS_D * wi, wi);
        r1.depth = r.depth - 1;
        Intersection isect1;
        if (bvh->intersect(r1, &isect1)) L_out += at_least_one_bounce_radiance(r1, isect1) * bsdf * w_in.z / pdf / (1.0 - RRp);
    }
    

    //std::cout << "returning" << std::endl;
    return L_out;
    
    

//  return L_out;
}

Spectrum PathTracer::est_radiance_global_illumination(const Ray &r) {
  Intersection isect;
  Spectrum L_out;

  // You will extend this in assignment 3-2.
  // If no intersection occurs, we simply return black.
  // This changes if you implement hemispherical lighting for extra credit.

    if (!bvh->intersect(r, &isect)){
       return L_out;
    }
    

  // The following line of code returns a debug color depending
  // on whether ray intersection with triangles or spheres has
  // been implemented.

  // REMOVE THIS LINE when you are ready to begin Part 3.
//  L_out = (isect.t == INF_D) ? debug_shading(r.d) : normal_shading(isect.n);

  // TODO (Part 3): Return the direct illumination.

  // TODO (Part 4): Accumulate the "direct" and "indirect"
  // parts of global illumination into L_out rather than just direct

    Spectrum L_out_d;// direct light
    Spectrum L_out_ind;//indirect light
    
//    if (r.depth == 0){
//
//      return zero_bounce_radiance(r, isect);
//    }
//    else if (r.depth == 1){
//      return one_bounce_radiance(r, isect);
//    }
//
//    else {
//
//
//        L_out_d = zero_bounce_radiance(r, isect) + one_bounce_radiance(r, isect);
//        L_out_ind = at_least_one_bounce_radiance(r, isect) - one_bounce_radiance(r, isect);
//    }
    
    return at_least_one_bounce_radiance(r, isect);

}

void PathTracer::raytrace_pixel(size_t x, size_t y) {

  // TODO (Part 1.1):
  // Make a loop that generates num_samples camera rays and traces them
  // through the scene. Return the average Spectrum.
  // You should call est_radiance_global_illumination in this function.

  // TODO (Part 5):
  // Modify your implementation to include adaptive sampling.
  // Use the command line parameters "samplesPerBatch" and "maxTolerance"
    
    
    
    int num_samples = ns_aa;          // total samples to evaluate
    Vector2D origin = Vector2D(x, y); // bottom left corner of the pixel

//    sampleBuffer.update_pixel(Spectrum(0.2, 1.0, 0.8), x, y);
    sampleCountBuffer[x + y * sampleBuffer.w] = num_samples;
    gridSampler->get_sample();
  
    Spectrum s  = Spectrum();

    
    for(int i = 0; i < num_samples; i++){
        Vector2D t = origin + gridSampler->get_sample();
        double xn = t.x/sampleBuffer.w;
        double yn = t.y/sampleBuffer.h;
        Ray r = camera->generate_ray(xn, yn);
        s += est_radiance_global_illumination(r);
        
    }
    sampleBuffer.update_pixel(s*(1.0/num_samples), x, y);
    
}

} // namespace CGL
