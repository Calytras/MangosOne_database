-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '03'; 
    SET @cOldContent = '016';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '03';
    SET @cNewContent = '017';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix_GameEvents';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix_GameEvents';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
		
UPDATE `game_event` set start_time='2022-06-21 10:00:00', end_time='2037-12-31 08:00:00' where entry=1; -- Midsummer Fire Festival
UPDATE `game_event` set start_time='2022-12-15 15:00:00', end_time='2037-12-31 08:00:00' where entry=2; -- Feast of Winter Veil
UPDATE `game_event` set start_time='2022-02-06 08:01:00', end_time='2037-12-31 08:00:00' where entry=3; -- Darkmoon Faire (Terokkar Forest
UPDATE `game_event` set start_time='2022-03-06 08:01:00', end_time='2037-12-31 08:00:00' where entry=4; -- Darkmoon Faire (Elwynn Forest
UPDATE `game_event` set start_time='2022-01-02 08:01:00', end_time='2037-12-31 08:00:00' where entry=5; -- Darkmoon Faire (Mulgore
UPDATE `game_event` set start_time='2022-12-31 20:00:00', end_time='2037-12-31 08:00:00' where entry=6; -- New Year's Eve
UPDATE `game_event` set start_time='2022-01-23 09:00:00', end_time='2037-12-31 08:00:00' where entry=7; -- Lunar Festival
UPDATE `game_event` set start_time='2022-02-06 09:00:00', end_time='2037-12-31 08:00:00' where entry=8; -- Love is in the Air
UPDATE `game_event` set start_time='2022-12-25 08:00:00', end_time='2037-12-31 08:00:00' where entry=9; -- Feast of Winter Veil - Presents
UPDATE `game_event` set start_time='2022-05-01 10:00:00', end_time='2037-12-31 08:00:00' where entry=10; -- Children's Week 
UPDATE `game_event` set start_time='2022-09-06 10:00:00', end_time='2037-12-31 08:00:00' where entry=11; -- Harvest Festival
UPDATE `game_event` set start_time='2022-10-18 11:00:00', end_time='2037-12-31 08:00:00', occurence=525600  where entry=12; -- Hallow's End
UPDATE `game_event` set start_time='0000-00-00 00:00:00', end_time='0000-00-00 00:00:00' where entry=13; -- Elemental Invasions
UPDATE `game_event` set start_time='2022-01-04 18:00:00', end_time='2037-12-31 08:00:00' where entry=14; -- Stranglethorn Fishing Extravaganza - Announce
UPDATE `game_event` set start_time='2022-01-04 22:00:00', end_time='2037-12-31 08:00:00' where entry=15; -- Stranglethorn Fishing Extravaganza
UPDATE `game_event` set start_time='2022-08-04 23:00:00', end_time='2037-12-31 08:00:00' where entry=16; -- Gurubashi Arena Booty Run
UPDATE `game_event` set start_time='0000-00-00 00:00:00', end_time='0000-00-00 00:00:00' where entry=17; -- Scourge Invasion
UPDATE `game_event` set start_time='2022-01-14 09:00:00', end_time='2037-12-31 08:00:00' where entry=18; -- Call to Arms: Alterac Valley!
UPDATE `game_event` set start_time='2022-01-21 09:00:00', end_time='2037-12-31 08:00:00' where entry=19; -- Call to Arms: Warsong Gulch!
UPDATE `game_event` set start_time='2022-01-28 09:00:00', end_time='2037-12-31 08:00:00' where entry=20; -- Call to Arms: Arathi Basin!
UPDATE `game_event` set start_time='2022-01-07 09:00:00', end_time='2037-12-31 08:00:00' where entry=21; -- Call to Arms: Eye of the Storm!
UPDATE `game_event` set start_time='0000-00-00 00:00:00', end_time='0000-00-00 00:00:00' where entry=22; -- AQ War Effort
UPDATE `game_event` set start_time='2022-09-20 10:00:00', end_time='2037-12-31 08:00:00' where entry=26; -- Brewfest
UPDATE `game_event` set start_time='2022-01-02 05:00:00', end_time='2037-12-31 08:00:00' where entry=27; -- Nights
UPDATE `game_event` set start_time='2022-04-24 10:00:00', end_time='2037-12-31 08:00:00' where entry=28; -- Noblegarden
UPDATE `game_event` set start_time='2022-12-28 05:00:00', end_time='2037-12-31 08:00:00' where entry=29; -- Edge of Madness, Gri'lek
UPDATE `game_event` set start_time='2022-01-11 05:00:00', end_time='2037-12-31 08:00:00' where entry=30; -- Edge of Madness, Hazza'rah
UPDATE `game_event` set start_time='2022-01-25 05:00:00', end_time='2037-12-31 08:00:00' where entry=31; -- Edge of Madness, Renataki
UPDATE `game_event` set start_time='2022-12-14 05:00:00', end_time='2037-12-31 08:00:00' where entry=32; -- Edge of Madness, Wushoolay
UPDATE `game_event` set start_time='0000-00-00 00:00:00', end_time='0000-00-00 00:00:00' where entry=33; -- Arena Tournament
UPDATE `game_event` set start_time='2022-10-22 09:00:00', end_time='2037-10-24 09:00:00' where entry=34; -- L70ETC Concert - Terrokar Forest (Blizzcon Event
UPDATE `game_event` set start_time='2022-01-04 22:00:00', end_time='2037-12-31 08:00:00' where entry=36; -- Stranglethorn Fishing Extravaganza - Turn-in
UPDATE `game_event` set start_time='2022-03-03 08:01:00', end_time='2037-12-31 08:00:00' where entry=41; -- Darkmoon Faire (Elwynn Forest - Building Stage 1
UPDATE `game_event` set start_time='2022-03-04 08:01:00', end_time='2037-12-31 08:00:00' where entry=42; -- Darkmoon Faire (Elwynn Forest - Building Stage 2
UPDATE `game_event` set start_time='2022-02-03 08:01:00', end_time='2037-12-31 07:00:00' where entry=43; -- Darkmoon Faire (Terokkar Forest - Building Stage 1
UPDATE `game_event` set start_time='2022-02-04 08:01:00', end_time='2037-12-31 07:00:00' where entry=44; -- Darkmoon Faire (Terokkar Forest - Building Stage 2
UPDATE `game_event` set start_time='2022-01-01 08:00:00', end_time='2037-12-31 07:00:00' where entry=45; -- Brew of the Month - January
UPDATE `game_event` set start_time='2022-02-01 08:00:00', end_time='2037-12-31 07:00:00' where entry=46; -- Brew of the Month - February
UPDATE `game_event` set start_time='2022-03-01 08:00:00', end_time='2037-12-31 07:00:00' where entry=47; -- Brew of the Month - March
UPDATE `game_event` set start_time='2022-04-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=48; -- Brew of the Month - April
UPDATE `game_event` set start_time='2022-05-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=49; -- Brew of the Month - May
UPDATE `game_event` set start_time='2022-06-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=50; -- Brew of the Month - June
UPDATE `game_event` set start_time='2022-07-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=51; -- Brew of the Month - July
UPDATE `game_event` set start_time='2022-08-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=52; -- Brew of the Month - August
UPDATE `game_event` set start_time='2022-09-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=53; -- Brew of the Month - September
UPDATE `game_event` set start_time='2022-10-01 09:00:00', end_time='2037-12-31 07:00:00' where entry=54; -- Brew of the Month - October
UPDATE `game_event` set start_time='2022-11-01 07:00:00', end_time='2037-12-31 07:00:00' where entry=55; -- Brew of the Month - November
UPDATE `game_event` set start_time='2022-12-01 08:00:00', end_time='2037-12-31 07:00:00' where entry=56; -- Brew of the Month - December
UPDATE `game_event` set start_time='2022-01-01 10:48:00', end_time='2037-12-31 08:00:00' where entry=57; -- World's End Tavern - Perry Gatner Announce
UPDATE `game_event` set start_time='2022-01-01 11:00:00', end_time='2037-12-31 08:00:00' where entry=58; -- World's End Tavern - Perry Gatner Standup Comedy
UPDATE `game_event` set start_time='2022-01-01 11:48:00', end_time='2037-12-31 08:00:00' where entry=59; -- World's End Tavern - L70ETC Concert Announce
UPDATE `game_event` set start_time='2022-01-01 09:00:00', end_time='2037-12-31 08:00:00' where entry=60; -- World's End Tavern - L70ETC Concert
UPDATE `game_event` set start_time='2022-01-01 08:58:00', end_time='2037-12-31 08:00:00' where entry=61; -- Stormwind City - Stockades Jail Break
UPDATE `game_event` set start_time='2022-12-30 08:01:00', end_time='2037-12-31 07:00:00' where entry=62; -- Darkmoon Faire (Mulgore - Building Stage 1
UPDATE `game_event` set start_time='2022-12-31 08:01:00', end_time='2037-12-31 07:00:00' where entry=63; -- Darkmoon Faire (Mulgore - Building Stage 2
UPDATE `game_event` set start_time='2022-01-02 03:48:00', end_time='2037-12-31 08:00:00' where entry=64; -- Grim Guzzler - L70ETC Pre-Concert
UPDATE `game_event` set start_time='2022-01-02 04:00:00', end_time='2037-12-31 08:00:00' where entry=65; -- Grim Guzzler - L70ETC Concert

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;


