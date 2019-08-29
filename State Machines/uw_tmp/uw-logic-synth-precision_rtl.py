#--------------------------------------------------------------
# remove xrf files to prevent warning about moving them because
# they already exist

my_rm( ["uw_tmp/*.xrf", "uw_tmp/*.qsf"] )

my_mkdir( "LOG" )
my_mkdir( "RPT" )

#--------------------------------------------------------------
# run precision

xsys( "precision -shell -file uw_tmp/uw-logic-synth-precision_rtl.tcl" )

my_rm( ["uw_tmp*_modelnotmatched.rep"] )

# rename files whose names are generated automatically by 'synthesize'
my_mv( "uw_tmp/mult.v"  , "uw_tmp/mult_logic.v", no_warn=True )
my_mv( "uw_tmp/mult.vhd", "uw_tmp/mult_logic.vhd", no_warn=True )

#--------------------------------------------------------------
# build shim architecture

xsys( "uw-shim mult GATE_MODE  MODGEN util.vhd mult.vhd", nofail=True )
xsys( "uw-shim mult LOGIC_MODE lstep util.vhd mult.vhd", nofail=True )

#--------------------------------------------------------------
# fix sdf file

xsys( "fix_sdf precision_rtl uw_tmp/mult_logic.sdf" )


