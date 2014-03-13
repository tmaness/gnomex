use gnomex;

-- Add RNA prep type
DROP TABLE IF EXISTS `gnomex`.`RNAPrepType`;
CREATE TABLE `gnomex`.`RNAPrepType` (
  `codeRNAPrepType` VARCHAR(10) NOT NULL,
  `rnaPrepType` VARCHAR(100) NULL,
  `isActive` CHAR(1) NULL,
  PRIMARY KEY (`codeRNAPrepType`)
)
ENGINE = INNODB;


-- RNA Prep type on request
alter table Request add codeRNAPrepType varchar(10) NULL;
alter table Request add 
  CONSTRAINT `FK_Request_RNAPrepType` FOREIGN KEY `FK_Request_RNAPrepType` (`codeRNAPrepType`)
    REFERENCES `gnomex`.`RNAPrepType` (`codeRNAPrepType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
alter table Request add includeBisulfideConversion CHAR(1) null;  

-- add foreign key constraint from Request to Lab
alter table Request add 
  CONSTRAINT `FK_Request_Lab` FOREIGN KEY `FK_Request_Lab` (`idLab`)
    REFERENCES `gnomex`.`Lab` (`idLab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
 
DROP TABLE IF EXISTS `gnomex`.`ContextSensitiveHelp`;
CREATE TABLE `gnomex`.`ContextSensitiveHelp` (
  `idContextSensitiveHelp` INT(10) NOT NULL AUTO_INCREMENT, 
  `context1` VARCHAR(100) NOT NULL,
  `context2` VARCHAR(100),
  `context3` VARCHAR(100),
  `helpText` VARCHAR(10000) NULL,
  `toolTipText` VARCHAR(10000) NULL,
  PRIMARY KEY (`idContextSensitiveHelp`)
)
ENGINE = INNODB;

-- Default help 
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('annotationTabAddHelp', '1', '', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">If you wish to add a custom characteristic</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">which does not exist in the list, simply type</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">it&apos;s name in the box at the left and press </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">the Add Annotation button.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">If you wish to add a more advanced characteristic,</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">such as one incorporating a dropdown of choices,</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">please click the Edit annotations link.  In the resulting</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">window you can add checkboxes, dropdown boxes,</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">multiple choice dropdown boxes and more.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">For a characteristic not in the list, enter </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">a value in the box to the left and press </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">the Add Annotation button.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Click for more help.</FONT></P></TEXTFORMAT>');
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('annotationTabHelp', '1', '', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">Instructions</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">1.  Optional: Characteristics that are listed on this page can be used </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">      to provide additional annotation of your samples on a subsequent </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">       screen. Please select any characteristics that you would like to </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">       annotate  by clicking on the appropriate box(es).</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">2.  After completing all line items, click the &apos;Next&apos; button at the bottom </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="9" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">     of the page to proceed.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">You may add custom characteristics to your samples</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Click for more help.</FONT></P></TEXTFORMAT>');
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('experimentInternalSetupHelp', '1', '', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0"><B>Instructions</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1. Select the dropdown or radio button options for each line.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">2. After completing all line items, click the &apos;Next&apos; button at the</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">    bottom of the page to proceed.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">3. The account selected from this work request will be</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">     electronically billed following the completion of the work.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">This set of screens will guide you through creating</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">an experiment.  Throughout the process hovering </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">over or pressing the information icon will give </FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">you more help.</FONT></P></TEXTFORMAT>');
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('multiplexGroupNumber', '1', '', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Group together those samples that will be grouped together in one lane.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Example:</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1   A</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1   B</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">2   C</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">3   D</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">A and B are in group 1, C is in group 2 and D is in group 3.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">Group together those samples that will be grouped together in one lane.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">Example:</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">1   A</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">1   B</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">2   C</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">3   D</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">A and B are in group 1, C is in group 2 and D is in group 3.</FONT></P></TEXTFORMAT>');
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('samplesTabHelp', '1', 'HISEQ', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Instructions</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1.  Mandatory: Fill in the following highlighted fields:  sample name(Max 30 characters), label, and concentration.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">2.  Optional: Any annotation characteristic that you selected from the previous screen appears on this screen</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">      as a highlighted column. Please type desired information under the highlighted field with the annotation header.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">3.  After completing all line items, click the &apos;Next&apos; button at the bottom of the page to proceed.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">You may also upload a sample sheet.  Please see the &quot;Sample sheet help&quot; for more help.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Instructions</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1.  Mandatory: Fill in the following highlighted fields:  sample name(Max 30 characters), label, and concentration.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">2.  Optional: Any annotation characteristic that you selected from the previous screen appears on this screen</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">      as a highlighted column. Please type desired information under the highlighted field with the annotation header.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">3.  After completing all line items, click the &apos;Next&apos; button at the bottom of the page to proceed.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">You may also upload a sample sheet.  Please see the &quot;Sample sheet help&quot; for more help.</FONT></P></TEXTFORMAT>');
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('samplesTabHelp', '1', 'MICROARRAY', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Instructions</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1. Mandatory: Fill in the following highlighted fields: sample name and concentration</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">2. Optional: Any annotation characteristic that you selected from teh previous screen appears on this screen</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">    as a highlighted column.  Please type desired information under the highlighted field with the annotation header.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">3. After completing all line items, click the &apos;Next&apos; button at the bottom of the page to proceed.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">1. Mandatory: Fill in the following highlighted fields: sample name and concentration</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">2. Optional: Any annotation characteristic that you selected from teh previous screen appears on this screen</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">    as a highlighted column.  Please type desired information under the highlighted field with the annotation header.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">3. After completing all line items, click the &apos;Next&apos; button at the bottom of the page to proceed.</FONT></P></TEXTFORMAT>');
INSERT INTO ContextSensitiveHelp(context1, context2, context3, helpText, toolTipText) values('samplesTabHelp', '1', 'QC', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">Instructions</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">1. Mandatory: Fill in the following highlighted fields: sample name and concentration.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="0">2. After completing all line items, click the &apos;Next&apos; button at the bottom of the page toproceed.</FONT></P></TEXTFORMAT>', '<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">1. Mandatory: Fill in the following highlighted fields: sample name and concentration.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Open Sans" SIZE="12" COLOR="#2E2D2C" LETTERSPACING="0" KERNING="1">2. After completing all line items, click the &apos;Next&apos; button at the bottom of the page toproceed.</FONT></P></TEXTFORMAT>');
