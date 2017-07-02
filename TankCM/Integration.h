//
//  Integration.h
//  CenterOfMass
//
//  Created by Yuri Bulavin on 04.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

#ifndef Integration_h
#define Integration_h

#include <stdio.h>
#include "Integrands.h"
#include "cubature.h"

#endif /* Integration_h */



int _evalSphereSegmentVolume(void *fdata, const double *xmin,
                               const double *xmax, double reqRelError,
                               double *val, double *err);

int _evalSphereSegmentMomentY(void *fdata, const double *xmin,
                             const double *xmax, double reqRelError,
                             double *val, double *err);


int _evalCircleSegmentArea(void *fdata, const double *xmin,
                             const double *xmax, double reqRelError,
                             double *val, double *err);

int _evalCircleSegmentMomentY(void *fdata, const double *xmin,
                              const double *xmax, double reqRelError,
                              double *val, double *err);
