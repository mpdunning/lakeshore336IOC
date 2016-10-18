#!../../bin/linux-x86_64/lakeshore336

epicsEnvSet( "STREAM_PROTOCOL_PATH","../../lakeshore336App/Db:.")

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/lakeshore336.dbd"
lakeshore336_registerRecordDeviceDriver pdbbase

epicsEnvSet("P",         "ASTA:LAKE01")
epicsEnvSet("DESC",      "Cryo UED")
epicsEnvSet("IP",        "sioc-asta-lake01")
#epicsEnvSet("IP",        "172.27.248.49")
epicsEnvSet("ADDR",      "inst0")
epicsEnvSet("PROTOFILE", "lakeshore336.proto")
epicsEnvSet("DELAY0",    "0.1")

save_restoreSet_status_prefix( "")
save_restoreSet_IncompleteSetsOk( 1)
save_restoreSet_DatedBackupFiles( 1)
set_savefile_path( "/nfs/slac/g/testfac/esb/$(IOC)","autosave")
set_pass0_restoreFile( "lakeshore336.sav")
set_pass1_restoreFile( "lakeshore336.sav")

drvAsynIPPortConfigure("L0", "$(IP):7777", 0, 0, 0)
asynOctetSetInputEos("L0",0,"\n")
asynOctetSetOutputEos("L0",0,"\n")

#asynSetTraceMask("L0",-1,0x9)
#asynSetTraceIOMask("L0",-1,0x6)

dbLoadRecords("db/lakeshore336.db","IOCNAME=${IOC},P=$(P),DESC=$(DESC),PROTOFILE=$(PROTOFILE),PORT=L0,ADDR=$(ADDR)")
dbLoadRecords("db/asynRecord.db","P=$(P):,R=asyn,PORT=L0,ADDR=0,OMAX=0,IMAX=0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

create_monitor_set( "lakeshore336.req",30,"P=$(P)")

