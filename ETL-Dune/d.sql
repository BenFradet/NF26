echo off

prompt
prompt ==========RAZ==========
@d_reset.sql

prompt
prompt ==========EXCEPTIONS==========
@d_exceptions.sql

prompt
prompt ==========BDE==========
@extraction/d_bde.sql

prompt
prompt ==========BDT==========
@transformation/d_bdt.sql

prompt
prompt ==========DW==========
@loading/d_dw.sql

prompt
prompt ==========BDE to BDT==========
@d_bde_to_bdt.sql

prompt
prompt ==========BDT to DW==========
@d_bdt_to_dw.sql
