//
//  Integration.c
//  CenterOfMass
//
//  Created by Yuri Bulavin on 04.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

#include "Integration.h"


int _evalSphereSegmentVolume(void *fdata, const double *xmin,
                            const double *xmax, double reqRelError,
                            double *val, double *err) {
    
    int res = pcubature(1, integrandSphere, fdata, 3, xmin, xmax, 0, 0, reqRelError, ERROR_INDIVIDUAL, val, err);
    return res;
}

int _evalSphereSegmentMomentY(void *fdata, const double *xmin,
                             const double *xmax, double reqRelError,
                             double *val, double *err) {
    
    int res = pcubature(1, integrandSphereSegmentMomentY, fdata, 3, xmin, xmax, 0, 0, reqRelError, ERROR_INDIVIDUAL, val, err);
    return res;
}



int _evalCircleSegmentArea(void *fdata, const double *xmin,
                             const double *xmax, double reqRelError,
                             double *val, double *err) {
    
    int res = pcubature(1, integrandCircle, fdata, 2, xmin, xmax, 0, 0, reqRelError, ERROR_INDIVIDUAL, val, err);
    return res;
}

int _evalCircleSegmentMomentY(void *fdata, const double *xmin,
                           const double *xmax, double reqRelError,
                           double *val, double *err) {
    
    int res = pcubature(1, integrandCircleSegmentMomentY, fdata, 2, xmin, xmax, 0, 0, reqRelError, ERROR_INDIVIDUAL, val, err);
    return res;
}

