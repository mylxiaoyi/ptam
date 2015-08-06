TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt


SOURCES += \
    ./GLWindowMenu.cc \
    ./MapViewer.cc \
    ./MapMaker.cc \
    ./PatchFinder.cc \
    ./Relocaliser.cc \
    ./KeyFrame.cc \
    ./HomographyInit.cc \
    ./ARDriver.cc \
    ./MapPoint.cc \
    ./Map.cc \
    ./VideoSource_Linux_DV.cc \
    ./Tracker.cc \
    ./ShiTomasi.cc \
    ./SmallBlurryImage.cc \
    ./CalibImage.cc \
    ./CameraCalibrator.cc \
    ./Bundle.cc \
    ./main.cc \
    ./System.cc \
    ./VideoSource_Linux_V4L.cc \
    ./ATANCamera.cc \
    ./VideoSource_Linux_file.cc \
    ./MiniPatch.cc \
    ./CalibCornerPatch.cc \
    ./EyeGame.cc \
    ./GLWindow2.cc \


HEADERS += \
    ./MEstimator.h \
    ./System.h \
    ./Bundle.h \
    ./SmallMatrixOpts.h \
    ./EyeGame.h \
    ./OpenGL.h \
    ./VideoSource.h \
    ./ATANCamera.h \
    ./TrackerData.h \
    ./ARDriver.h \
    ./SmallBlurryImage.h \
    ./MapMaker.h \
    ./CameraCalibrator.h \
    ./Relocaliser.h \
    ./MapPoint.h \
    ./LevelHelpers.h \
    ./GLWindow2.h \
    ./CalibImage.h \
    ./PatchFinder.h \
    ./Map.h \
    ./HomographyInit.h \
    ./MiniPatch.h \
    ./ShiTomasi.h \
    ./KeyFrame.h \
    ./MapViewer.h \
    ./GLWindowMenu.h \
    ./Tracker.h \
    ./CalibCornerPatch.h \


################################################################################
# OpenCV settings
################################################################################
OPENCV_TOP  = /opt/opencv-2.4.5

LIBS += -L$$OPENCV_TOP/lib \
        -lopencv_calib3d -lopencv_contrib -lopencv_core \
        -lopencv_features2d -lopencv_flann -lopencv_gpu \
        -lopencv_highgui -lopencv_imgproc -lopencv_legacy \
        -lopencv_ml -lopencv_nonfree -lopencv_objdetect \
        -lopencv_photo -lopencv_stitching -lopencv_ts \
        -lopencv_video -lopencv_videostab

INCLUDEPATH +=  $$OPENCV_TOP/include $$OPENCV_TOP/include/opencv ../3rdparty/include/
