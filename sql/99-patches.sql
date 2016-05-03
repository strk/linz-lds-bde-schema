﻿--------------------------------------------------------------------------------
--
-- linz-lds-bde-schema
--
-- Copyright 2011 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the 
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Patches to apply to LDS system. Please note that the order of patches listed
-- in this file should be done sequentially i.e Newest patches go at the bottom
-- of the file. 
--------------------------------------------------------------------------------
SET client_min_messages TO WARNING;

SET search_path = lds, bde, public;

SELECT _patches.apply_patch(
    'BDE - 1.0.0: Apply BDE schema indexes',
    '
SET search_path = bde, lds, public;
-------------------------------------------------------------------------------
-- crs_action
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_act_aud_id ON crs_action USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_action_type
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_att_aud_id ON crs_action_type USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_adj_obs_change
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_aoc_aud_id ON crs_adj_obs_change USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_adj_user_coef
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_auc_aud_id ON crs_adj_user_coef USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_adjust_coef
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_adc_aud_id ON crs_adjust_coef USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_adjust_method
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_adm_aud_id ON crs_adjust_method USING btree (audit_id);
CREATE UNIQUE INDEX idx_adm_name ON crs_adjust_method USING btree (name);

-------------------------------------------------------------------------------
-- crs_adjustment_run
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_adj_aud_id ON crs_adjustment_run USING btree (audit_id);
CREATE INDEX fk_adj_adm ON crs_adjustment_run USING btree (adm_id);
CREATE INDEX fk_adj_wrk ON crs_adjustment_run USING btree (wrk_id);

-------------------------------------------------------------------------------
-- crs_adoption
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_adp_aud_id ON crs_adoption USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_affected_parcl
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_afp_aud_id ON crs_affected_parcl USING btree (audit_id);
CREATE INDEX fk_afp_par ON crs_affected_parcl USING btree (par_id);
CREATE INDEX fk_afp_sur ON crs_affected_parcl USING btree (sur_wrk_id);

-------------------------------------------------------------------------------
-- crs_alias
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_appellation
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_app_aud_id ON crs_appellation USING btree (audit_id);
CREATE INDEX fk_app_par ON crs_appellation USING btree (par_id);

-------------------------------------------------------------------------------
-- crs_comprised_in
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_coordinate
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_coo_aud_id ON crs_coordinate USING btree (audit_id);
CREATE INDEX fk_coo_cor ON crs_coordinate USING btree (cor_id);
CREATE INDEX fk_coo_cos ON crs_coordinate USING btree (cos_id);
CREATE INDEX fk_coo_nod ON crs_coordinate USING btree (nod_id);

-------------------------------------------------------------------------------
-- crs_coordinate_sys
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_cos_aud_id ON crs_coordinate_sys USING btree (audit_id);
CREATE INDEX fk_cos_cot ON crs_coordinate_sys USING btree (cot_id);
CREATE INDEX fk_cos_dtm ON crs_coordinate_sys USING btree (dtm_id);

-------------------------------------------------------------------------------
-- crs_coordinate_tpe
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_cot_aud_id ON crs_coordinate_tpe USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_cor_precision
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_cop_aud_id ON crs_cor_precision USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_cord_order
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_cor_aud_id ON crs_cord_order USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_datum
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_dtm_aud_id ON crs_datum USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_elect_place
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_epl_aud_id ON crs_elect_place USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_ellipsoid
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_elp_aud_id ON crs_ellipsoid USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_enc_share
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_encumbrance
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_encumbrancee
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_estate_share
-------------------------------------------------------------------------------
CREATE INDEX fk_tle_ess ON crs_estate_share USING btree (ett_id);

-------------------------------------------------------------------------------
-- crs_feature_name
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_fen_aud_id ON crs_feature_name USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_geodetic_node_network
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_gnn_aud_id ON crs_geodetic_node_network USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_image
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_land_district
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_ldt_aud_id ON crs_land_district USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_legal_desc
-------------------------------------------------------------------------------
CREATE INDEX fk_lgd_ttl ON crs_legal_desc USING btree (ttl_title_no);
CREATE UNIQUE INDEX idx_lgd_aud_id ON crs_legal_desc USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_legal_desc_prl
-------------------------------------------------------------------------------
CREATE INDEX fk_rap_par ON crs_legal_desc_prl USING btree (par_id);
CREATE INDEX fk_rap_rar ON crs_legal_desc_prl USING btree (lgd_id);
CREATE UNIQUE INDEX idx_lgp_aud_id ON crs_legal_desc_prl USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_line
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_lin_aud_id ON crs_line USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_locality
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_loc_aud_id ON crs_locality USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_maintenance
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_mnt_aud_id ON crs_maintenance USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_map_grid
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_map_aud_id ON crs_map_grid USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mark
-------------------------------------------------------------------------------
CREATE INDEX fk_mrk_nod ON crs_mark USING btree (nod_id);
CREATE UNIQUE INDEX idx_mrk_aud_id ON crs_mark USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mark_name
-------------------------------------------------------------------------------
CREATE INDEX fk_mkn_mrk ON crs_mark_name USING btree (mrk_id);
CREATE UNIQUE INDEX idx_mkn_aud_id ON crs_mark_name USING btree (audit_id);
CREATE INDEX idx_mkn_type_code ON crs_mark_name USING btree (type) WHERE UPPER(type) = ''CODE'';
CREATE INDEX idx_mkn_type ON crs_mark_name USING btree ("type");

-------------------------------------------------------------------------------
-- crs_mark_sup_doc
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_msd_aud_id ON crs_mark_sup_doc USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mesh_blk
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_mbk_aud_id ON crs_mesh_blk USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mesh_blk_area
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_mba_aud_id ON crs_mesh_blk_area USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mesh_blk_bdry
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_mbb_aud_id ON crs_mesh_blk_bdry USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mesh_blk_line
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_mbl_aud_id ON crs_mesh_blk_line USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mesh_blk_place
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_mpr_aud_id ON crs_mesh_blk_place USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_mrk_phys_state
-------------------------------------------------------------------------------
CREATE INDEX fk_mps_mrk ON crs_mrk_phys_state USING btree (mrk_id);
CREATE INDEX fk_mps_wrk ON crs_mrk_phys_state USING btree (wrk_id);
CREATE UNIQUE INDEX idx_mps_aud_id ON crs_mrk_phys_state USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_network_plan
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_nwp_aud_id ON crs_network_plan USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_node
-------------------------------------------------------------------------------
CREATE INDEX fk_nod_cos ON crs_node USING btree (cos_id_official);
CREATE INDEX fk_nod_sit ON crs_node USING btree (sit_id);
CREATE UNIQUE INDEX idx_nod_aud_id ON crs_node USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_node_prp_order
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_npo_aud_id ON crs_node_prp_order USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_node_works
-------------------------------------------------------------------------------
CREATE INDEX idx_now_purpose ON crs_node_works USING btree (purpose);
CREATE UNIQUE INDEX idx_now_aud_id ON crs_node_works USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_nominal_index
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_obs_accuracy
-------------------------------------------------------------------------------
CREATE INDEX fk_oba_obn2 ON crs_obs_accuracy USING btree (obn_id1);
CREATE UNIQUE INDEX idx_oba_aud_id ON crs_obs_accuracy USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_obs_elem_type
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_oet_aud_id ON crs_obs_elem_type USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_obs_set
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_obs_aud_id ON crs_obs_set USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_obs_type
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_obt_aud_id ON crs_obs_type USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_observation
-------------------------------------------------------------------------------
CREATE INDEX fk_obn_cos ON crs_observation USING btree (cos_id);
CREATE INDEX fk_obn_obt ON crs_observation USING btree (obt_type, obt_sub_type);
CREATE INDEX fk_obn_stp1 ON crs_observation USING btree (stp_id_local);
CREATE INDEX fk_obn_vct ON crs_observation USING btree (vct_id);
CREATE UNIQUE INDEX idx_obn_aud_id ON crs_observation USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_off_cord_sys
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_ocs_aud_id ON crs_off_cord_sys USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_office
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_ofc_aud_id ON crs_office USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_ordinate_adj
-------------------------------------------------------------------------------
CREATE INDEX fk_orj_coo_output ON crs_ordinate_adj USING btree (coo_id_output);
CREATE INDEX idx_orj_adj_coo ON crs_ordinate_adj USING btree (adj_id, coo_id_output);
CREATE UNIQUE INDEX idx_orj_aud_id ON crs_ordinate_adj USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_ordinate_type
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_ort_aud_id ON crs_ordinate_type USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_parcel
-------------------------------------------------------------------------------
CREATE INDEX idx_par_nonsurvey_def ON crs_parcel USING btree (nonsurvey_def);
CREATE UNIQUE INDEX idx_par_aud_id ON crs_parcel USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_parcel_bndry
-------------------------------------------------------------------------------
CREATE INDEX fk_pab_lin ON crs_parcel_bndry USING btree (lin_id);
CREATE INDEX fk_pab_pri ON crs_parcel_bndry USING btree (pri_id);
CREATE UNIQUE INDEX idx_pab_aud_id ON crs_parcel_bndry USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_parcel_dimen
-------------------------------------------------------------------------------
CREATE INDEX fk_pdi_obn ON crs_parcel_dimen USING btree (obn_id);
CREATE INDEX fk_pdi_par ON crs_parcel_dimen USING btree (par_id);
CREATE UNIQUE INDEX idx_pdi_aud_id ON crs_parcel_dimen USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_parcel_label
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_plb_aud_id ON crs_parcel_label USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_parcel_ring
-------------------------------------------------------------------------------
CREATE INDEX fk_pri_par ON crs_parcel_ring USING btree (par_id);
CREATE UNIQUE INDEX idx_pri_aud_id ON crs_parcel_ring USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_programme
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_pgm_aud_id ON crs_programme USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_proprietor
-------------------------------------------------------------------------------
CREATE INDEX fk_ess_prp ON crs_proprietor USING btree (ets_id);

-------------------------------------------------------------------------------
-- crs_reduct_meth
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_rdm_aud_id ON crs_reduct_meth USING btree (audit_id);
CREATE UNIQUE INDEX idx_rdm_name ON crs_reduct_meth USING btree (name);

-------------------------------------------------------------------------------
-- crs_reduct_run
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_rdn_aud_id ON crs_reduct_run USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_ref_survey
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_rsu_aud_id ON crs_ref_survey USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_road_ctr_line
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_rcl_aud_id ON crs_road_ctr_line USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_road_name
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_rna_aud_id ON crs_road_name USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_road_name_asc
-------------------------------------------------------------------------------
CREATE INDEX fk_rns_rcl ON crs_road_name_asc USING btree (rcl_id);
CREATE INDEX fk_rns_rna ON crs_road_name_asc USING btree (rna_id);
CREATE UNIQUE INDEX idx_rns_aud_id ON crs_road_name_asc USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_setup
-------------------------------------------------------------------------------
CREATE INDEX fk_stp_wrk ON crs_setup USING btree (wrk_id);
CREATE UNIQUE INDEX idx_stp_aud_id ON crs_setup USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_site
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_sit_aud_id ON crs_site USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_site_locality
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_slo_aud_id ON crs_site_locality USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_stat_act_parcl
-------------------------------------------------------------------------------
CREATE INDEX fk_sap_par ON crs_stat_act_parcl USING btree (par_id);
CREATE UNIQUE INDEX fk_sap_aud ON crs_stat_act_parcl USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_stat_version
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_sav_aud_id ON crs_stat_version USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_statist_area
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_stt_aud_id ON crs_statist_area USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_statute
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_ste_ak1 ON crs_statute USING btree (section, name_and_date);
CREATE UNIQUE INDEX idx_ste_aud_id ON crs_statute USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_statute_action
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_sta_aud_id ON crs_statute_action USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_street_address
-------------------------------------------------------------------------------
CREATE INDEX fk_sad_rna ON crs_street_address USING btree (rna_id);
CREATE UNIQUE INDEX idx_sad_aud_id ON crs_street_address USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_sur_admin_area
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_saa_aud_id ON crs_sur_admin_area USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_sur_plan_ref
-------------------------------------------------------------------------------
CREATE INDEX fk_wrk_id ON crs_sur_plan_ref USING btree (wrk_id);

-------------------------------------------------------------------------------
-- crs_survey
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_sur_idx ON crs_survey USING btree (dataset_id, dataset_series, ldt_loc_id, dataset_suffix);
CREATE UNIQUE INDEX idx_sur_aud_id ON crs_survey USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_survey_image
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_sim_aud_id ON crs_survey_image USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_sys_code
-------------------------------------------------------------------------------
CREATE INDEX fk_sco_scg ON crs_sys_code USING btree (scg_code);
CREATE UNIQUE INDEX fk_sco_scg_code ON crs_sys_code USING btree (scg_code, code);
CREATE UNIQUE INDEX idx_sco_aud_id ON crs_sys_code USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_sys_code_group
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_scg_aud_id ON crs_sys_code_group USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_title
-------------------------------------------------------------------------------
CREATE INDEX fk_ttl_psd ON crs_title USING btree (protect_start);
CREATE INDEX fk_ttl_ped ON crs_title USING btree (protect_end);
CREATE UNIQUE INDEX idx_ttl_aud_id ON crs_title USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_title_action
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_tta_aud_id ON crs_title_action USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_title_estate
-------------------------------------------------------------------------------
CREATE INDEX fk_ett_lgd ON crs_title_estate USING btree (lgd_id);
CREATE INDEX fk_ttl_ett ON crs_title_estate USING btree (ttl_title_no);

-------------------------------------------------------------------------------
-- crs_title_mem_text
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_tmt_aud_id ON crs_title_mem_text USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_title_memorial
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_topology_class
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_top_aud_id ON crs_topology_class USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_transact_type
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_crs_tran_desc ON crs_transact_type USING btree (grp, description, "type");
CREATE UNIQUE INDEX idx_trt_aud_id ON crs_transact_type USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_ttl_enc
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_ttl_hierarchy
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_ttl_inst
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- crs_ttl_inst_title
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_tnt_aud_id ON crs_ttl_inst_title USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_unit_of_meas
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_uom_aud_id ON crs_unit_of_meas USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_user
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_usr_aud_id ON crs_user USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_vector
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_vct_ak1 ON crs_vector USING btree ("type", nod_id_start, nod_id_end);
CREATE UNIQUE INDEX idx_vct_aud_id ON crs_vector USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_vertx_sequence
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX idx_vts_aud_id ON crs_vertx_sequence USING btree (audit_id);

-------------------------------------------------------------------------------
-- crs_work
-------------------------------------------------------------------------------
CREATE INDEX fk_wrk_cos ON crs_work USING btree (cos_id);
CREATE UNIQUE INDEX idx_wrk_aud_id ON crs_work USING btree (audit_id);

-------------------------------------------------------------------------------
-- cbe_title_parcel_association
-------------------------------------------------------------------------------
CREATE UNIQUE INDEX ak_ctpa_ttlpar ON cbe_title_parcel_association USING btree (ttl_title_no, par_id);

'
);

SELECT _patches.apply_patch(
    'BDE - 1.2.0: Create tables for the LDS aspatial release',
    '
DO $$
BEGIN
SET search_path = lds, bde, public;

--------------------------------------------------------------------------------
-- LDS table all_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS all_parcels CASCADE;

CREATE TABLE all_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0)
);
PERFORM AddGeometryColumn(''all_parcels'', ''shape'', 4167, ''GEOMETRY'', 2);

ALTER TABLE all_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_all_par_shape ON all_parcels USING gist (shape);

ALTER TABLE all_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE all_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE all_parcels TO bde_admin;
GRANT SELECT ON TABLE all_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table all_parcels
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS all_linear_parcels CASCADE;

CREATE TABLE all_linear_parcels (
    id INTEGER NOT NULL,
    appellation VARCHAR(2048),
    affected_surveys VARCHAR(2048),
    parcel_intent VARCHAR(100) NOT NULL,
    topology_type VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    statutory_actions VARCHAR(4096),
    land_district VARCHAR(100) NOT NULL,
    titles VARCHAR(32768),
    survey_area NUMERIC(20, 4),
    calc_area NUMERIC(20, 0)
);
PERFORM AddGeometryColumn(''all_linear_parcels'', ''shape'', 4167, ''GEOMETRY'', 2);

ALTER TABLE all_linear_parcels ADD PRIMARY KEY (id);
CREATE INDEX shx_all_line_par_shape ON all_linear_parcels USING gist (shape);

ALTER TABLE all_linear_parcels OWNER TO bde_dba;

REVOKE ALL ON TABLE all_linear_parcels FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE all_linear_parcels TO bde_admin;
GRANT SELECT ON TABLE all_linear_parcels TO bde_user;

--------------------------------------------------------------------------------
-- LDS table parcel_stat_actions
--------------------------------------------------------------------------------

CREATE TABLE parcel_stat_actions (
    id INTEGER NOT NULL,
    par_id INTEGER NOT NULL,
    status VARCHAR(10) NOT NULL,
    action VARCHAR(20) NOT NULL,
    statutory_action VARCHAR(1024)
);

ALTER TABLE parcel_stat_actions ADD PRIMARY KEY (id);

ALTER TABLE parcel_stat_actions OWNER TO bde_dba;

REVOKE ALL ON TABLE parcel_stat_actions FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE parcel_stat_actions TO bde_admin;
GRANT SELECT ON TABLE parcel_stat_actions TO bde_user;

--------------------------------------------------------------------------------
-- LDS table affected_parcel_surveys
--------------------------------------------------------------------------------

CREATE TABLE affected_parcel_surveys (
    id INTEGER NOT NULL,
    par_id INTEGER NOT NULL,
    sur_wrk_id INTEGER NOT NULL,
    action VARCHAR(12)
);

ALTER TABLE affected_parcel_surveys ADD PRIMARY KEY (id);

ALTER TABLE affected_parcel_surveys OWNER TO bde_dba;

REVOKE ALL ON TABLE affected_parcel_surveys FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE affected_parcel_surveys TO bde_admin;
GRANT SELECT ON TABLE affected_parcel_surveys TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_parcel_associations
--------------------------------------------------------------------------------

CREATE TABLE title_parcel_associations (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    par_id INTEGER NOT NULL,
    source VARCHAR(8) NOT NULL
);

ALTER TABLE title_parcel_associations ADD PRIMARY KEY (id);

ALTER TABLE title_parcel_associations OWNER TO bde_dba;

REVOKE ALL ON TABLE title_parcel_associations FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_parcel_associations TO bde_admin;
GRANT SELECT ON TABLE title_parcel_associations TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_estates
--------------------------------------------------------------------------------

CREATE TABLE title_estates (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    type VARCHAR(255),
    share VARCHAR(100) NOT NULL,
    purpose VARCHAR(255),
    timeshare_week_no VARCHAR(20),
    term VARCHAR(255),
    legal_description VARCHAR(2048),
    area BIGINT
);

ALTER TABLE title_estates ADD PRIMARY KEY (id);

ALTER TABLE title_estates OWNER TO bde_dba;

REVOKE ALL ON TABLE title_estates FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_estates TO bde_admin;
GRANT SELECT ON TABLE title_estates TO bde_user;

--------------------------------------------------------------------------------
-- LDS table titles_aspatial
--------------------------------------------------------------------------------

DROP TABLE IF EXISTS titles_aspatial CASCADE;

CREATE TABLE titles_aspatial (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    status VARCHAR(50) NOT NULL,
    register_type VARCHAR(50) NOT NULL, 
    type VARCHAR(100) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    guarantee_status VARCHAR(100) NOT NULL,
    provisional CHAR(1) NOT NULL,
    title_no_srs VARCHAR(20),
    title_no_head_srs VARCHAR(20),
    survey_reference VARCHAR(50),
    maori_land CHAR(1),
    number_owners INT8 NOT NULL
);

ALTER TABLE titles_aspatial ADD PRIMARY KEY (id);

ALTER TABLE titles_aspatial OWNER TO bde_dba;

REVOKE ALL ON TABLE titles_aspatial FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE titles_aspatial TO bde_admin;
GRANT SELECT ON TABLE titles_aspatial TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_owners_aspatial
--------------------------------------------------------------------------------

DROP TABLE IF EXISTS title_owners_aspatial CASCADE;

CREATE TABLE title_owners_aspatial (
    id INTEGER NOT NULL,
    tte_id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    estate_share VARCHAR(100) NOT NULL,
    owner_type VARCHAR(10) NOT NULL,
    prime_surname VARCHAR(100),
    prime_other_names VARCHAR(100),
    corporate_name VARCHAR(250),
    name_suffix VARCHAR(6)
);

ALTER TABLE title_owners_aspatial ADD PRIMARY KEY (id);

ALTER TABLE title_owners_aspatial OWNER TO bde_dba;

REVOKE ALL ON TABLE title_owners_aspatial FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_owners_aspatial TO bde_admin;
GRANT SELECT ON TABLE title_owners_aspatial TO bde_user;

-- only enable versioning if we already have versioned tables
IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'') THEN
    IF EXISTS (SELECT table_version.ver_get_versioned_tables()) THEN
        PERFORM table_version.ver_enable_versioning(''lds'', ''all_parcels'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''all_linear_parcels'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''parcel_stat_actions'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''affected_parcel_surveys'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''title_parcel_associations'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''title_estates'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''titles_aspatial'');
        PERFORM table_version.ver_enable_versioning(''lds'', ''title_owners_aspatial'');
    END IF;
END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.2.0: Fix spatial_extents_shared constraint',
    '
DO $PATCH$
BEGIN
    ALTER TABLE lds.titles
       ALTER COLUMN spatial_extents_shared DROP NOT NULL;

    ALTER TABLE lds.titles_plus
       ALTER COLUMN spatial_extents_shared DROP NOT NULL;

    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'') THEN
        IF table_version.ver_is_table_versioned(''lds'', ''titles'') THEN
            ALTER TABLE table_version.lds_titles_revision 
               ALTER COLUMN spatial_extents_shared DROP NOT NULL;
        END IF;
    
        IF table_version.ver_is_table_versioned(''lds'', ''titles_plus'') THEN
            ALTER TABLE table_version.lds_titles_plus_revision 
               ALTER COLUMN spatial_extents_shared DROP NOT NULL;
        END IF;
    END IF;
END;
$PATCH$
'
);

--------------------------------------------------------------------------------
-- Need to truncate obs tables because the shape vertex order will update about
-- 15 million rows. Because this layer is not in production yet, this is the
-- most efficient way of dealing with this change.
--------------------------------------------------------------------------------

SELECT _patches.apply_patch(
    'BDE - 1.2.0: Fix observation shape vertex order to be the same as observation direction',
    ARRAY[
    'CREATE OR REPLACE FUNCTION _patches.__truncate_versioned_table(p_schema VARCHAR, p_table VARCHAR) RETURNS void AS $FUNC$
    DECLARE
        v_versioned BOOLEAN;
    BEGIN
        IF EXISTS (select true from pg_tables
                    where tablename = p_table
                    and schemaname = p_schema)
        THEN
            IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
                AND table_version.ver_is_table_versioned(p_schema, p_table)
            THEN
                v_versioned := TRUE;
                PERFORM table_version.ver_disable_versioning(p_schema, p_table);
            END IF;
            
            EXECUTE ''TRUNCATE '' || p_schema || ''.'' || p_table;
            
            IF v_versioned THEN
                PERFORM table_version.ver_enable_versioning(p_schema, p_table);
            END IF;
        END IF;
    END;
    $FUNC$ LANGUAGE plpgsql;',
    'SELECT _patches.__truncate_versioned_table(''lds''::VARCHAR, ''survey_observations''::VARCHAR);',
    'SELECT _patches.__truncate_versioned_table(''lds''::VARCHAR, ''survey_arc_observations''::VARCHAR);',
    'DROP FUNCTION _patches.__truncate_versioned_table(VARCHAR, VARCHAR);'
    ]
);

SELECT _patches.apply_patch(
    'BDE - 1.2.4: Apply table version functions that we missed as part of 85ee4a219a',
    '
DO $PATCH$
DECLARE
    v_schema_name TEXT;
    v_table_name  TEXT;
    v_key_column  TEXT;
    v_diff_proc   TEXT;
    v_ver_proc    TEXT;
BEGIN
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'') THEN
        FOR
            v_schema_name,
            v_table_name,
            v_key_column,
            v_diff_proc,
            v_ver_proc
        IN
            SELECT 
                TBL.schema_name,
                TBL.table_name,
                TBL.key_column,
                table_version._ver_get_diff_function(TBL.schema_name, TBL.table_name) as diff_proc,
                table_version._ver_get_revision_function(TBL.schema_name, TBL.table_name) as rev_proc
            FROM
                table_version.ver_get_versioned_tables() AS TBL
        LOOP
            EXECUTE ''DROP FUNCTION IF EXISTS '' || v_diff_proc;
            EXECUTE ''DROP FUNCTION IF EXISTS '' || v_ver_proc;
            PERFORM table_version.ver_create_table_functions(v_schema_name, v_table_name, v_key_column);
        END LOOP;
    END IF;
END;
$PATCH$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.2.4: Recreate title estate and owners tables to include status columns',
    '
DO $$
BEGIN

SET search_path = lds, bde, public;

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''lds'', ''title_estates'')
THEN
    PERFORM table_version.ver_disable_versioning(''lds'', ''title_estates'');
END IF;

DROP TABLE IF EXISTS title_estates CASCADE;

CREATE TABLE title_estates (
    id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    type VARCHAR(255),
    share VARCHAR(100) NOT NULL,
    purpose VARCHAR(255),
    timeshare_week_no VARCHAR(20),
    term VARCHAR(255),
    legal_description VARCHAR(2048),
    area BIGINT
);

ALTER TABLE title_estates ADD PRIMARY KEY (id);

ALTER TABLE title_estates OWNER TO bde_dba;

REVOKE ALL ON TABLE title_estates FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_estates TO bde_admin;
GRANT SELECT ON TABLE title_estates TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_owners_aspatial
--------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND table_version.ver_is_table_versioned(''lds'', ''title_owners_aspatial'')
THEN
    PERFORM table_version.ver_disable_versioning(''lds'', ''title_owners_aspatial'');
END IF;

DROP TABLE IF EXISTS title_owners_aspatial CASCADE;

CREATE TABLE title_owners_aspatial (
    id INTEGER NOT NULL,
    tte_id INTEGER NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    status VARCHAR(25) NOT NULL,
    estate_share VARCHAR(100) NOT NULL,
    owner_type VARCHAR(10) NOT NULL,
    prime_surname VARCHAR(100),
    prime_other_names VARCHAR(100),
    corporate_name VARCHAR(250),
    name_suffix VARCHAR(6)
);

ALTER TABLE title_owners_aspatial ADD PRIMARY KEY (id);

ALTER TABLE title_owners_aspatial OWNER TO bde_dba;

REVOKE ALL ON TABLE title_owners_aspatial FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_owners_aspatial TO bde_admin;
GRANT SELECT ON TABLE title_owners_aspatial TO bde_user;

-- only enable versioning if we already have versioned tables
IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND EXISTS (SELECT table_version.ver_get_versioned_tables())
THEN
    PERFORM table_version.ver_enable_versioning(''lds'', ''title_owners_aspatial'');
    PERFORM table_version.ver_enable_versioning(''lds'', ''title_estates'');
END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.2.5: Recreate table version functions to fix diff functions',
    '
DO $PATCH$
DECLARE
    v_schema_name TEXT;
    v_table_name  TEXT;
    v_key_column  TEXT;
    v_diff_proc   TEXT;
    v_ver_proc    TEXT;
BEGIN
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'') THEN
        FOR
            v_schema_name,
            v_table_name,
            v_key_column,
            v_diff_proc,
            v_ver_proc
        IN
            SELECT 
                TBL.schema_name,
                TBL.table_name,
                TBL.key_column,
                table_version._ver_get_diff_function(TBL.schema_name, TBL.table_name) as diff_proc,
                table_version._ver_get_revision_function(TBL.schema_name, TBL.table_name) as rev_proc
            FROM
                table_version.ver_get_versioned_tables() AS TBL
        LOOP
            EXECUTE ''DROP FUNCTION IF EXISTS '' || v_diff_proc;
            EXECUTE ''DROP FUNCTION IF EXISTS '' || v_ver_proc;
            PERFORM table_version.ver_create_table_functions(v_schema_name, v_table_name, v_key_column);
        END LOOP;
    END IF;
END;
$PATCH$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.2.6: Add new street address schema for NZPost',
    '
DO $$
BEGIN

SET search_path = lds, bde, public;

DROP TABLE IF EXISTS street_address2 CASCADE;

CREATE TABLE street_address2
(
  id integer NOT NULL,
  rna_id integer NOT NULL,
  rcl_id integer NOT NULL,
  address VARCHAR(126) NOT NULL,
  house_number VARCHAR(25) NOT NULL,
  range_low integer NOT NULL,
  range_high integer,
  road_name VARCHAR(100) NOT NULL,
  locality VARCHAR(30),
  territorial_authority VARCHAR(255)
);

PERFORM AddGeometryColumn(''street_address2'', ''shape'', 4167, ''POINT'', 2);

ALTER TABLE street_address2 ADD PRIMARY KEY (id);

ALTER TABLE street_address2 OWNER TO bde_dba;

REVOKE ALL ON TABLE street_address2 FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE street_address2 TO bde_admin;
GRANT SELECT ON TABLE street_address2 TO bde_user;

-- only enable versioning if we already have versioned tables
IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND EXISTS (SELECT table_version.ver_get_versioned_tables())
THEN
    PERFORM table_version.ver_enable_versioning(''lds'', ''street_address2'');
END IF;

END;
$$
'
);


SELECT _patches.apply_patch(
    'BDE - 1.3.0: Fix control characters',
    '
DO $PATCH$
DECLARE
    
BEGIN
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''bde'', ''crs_parcel'')
    THEN
        UPDATE
            table_version.bde_crs_parcel_revision
        SET
            nonsurvey_def = replace(nonsurvey_def, E''\x03'', '''')
        WHERE
            id IN (
                3019663,
                3026667,
                3062540,
                3163214
            ) AND
            nonsurvey_def <> replace(nonsurvey_def, E''\x03'', '''');
    END IF;
    
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''bde'', ''crs_stat_act_parcl'')
    THEN
        UPDATE
           table_version.bde_crs_stat_act_parcl_revision 
        SET
            comments = replace(comments, E''\x03'', ''ā'')
        WHERE
            sta_id = 823843 AND
            comments <> replace(comments, E''\x03'', ''ā'');
    END IF;
    
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''lds'', ''parcel_stat_actions'')
    THEN
        UPDATE
            table_version.lds_parcel_stat_actions_revision
        SET
            statutory_action = replace(statutory_action, E''\x03'', ''ā'')
        WHERE
            id = 220742 AND
            statutory_action <> replace(statutory_action, E''\x03'', ''ā'');
    END IF;
    
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''lds'', ''primary_parcels'')
    THEN
        UPDATE
            table_version.lds_primary_parcels_revision
        SET
            statutory_actions = replace(statutory_actions, E''\x03'', ''ā'')
        WHERE
            id = 6959636 AND
            statutory_actions <> replace(statutory_actions, E''\x03'', ''ā'');
    END IF;
    
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''lds'', ''land_parcels'')
    THEN
        UPDATE
            table_version.lds_land_parcels_revision
        SET
            statutory_actions = replace(statutory_actions, E''\x03'', ''ā'')
        WHERE
            id = 6959636 AND
            statutory_actions <> replace(statutory_actions, E''\x03'', ''ā'');
    END IF;
    
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''lds'', ''all_parcels'')
    THEN
        UPDATE
            table_version.lds_all_parcels_revision
        SET
            statutory_actions = replace(statutory_actions, E''\x03'', ''ā'')
        WHERE
            id = 6959636 AND
            statutory_actions <> replace(statutory_actions, E''\x03'', ''ā'');
    END IF;
END;
$PATCH$
'
);


SELECT _patches.apply_patch(
    'BDE - 1.3.1: Update observation layers to contain the start and end mark name',
    '
DO $PATCH$
DECLARE
    v_versioned BOOLEAN;
BEGIN
    --------------------------------------------------------------------------------
    -- LDS table survey_observations
    --------------------------------------------------------------------------------
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''lds'', ''survey_observations'')
    THEN
        PERFORM table_version.ver_disable_versioning(''lds'', ''survey_observations'');
        v_versioned := true;
    END IF;
        
    DROP TABLE IF EXISTS lds.survey_observations CASCADE;
    
    CREATE TABLE lds.survey_observations (
        id integer NOT NULL,
        nod_id_start integer NOT NULL,
        mark_name_start VARCHAR(100), 
        nod_id_end integer NOT NULL,
        mark_name_end VARCHAR(100), 
        obs_type character varying(18) NOT NULL,
        value numeric(22,12) NOT NULL,
        value_accuracy numeric(22,12),
        value_label VARCHAR(10) NOT NULL,
        surveyed_type VARCHAR(10),
        coordinate_system VARCHAR(42) NOT NULL,
        land_district VARCHAR(14) NOT NULL,
        ref_datetime timestamp without time zone NOT NULL,
        survey_reference VARCHAR(50)
    );
    PERFORM AddGeometryColumn(''lds'', ''survey_observations'', ''shape'', 4167, ''LINESTRING'', 2);
    
    ALTER TABLE lds.survey_observations ADD PRIMARY KEY (id);
    CREATE INDEX shx_sur_obs_shape ON lds.survey_observations USING gist (shape);
    
    ALTER TABLE lds.survey_observations OWNER TO bde_dba;
    
    REVOKE ALL ON TABLE lds.survey_observations FROM PUBLIC;
    GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_observations TO bde_admin;
    GRANT SELECT ON TABLE lds.survey_observations TO bde_user;
    
    IF v_versioned THEN
        PERFORM table_version.ver_enable_versioning(''lds'', ''survey_observations'');
    END IF;
    
    --------------------------------------------------------------------------------
    -- LDS table survey_arc_observations
    --------------------------------------------------------------------------------
    v_versioned := false;
    IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
        AND table_version.ver_is_table_versioned(''lds'', ''survey_arc_observations'')
    THEN
        PERFORM table_version.ver_disable_versioning(''lds'', ''survey_arc_observations'');
        v_versioned := true;
    END IF;
    
    DROP TABLE IF EXISTS lds.survey_arc_observations CASCADE;
    CREATE TABLE lds.survey_arc_observations (
        id INTEGER NOT NULL,
        nod_id_start integer NOT NULL,
        mark_name_start VARCHAR(100),
        nod_id_end integer NOT NULL,
        mark_name_end VARCHAR(100),
        chord_bearing NUMERIC(22,12) NOT NULL,
        arc_length NUMERIC(22,12),
        arc_radius NUMERIC(22,12),
        arc_direction VARCHAR(4),
        chord_bearing_accuracy NUMERIC(22,12),
        arc_length_accuracy NUMERIC(22,12),
        surveyed_type VARCHAR(10),
        coordinate_system VARCHAR(42) NOT NULL,
        land_district VARCHAR(100) NOT NULL,
        ref_datetime TIMESTAMP NOT NULL,
        survey_reference VARCHAR(50),
        chord_bearing_label VARCHAR(10) NOT NULL,
        arc_length_label VARCHAR(10),
        arc_radius_label VARCHAR(10)
    );
    PERFORM AddGeometryColumn(''lds'', ''survey_arc_observations'', ''shape'', 4167, ''LINESTRING'', 2);
    
    ALTER TABLE lds.survey_arc_observations ADD PRIMARY KEY (id);
    CREATE INDEX shx_sur_arc_obs_shape ON lds.survey_arc_observations USING gist (shape);
    
    ALTER TABLE lds.survey_arc_observations OWNER TO bde_dba;
    
    REVOKE ALL ON TABLE lds.survey_arc_observations FROM PUBLIC;
    GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds.survey_arc_observations TO bde_admin;
    GRANT SELECT ON TABLE lds.survey_arc_observations TO bde_user;
    
    IF v_versioned THEN
        PERFORM table_version.ver_enable_versioning(''lds'', ''survey_arc_observations'');
    END IF;
END;
$PATCH$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.3.2: Add Titles Memorial Data',
    '
DO $$
BEGIN

SET search_path = lds, bde, public;

--------------------------------------------------------------------------------
-- LDS table title_memorials
--------------------------------------------------------------------------------
CREATE TABLE title_memorials
(
    id integer NOT NULL,
    title_no VARCHAR(20) NOT NULL,
    land_district VARCHAR(100) NOT NULL,
    memorial_text VARCHAR(18000),
    "current" BOOLEAN NOT NULL,
    instrument_number VARCHAR(30),
    instrument_lodged_datetime TIMESTAMP,
    instrument_type VARCHAR(100),
    encumbrancees VARCHAR(4096)
);

ALTER TABLE title_memorials ADD PRIMARY KEY (id);

ALTER TABLE title_memorials OWNER TO bde_dba;

REVOKE ALL ON TABLE title_memorials FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_memorials TO bde_admin;
GRANT SELECT ON TABLE title_memorials TO bde_user;

--------------------------------------------------------------------------------
-- LDS table title_memorial_additional_text
--------------------------------------------------------------------------------

-- index required to speed up creation of this table
CREATE INDEX tmt_col_1_text_idx ON crs_title_mem_text (col_1_text);

CREATE TABLE title_memorial_additional_text
(
    id integer NOT NULL,
    ttm_id integer NOT NULL,
    new_title_legal_description character varying(2048),
    new_title_reference character varying(2048),
    easement_type character varying(2048),
    servient_tenement character varying(2048),
    easement_area character varying(2048),
    dominant_tenement_or_grantee character varying(2048),
    statutory_restriction character varying(2048),
    principal_unit character varying(2048),
    future_development_unit character varying(2048),
    assessory_unit character varying(2048),
    title_issued character varying(2048)
);

ALTER TABLE title_memorial_additional_text ADD PRIMARY KEY (id);

ALTER TABLE title_memorial_additional_text OWNER TO bde_dba;

REVOKE ALL ON TABLE title_memorial_additional_text FROM PUBLIC;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE title_memorial_additional_text TO bde_admin;
GRANT SELECT ON TABLE title_memorial_additional_text TO bde_user;

-- only enable versioning if we already have versioned tables
IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'')
    AND EXISTS (SELECT table_version.ver_get_versioned_tables())
THEN
    PERFORM table_version.ver_enable_versioning(''lds'', ''title_memorial_additional_text'');
    PERFORM table_version.ver_enable_versioning(''lds'', ''title_memorials'');
END IF;

END;
$$
'
);


SELECT _patches.apply_patch(
    'BDE - 1.3.7: UTF8 mapping data for new street address layers',
    '
DO $PATCH$
BEGIN
    SET search_path=lds,public;

    CREATE TABLE lds_export_config
    (
      id SERIAL NOT NULL PRIMARY KEY,
      parameter TEXT NOT NULL,
      "key" TEXT,
      "value" TEXT
    );
    
    INSERT INTO lds_export_config (parameter, "value", "key") VALUES
    (''utf8_road_name.name'', ''Pōtaka Lane'', ''Potaka Lane [Spelling not official]''),
    (''utf8_road_name.name'', ''Pūrākaunui Road'', ''Purakaunui Road [Spelling not official]''),
    (''utf8_road_name.name'', ''Pūrākaunui School Road'', ''Purakaunui School Road [Spelling not official]''),
    (''utf8_road_name.name'', ''Pūrākaunui Station Road'', ''Purakaunui Station Road [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Plimmerton-Pāuatahanui'', ''Plimmerton-Pauatahanui [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Pāuatahanui-Judgeford'', ''Pauatahanui [Spelling not official]-Judgeford''),
    (''utf8_crs_road_name.location'', ''Paremata-Pāuatahanui'', ''Paremata-Pauatahanui [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Pāuatahanui-Haywards'', ''Pauatahanui [Spelling not official]-Haywards''),
    (''utf8_crs_road_name.location'', ''Takapūwāhia'', ''Takapuwahia [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Pāuatahanui'', ''Pauatahanui [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Rānui'', ''Ranui [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Pūrākaunui'', ''Purakaunui [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Pūrākaunui-Mihiwaka'', ''Purakaunui [Spelling not official]-Mihiwaka''),
    (''utf8_crs_road_name.location'', ''Rānui-Cannons Creek'', ''Ranui [Spelling not official]-Cannons Creek''),
    (''utf8_crs_road_name.location'', ''Tītahi Bay'', ''Titahi Bay [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Papakōwhai'', ''Papakowhai [Spelling not official]''),
    (''utf8_crs_road_name.location'', ''Porirua City-Titahi Bay [Spelling not official]'',''Porirua-Tītahi Bay'');
    
    ANALYSE lds_export_config;
END;
$PATCH$
'
);

-- TODO move this into download_admin_bdys packages.
SELECT _patches.apply_patch(
    'BDE - 1.3.7: Add admin_bdys schema for TA boundaries layers',
    '
    DO $PATCH$
    BEGIN
        IF NOT EXISTS(
            SELECT 1 FROM pg_namespace WHERE nspname = ''admin_bdys''
        )
        THEN
            EXECUTE ''CREATE SCHEMA admin_bdys AUTHORIZATION bde_dba'';
        END IF;
        
        GRANT ALL ON SCHEMA admin_bdys TO bde_dba;
        GRANT USAGE ON SCHEMA admin_bdys TO bde_admin;
        GRANT USAGE ON SCHEMA admin_bdys TO bde_user;
    END;
    $PATCH$;
'
);

-------------------------------------------------------------------------------
-- index and revision patch to be run last in update FBDE block
-------------------------------------------------------------------------------

SELECT _patches.apply_patch(
    'BDE - 1.4.0: Post Full Landonline revision build operation',
    '
	DO $$
	DECLARE
		v_schema NAME;
		v_table NAME;
		v_msg TEXT;
		v_rev_table TEXT;
	BEGIN
		SET search_path=bde_ext, lds, bde, bde_control, public;
        
        IF EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'') THEN
            PERFORM bde_ext.LDS_MaintainFBDELayers(-1);
            
            IF EXISTS (SELECT table_version.ver_get_versioned_tables()) THEN
                PERFORM table_version.ver_create_revision(''Initial revisioning for filtered full Landonline tables'');
                
                FOR v_schema, v_table IN
                    SELECT
                        NSP.nspname,
                        CLS.relname
                    FROM
                        pg_class CLS,
                        pg_namespace NSP
                    WHERE
                        CLS.relnamespace = NSP.oid AND
                        NSP.nspname IN (''bde_ext'') AND
                        CLS.relkind = ''r''
                    ORDER BY
                        1, 2
                LOOP
                    v_msg := ''Versioning table '' || v_schema || ''.'' || v_table;
                    RAISE NOTICE ''%'', v_msg;
                    
                    BEGIN
                        PERFORM table_version.ver_enable_versioning(v_schema, v_table);
                    EXCEPTION
                        WHEN others THEN
                            RAISE EXCEPTION ''Error versioning %.%. ERROR: %'', v_schema, v_table, SQLERRM;
                    END;
        
                    SELECT table_version.ver_get_version_table_full(v_schema, v_table)
                    INTO v_rev_table;
        
                    EXECUTE ''GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE '' || v_rev_table || '' TO bde_admin'';
                    EXECUTE ''GRANT SELECT ON TABLE '' || v_rev_table || '' TO bde_user'';
                END LOOP;
                
                PERFORM table_version.ver_complete_revision();
            END IF;
        END IF;
	END;
	$$;
');


SELECT _patches.apply_patch(
    'BDE - 1.4.2: Increase field width for street address and road layers, fix bad UTF8 config entry',
    '
    DO $$
    DECLARE
        v_version_ext  BOOLEAN;
    BEGIN

    v_version_ext := EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'');
    
    IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''street_address2'') THEN
        PERFORM table_version.ver_versioned_table_change_column_type(''lds'', ''street_address2'', ''locality'', ''VARCHAR(100)'');
    ELSE
        ALTER TABLE lds.street_address2 ALTER COLUMN locality TYPE VARCHAR(100);
    END IF;
    
    IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''road_centre_line_subsection'') THEN
        PERFORM table_version.ver_versioned_table_change_column_type(''lds'', ''road_centre_line_subsection'', ''locality'', ''VARCHAR(100)'');
    ELSE
        ALTER TABLE lds.road_centre_line_subsection ALTER COLUMN locality TYPE VARCHAR(100);
    END IF;
    
    IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''road_centre_line'') THEN
        PERFORM table_version.ver_versioned_table_change_column_type(''lds'', ''road_centre_line'', ''locality'', ''VARCHAR(100)'');
    ELSE
        ALTER TABLE lds.road_centre_line ALTER COLUMN locality TYPE VARCHAR(100);
    END IF;
    
    DELETE FROM lds_export_config
    WHERE parameter = ''utf8_crs_road_name.location''
    AND   "value" = ''Porirua City-Titahi Bay [Spelling not official]''
    AND   "key" = ''Porirua-Tītahi Bay'';
    
    INSERT INTO lds_export_config (parameter, "key", "value") VALUES
    (''utf8_crs_road_name.location'', ''Porirua City-Titahi Bay [Spelling not official]'',''Porirua-Tītahi Bay'');
    
    END;
    $$
  '
);

SELECT _patches.apply_patch(
    'BDE - 1.4.3: Apply correct rights to lds_export_config',
    '
DO $PATCH$
BEGIN
    SET search_path=lds,public;
    ALTER TABLE lds_export_config OWNER TO bde_dba;
    GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE lds_export_config TO bde_admin;
    GRANT SELECT ON TABLE lds_export_config TO bde_user;
END;
$PATCH$
'
);


SELECT _patches.apply_patch(
    'BDE - 1.5.0: Add UTF8 columns for address and roading simple datasets',
    '
DO $$
DECLARE
    v_version_ext  BOOLEAN;
BEGIN

v_version_ext := EXISTS (SELECT * FROM pg_available_extensions WHERE name = ''table_version'');

IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''road_centre_line_subsection'') THEN
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''road_centre_line_subsection'', ''name_utf8'', ''VARCHAR(100)'');
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''road_centre_line_subsection'', ''other_names_utf8'', ''VARCHAR(255)'');
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''road_centre_line_subsection'', ''locality_utf8'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE lds.road_centre_line_subsection ADD COLUMN name_utf8 VARCHAR(100);
    ALTER TABLE lds.road_centre_line_subsection ADD COLUMN other_names_utf8 VARCHAR(255);
    ALTER TABLE lds.road_centre_line_subsection ADD COLUMN locality_utf8 VARCHAR(100);
END IF;

IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''road_centre_line'') THEN
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''road_centre_line'', ''name_utf8'', ''VARCHAR(100)'');
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''road_centre_line'', ''locality_utf8'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE lds.road_centre_line ADD COLUMN name_utf8 VARCHAR(100);
    ALTER TABLE lds.road_centre_line ADD COLUMN locality_utf8 VARCHAR(100);
END IF;

IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''railway_centre_line'') THEN
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''railway_centre_line'', ''name_utf8'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE lds.railway_centre_line ADD COLUMN name_utf8 VARCHAR(100);
END IF;

IF v_version_ext AND table_version.ver_is_table_versioned(''lds'', ''street_address2'') THEN
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''street_address2'', ''road_name_utf8'', ''VARCHAR(100)'');
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''street_address2'', ''address_utf8'', ''VARCHAR(126)'');
    PERFORM table_version.ver_versioned_table_add_column(''lds'', ''street_address2'', ''locality_utf8'', ''VARCHAR(100)'');
ELSE
    ALTER TABLE lds.street_address2 ADD COLUMN road_name_utf8 VARCHAR(100);
    ALTER TABLE lds.street_address2 ADD COLUMN address_utf8 VARCHAR(126);
    ALTER TABLE lds.street_address2 ADD COLUMN locality_utf8 VARCHAR(100);
END IF;

END;
$$
'
);

SELECT _patches.apply_patch(
    'BDE - 1.5.4: Change owners column from Varchar to Text to avoid data overflows',
    '
DO $PATCH$
BEGIN
    IF table_version.ver_is_table_versioned(''lds'', ''titles_plus'') THEN
        PERFORM table_version.ver_versioned_table_change_column_type(''lds'', ''titles_plus'', ''owners'', ''TEXT'');
    ELSE
        ALTER TABLE lds.titles_plus ALTER COLUMN owners SET DATA TYPE TEXT;
    END IF;
END;
$PATCH$
'
);