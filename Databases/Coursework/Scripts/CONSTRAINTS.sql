ALTER TABLE WORKSHOP ADD CONSTRAINT WORKSHOP_ID_PK PRIMARY KEY (ID);

ALTER TABLE SECTOR ADD CONSTRAINT SECTOR_ID_PK PRIMARY KEY (ID);

ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_ID_PK PRIMARY KEY (ID);

ALTER TABLE TEST ADD CONSTRAINT TEST_ID_PK PRIMARY KEY (ID);

ALTER TABLE PRODUCT_TYPE ADD CONSTRAINT PRODUCT_TYPE_ID_PK PRIMARY KEY (ID);

ALTER TABLE PRODUCT_ATTRIBUTE ADD CONSTRAINT PRODUCT_ATTRIBUTE_ID_PK PRIMARY KEY (ID);

ALTER TABLE BRIGADE ADD CONSTRAINT BRIGADE_ID_PK PRIMARY KEY (ID);

ALTER TABLE SECTOR_OPERATION ADD CONSTRAINT SECTOR_OPERATION_ID_PK PRIMARY KEY (ID);

ALTER TABLE WORKER ADD CONSTRAINT WORKER_ID_PK PRIMARY KEY (ID);

ALTER TABLE POSITION ADD CONSTRAINT POSITION_ID_PK PRIMARY KEY (ID);

ALTER TABLE POSITION_ATTRIBUTE ADD CONSTRAINT POSITION_ATTRIBUTE_ID_PK PRIMARY KEY (ID);

ALTER TABLE TEST_LAB ADD CONSTRAINT TEST_LAB_ID_PK PRIMARY KEY (ID);

ALTER TABLE  WORKSHOP  ADD CONSTRAINT  WORKSHOP_FK0  FOREIGN KEY ( WORKSHOP_CHIEF_ID ) REFERENCES WORKER( ID );

ALTER TABLE  SECTOR  ADD CONSTRAINT  SECTOR_FK0  FOREIGN KEY ( SECTOR_CHIEF_ID ) REFERENCES WORKER( ID );
ALTER TABLE  SECTOR  ADD CONSTRAINT  SECTOR_FK1  FOREIGN KEY ( MASTER_ID ) REFERENCES WORKER( ID );
ALTER TABLE  SECTOR  ADD CONSTRAINT  SECTOR_FK2  FOREIGN KEY ( WORKSHOP_ID ) REFERENCES WORKSHOP( ID );

ALTER TABLE  PRODUCT  ADD CONSTRAINT  PRODUCT_FK0  FOREIGN KEY ( TYPE_ID ) REFERENCES PRODUCT_TYPE( ID );
ALTER TABLE  PRODUCT  ADD CONSTRAINT  PRODUCT_FK1  FOREIGN KEY ( ATTRIBUTE_ID ) REFERENCES PRODUCT_ATTRIBUTE( ID );

ALTER TABLE  TEST  ADD CONSTRAINT  TEST_FK0  FOREIGN KEY ( TEST_LAB_ID ) REFERENCES TEST_LAB( ID );
ALTER TABLE  TEST  ADD CONSTRAINT  TEST_FK1  FOREIGN KEY ( TEST_PRODUCT_ID ) REFERENCES PRODUCT( ID );

ALTER TABLE  PRODUCT_TYPE  ADD CONSTRAINT  PRODUCT_TYPE_FK0  FOREIGN KEY ( WORKSHOP_ID ) REFERENCES WORKSHOP( ID );


ALTER TABLE  BRIGADE  ADD CONSTRAINT  BRIGADE_FK0  FOREIGN KEY ( BRIGADIER_ID ) REFERENCES WORKER( ID );
ALTER TABLE  BRIGADE  ADD CONSTRAINT  BRIGADE_FK1  FOREIGN KEY ( OPERATION_ID ) REFERENCES SECTOR_OPERATION( ID );

ALTER TABLE  SECTOR_OPERATION  ADD CONSTRAINT  SECTOR_OPERATION_FK0  FOREIGN KEY ( SECTOR_ID ) REFERENCES SECTOR( ID );
ALTER TABLE  SECTOR_OPERATION  ADD CONSTRAINT  SECTOR_OPERATION_FK1  FOREIGN KEY ( BRIGADE_ID ) REFERENCES BRIGADE( ID );
ALTER TABLE  SECTOR_OPERATION  ADD CONSTRAINT  SECTOR_OPERATION_FK2  FOREIGN KEY ( OP_PRODUCT_ID ) REFERENCES PRODUCT( ID );

ALTER TABLE  WORKER  ADD CONSTRAINT  WORKER_FK0  FOREIGN KEY ( POSITION_ID ) REFERENCES POSITION( ID );
ALTER TABLE  WORKER  ADD CONSTRAINT  WORKER_FK1  FOREIGN KEY ( BRIGADE_ID ) REFERENCES BRIGADE( ID );
ALTER TABLE  WORKER  ADD CONSTRAINT  WORKER_FK2  FOREIGN KEY (TEST_LAB_ID) REFERENCES TEST_LAB(ID);

ALTER TABLE  POSITION  ADD CONSTRAINT  POSITION_FK0  FOREIGN KEY ( ATTRIBUTE_ID ) REFERENCES POSITION_ATTRIBUTE( ID );


ALTER TABLE  WORKSHOP_TESTLAB  ADD CONSTRAINT  WORKSHOP_TESTLAB_FK0  FOREIGN KEY ( WORKSHOP_ID ) REFERENCES WORKSHOP( ID );
ALTER TABLE  WORKSHOP_TESTLAB  ADD CONSTRAINT  WORKSHOP_TESTLAB_FK1  FOREIGN KEY ( TEST_LAB_ID ) REFERENCES TEST_LAB( ID );

ALTER TABLE  WORKER_ATTRIBUTE  ADD CONSTRAINT  WORKER_ATTRIBUTE_FK0  FOREIGN KEY ( WORKER_ID ) REFERENCES WORKER( ID );
ALTER TABLE  WORKER_ATTRIBUTE  ADD CONSTRAINT  WORKER_ATTRIBUTE_FK1  FOREIGN KEY ( ATTRIBUTE_ID ) REFERENCES POSITION_ATTRIBUTE( ID );
