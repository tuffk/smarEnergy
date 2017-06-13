DROP DATABASE iothack;
CREATE DATABASE iothack;
USE iothack

CREATE TABLE HomeOwners(
  userid INTEGER,
  name VARCHAR(150),
  phone VARCHAR(10),
  PRIMARY KEY (userid)
);

CREATE TABLE Homes(
  homeid INTEGER,
  address VARCHAR(200),
  region VARCHAR(100),
  PRIMARY KEY (homeid)
);

CREATE TABLE Owns(
  userid INTEGER,
  homeid INTEGER,
  FOREIGN KEY (userid) REFERENCES HomeOwners(userid),
  FOREIGN KEY (homeid) REFERENCES Homes(homeid),
  PRIMARY KEY (userid, homeid)
);

CREATE TABLE ApplianceClass(
  applianceclassid INTEGER,
  PRIMARY KEY (applianceclassid)
);

CREATE TABLE Resources(
  resourceid INTEGER, 
  resourcename VARCHAR(50),
  PRIMARY KEY (resourceid)
);

CREATE TABLE ApplianceInstance(
  applianceinstanceid INTEGER,
  applianceclassid INTEGER NOT NULL,
  resourceid Integer NOT NULL,
  FOREIGN KEY (resourceid) REFERENCES Resources(resourceid),
  FOREIGN KEY (applianceclassid) REFERENCES ApplianceClass(applianceclassid),
  PRIMARY KEY (applianceinstanceid)
);

CREATE TABLE Contains(
  homeid INTEGER,
  applianceinstanceid INTEGER,
  FOREIGN KEY (homeid) REFERENCES HOMES(homeid),
  FOREIGN KEY (applianceinstanceid) REFERENCES ApplianceInstance(applianceinstanceid),
  PRIMARY KEY (homeid, applianceinstanceid)
);

CREATE TABLE ConsumptionEvent(
  ceid INTEGER,
  starttime TIMESTAMP NULL,
  endtime TIMESTAMP NULL,
  quantity VARCHAR(20),
  PRIMARY KEY (ceid)
);

CREATE TABLE PerformsA(
  ceid INTEGER,
  applianceinstanceid INTEGER,
  FOREIGN KEY (ceid) REFERENCES ConsumptionEvent(ceid),
  FOREIGN KEY (applianceinstanceid) REFERENCES ApplianceInstance(applianceinstanceid),
  PRIMARY KEY(ceid, applianceinstanceid)
);
