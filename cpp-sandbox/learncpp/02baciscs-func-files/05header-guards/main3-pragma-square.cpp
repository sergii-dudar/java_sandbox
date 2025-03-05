#include "main3-pragma-square.h"

int getSquareSides() // actual definition for getSquareSides
{
    return 4;
}

int getSquarePerimeter( int sideLength ) {
    return sideLength * getSquareSides();
}