//
//  Integrands.c
//  CenterOfMass
//
//  Created by Yuri Bulavin on 03.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

#include "Integrands.h"

int integrandCircle(unsigned ndim, const double *x, void *data,
                    unsigned fdim, double *fval){
    double radius = *((double *) data);
    
    double lhs = (x[0] * x[0] + x[1] * x[1]);
    double rhs = (radius * radius);
    *fval = lhs <= rhs ? 1: 0;
    
    return 0;
}

//int integrandCircleSegmentMomentX(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval){
//    double radius = *((double *) data);
//    
//    double lhs = (x[0] * x[0] + x[1] * x[1]);
//    double rhs = (radius * radius);
//    *fval = lhs <= rhs ? x[0]: 0;
//    
//    return 0;
//}


int integrandCircleSegmentMomentY(unsigned ndim, const double *x, void *data,
                                 unsigned fdim, double *fval){
    double radius = *((double *) data);
    
    double lhs = (x[0] * x[0] + x[1] * x[1]);
    double rhs = (radius * radius);
    *fval = lhs <= rhs ? x[1]: 0;
    
    return 0;
}

//int integrandCircleCenterOfMassZ(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval){
//    double radius = *((double *) data);
//    
//    double lhs = (x[0] * x[0] + x[1] * x[1]);
//    double rhs = (radius * radius);
//    *fval = lhs <= rhs ? x[2]: 0;
//    
//    return 0;
//}


int integrandSphere(unsigned ndim, const double *x, void *data,
                    unsigned fdim, double *fval){
    double radius = *((double *) data);
    
    double lhs = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]);
    double rhs = (radius * radius);
    *fval = lhs <= rhs ? 1: 0;
    return 0;
}


//int integrandSphereCenterOfMassX(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval){
//    double radius = *((double *) data);
//    
//    double lhs = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]);
//    double rhs = (radius * radius);
//    *fval = lhs <= rhs ? x[0]: 0;
//    
//    return 0;
//}


int integrandSphereSegmentMomentY(unsigned ndim, const double *x, void *data,
                                 unsigned fdim, double *fval){
    double radius = *((double *) data);
    
    double lhs = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]);
    double rhs = (radius * radius);
    *fval = lhs <= rhs ? x[1]: 0;
    
    return 0;
}

//int integrandSphereCenterOfMassZ(unsigned ndim, const double *x, void *data,
//                                 unsigned fdim, double *fval){
//    double radius = *((double *) data);
//    
//    double lhs = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]);
//    double rhs = (radius * radius);
//    *fval = lhs <= rhs ? x[2]: 0;
//    
//    return 0;
//}


