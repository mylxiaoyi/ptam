// Copyright 2008 Isis Innovation Limited

#include <unistd.h>

#include "VideoSource.h"

#include <cvd/Linux/v4lbuffer.h>
#include <cvd/colourspace_convert.h>
#include <cvd/colourspaces.h>
#include <gvars3/instances.h>

#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace CVD;
using namespace std;
using namespace GVars3;

#include <iostream>
using namespace std;

VideoSource::VideoSource()
{
    cv::VideoCapture    *vc;
    cv::Mat             img;

    cout << "  VideoSource_Linux: Opening video file..." << endl;

    cout <<" in VideoSource::VideoSource()" <<endl;
    vc = new cv::VideoCapture();
    vc->open("/home/mylxiaoyi/my_video-1.mkv");
    //vc->open("test_00034.mp4");
    //vc->open("t.avi");
    *vc >> img;

    mirSize.x = img.cols;
    mirSize.y = img.rows;

    mptr = vc;
}

ImageRef VideoSource::Size()
{ 
    return mirSize;
}

void VideoSource::GetAndFillFrameBWandRGB(Image<byte> &imBW, Image<Rgb<byte> > &imRGB)
{
    cv::VideoCapture    *vc;
    cv::Mat             img, img_BW;

    byte                *p1;
    Rgb<byte>           *p2;
    int                 w, h, i;

    vc = (cv::VideoCapture *) mptr;
    *vc >> img;
    if( img.empty() ) {
        return;
    }

    w = img.cols;
    h = img.rows;

    cv::cvtColor(img, img_BW, CV_BGR2GRAY);

    // copy BW data
    p1 = imBW.data();
    for(i=0; i<w*h; i++) p1[i] = img_BW.data[i];

    // copy RGB data
    p2 = imRGB.data();
    for(i=0; i<w*h; i++) {
        p2[i].blue  = img.data[i*3+0];
        p2[i].green = img.data[i*3+1];
        p2[i].red   = img.data[i*3+2];
    }

    usleep(50000);
}
