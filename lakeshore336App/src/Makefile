TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = lakeshore336

DBD += lakeshore336.dbd

lakeshore336_DBD += base.dbd
lakeshore336_DBD += stream.dbd
lakeshore336_DBD += asyn.dbd
lakeshore336_DBD += asSupport.dbd
lakeshore336_DBD += drvAsynIPPort.dbd
lakeshore336_DBD += calcSupport.dbd

lakeshore336_SRCS += lakeshore336_registerRecordDeviceDriver.cpp
lakeshore336_SRCS_DEFAULT += main.cpp

lakeshore336_LIBS += asyn
lakeshore336_LIBS += autosave
lakeshore336_LIBS += stream
lakeshore336_LIBS += calc

lakeshore336_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

