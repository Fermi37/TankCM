//
//  Integrands.h
//  CenterOfMass
//
//  Created by Yuri Bulavin on 03.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

#ifndef Integrands_h
#define Integrands_h

#include <stdio.h>

#endif /* Integrands_h */

int integrandCircle(unsigned ndim, const double *x, void *data,
                    unsigned fdim, double *fval);
 
//int integrandCircleCenterOfMassX(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval);
//


int integrandCircleSegmentMomentY(unsigned ndim, const double *x, void *data,
                                 unsigned fdim, double *fval);


//int integrandCircleCenterOfMassZ(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval);



int integrandSphere(unsigned ndim, const double *x, void *data,
                    unsigned fdim, double *fval);


//int integrandSphereCenterOfMassX(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval);

int integrandSphereSegmentMomentY(unsigned ndim, const double *x, void *data,
                                 unsigned fdim, double *fval);

//int integrandSphereCenterOfMassZ(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval);
