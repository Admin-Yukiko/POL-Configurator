unit polcfgedit;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Dialogs, ComCtrls,
  StdCtrls, StrUtils, typinfo, ExtCtrls, ActnList, IniFiles, FileUtil,
  Zipper, externprogsel, Process, WinDirs, ShellAPI, ShFolder;

type

  { TPOLConfigurator }
    TPOLConfigurator = class(TForm)
    ActHelpKey: TAction;
    ActTabBackExecute: TAction;
    ActTabForwardExecute: TAction;
    ActionList1: TActionList;
    AddServerBtn: TButton;
    AssertionFailureActionComboBox: TComboBox;
    Autocompilebydefault: Tcheckbox;
    Button1: TButton;
    AllowedEnvironmentVariablesAccessEdit: TEdit;
    ClearClientFiles: TButton;
    Logo: TImage;
    Label5: TLabel;
    UOConvertSelect: TComboBox;
    VerbosityLevelEdit: TEdit;
    EmParseTreeCacheSizeEdit: TEdit;
    IncParseTreeCacheSizeEdit: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    ShowWarningCursorSequence: TCheckBox;
    EnableWorldMapPackets: TCheckBox;
    Edit1: TEdit;
    RequiredFilesPresentCheckBox: TCheckBox;
    RequiedFilesCheckBoxLabel: TLabel;
    Welcome: TTabSheet;
    ErrorOnFileCaseMissmatch: TCheckBox;
    CoreIgnoresDefenceCaps: TCheckBox;
    LoginServerTimeoutEdit: TEdit;
    ExternalBtn2: TButton;
    ExternalBtn3: TButton;
    ExternalBtn4: TButton;
    ExternalBtn5: TButton;
    ExternalBtn6: TButton;
    ExternalBtn7: TButton;
    ExternalBtn8: TButton;
    EditModeCheckBox: TCheckBox;
    ExternalBtn1: TButton;
    CopyUOPsOnlyCheckBox: TCheckBox;
    DeleteUOPsCheckBox: TCheckBox;
    CopyUOFilesGroupBox: TGroupBox;
    DataSaveGroupBox: TGroupBox;
    ExternalProgramsGroupBox: TGroupBox;
    Label4: TLabel;
    ShowWarningGump: TCheckBox;
    ShowWarningItem: TCheckBox;
    ExpansionSettingsGroupBox: TGroupBox;
    CoreHandledGroupBox: TGroupBox;
    CharRangesGroupBox: TGroupBox;
    BattleSettingsGroupBox: TGroupBox;
    ContainerSettingsGroupBox: TGroupBox;
    CharacterSettingsGroupBox: TGroupBox;
    AssertionBehaviourGroupBox: TGroupBox;
    DebugLogFileGroupBox: TGroupBox;
    CPProfileLogGroupBox: TGroupBox;
    DecaySettingsGroupBox: TGroupBox;
    CompileGroupBox: TGroupBox;
    eCompileDirGroupBox: TGroupBox;
    eCompileCFGSettingsGroupBox: TGroupBox;
    SettingsChangedLabel: TLabel;
    Label8: TLabel;
    POLCleanupGroupBox: TGroupBox;
    StatusBar1: TStatusBar;
    TagsDisplayedGroup: TGroupBox;
    Label17: TLabel;
    POLLogFileGroupBox: TGroupBox;
    ReportingBehaviourGroupBox: TGroupBox;
    PrintToConsoleGroupBox: TGroupBox;
    MovementSettingsGroupBox: TGroupBox;
    SpeedHackGroupBox: TGroupBox;
    MiscSettingsGroupBox: TGroupBox;
    MaxSettingsGroupBox: TGroupBox;
    PathSettingsGroupBox: TGroupBox;
    HiddenPage: TTabSheet;
    TilesGroupBox: TGroupBox;
    MapGenGroupBox: TGroupBox;
    Label109: TLabel;
    RepackUOPBtn: TButton;
    ClearWorldDataBtn: TButton;
    UOPMULGroupBox: TGroupBox;
    WebserverGroupBox: TGroupBox;
    ListenersGroupBox: TGroupBox;
    LoginAndTimeouts: TGroupBox;
    Label118: TLabel;
    KeepClientsCheckBox: TCheckBox;
    FileCopyProgLabel: TLabel;
    CopyingFileLabel: TLabel;
    FileCopyReport: TLabel;
    ListenerListSelectComboBox: TComboBox;
    ListenerNameEdit: TEdit;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    FileCopyProgBar: TProgressBar;
    UpdateServerBtn: TButton;
    AddListenerBtn: TButton;
    AoSResistancesCheckBox: TCheckBox;
    ListenerPortEdit: TEdit;
    ListenerEncryptionEdit: TEdit;
    SaveListenerBtn: TButton;
    RemoveListenerBtn: TButton;
    ServersGroupBox: TGroupBox;
    Label110: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    UOCServerStrEdit: TEdit;
    UOCServerIntEdit: TEdit;
    UOCServerDexEdit: TEdit;
    UOCServerHPEdit: TEdit;
    UOCServerManaEdit: TEdit;
    UOCServerStamEdit: TEdit;
    UOCClientStrEdit: TEdit;
    UOCClientIntEdit: TEdit;
    UOCClientDexEdit: TEdit;
    UOCClientHPEdit: TEdit;
    UOCClientManaEdit: TEdit;
    UOCClientStamEdit: TEdit;
    Label107: TLabel;
    Label108: TLabel;
    UOClientMaxSkillIDEdit: TEdit;
    UOClientGroupBox: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label115: TLabel;
    RemoveServerBtn: TButton;
    ServerIPEdit: TEdit;
    ServerListSelectComboBox: TComboBox;
    ServerNameEdit: TEdit;
    POLBrowseBtn: TButton;
    BrowsePkgRoot: Tbutton;
    BuildFilesBtn: Tbutton;
    BuildMultisCheckBox: Tcheckbox;
    BuildTilesCheckBox: Tcheckbox;
    BuildLandtilesCheckBox: Tcheckbox;
    BuildFelucca: Tcheckbox;
    AddProfileBtn: TButton;
    ServerPortEdit: TEdit;
    UpdateProfileBtn: TButton;
    DeleteProfileBtn: TButton;
    Label102: TLabel;
    NewProfile: TEdit;
    LoadProfileBtn: TButton;
    Label101: TLabel;
    Profiles: TComboBox;
    DefaultAccessibleRange: TEdit;
    NumberOfThreads: TEdit;
    Label100: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    LogInSettingsTab: TTabSheet;
    UsePOLRoot: TButton;
    CopyClientFilesBtn: Tbutton;
    RunPOLBtn: Tbutton;
    TestLaunchPOLBtn: Tbutton;
    DoRemoveFiles: Tbutton;
    RemoveOptional: Tedit;
    RemoveECL: TCheckBox;
    RemoveDEP: TCheckBox;
    RemoveLST: TCheckBox;
    RemoveDBG: TCheckBox;
    RemoveDBGTXT: Tcheckbox;
    RemoveBAK: TCheckBox;
    RemoveLOG: Tcheckbox;
    RemoveCustom: Tcheckbox;
    ExtractMULsBtn: Tbutton;
    DeleteOldMULs: TCheckBox;
    CompileAllToLogBtn: Tbutton;
    Compileasppages: Tcheckbox;
    CompileUpdatedBtn: Tbutton;
    Delpkg: Tbutton;
    Displaysummary: Tcheckbox;
    Displayuptodatescripts: Tcheckbox;
    Displaywarnings: Tcheckbox;
    EcompileSwitchesEdit: Tedit;
    EcompileWithSwitchesBtn: Tbutton;
    Erroronwarning: Tcheckbox;
    Generatedebuginfo: Tcheckbox;
    Generatedebugtextinfo: Tcheckbox;
    Generatedependencyinfo: Tcheckbox;
    Generatelisting: Tcheckbox;
    Includebrowse: Tbutton;
    Includedirectory: Tedit;
    Label88: Tlabel;
    Label90: Tlabel;
    Label91: Tlabel;
    Label92: Tlabel;
    Label93: Tlabel;
    Label95: Tlabel;
    Label96: Tlabel;
    PkgRootList: Tlistbox;
    MapSizeCombo: Tcombobox;
    Label94: Tlabel;
    Documentation: Tmemo;
    Modulebrowse: Tbutton;
    Moduledirectory: Tedit;
    Onlycompileupdatedscripts: Tcheckbox;
    Optimizeobjectmembers: Tcheckbox;
    Paranoiawarnings: Tcheckbox;
    Polscriptroot: Tedit;
    Polscriptrootbrowse: Tbutton;
    Selallfacets: Tcheckbox;
    Selallusedif: Tcheckbox;
    EcompileTab: Ttabsheet;
    Threadedcompilation: Tcheckbox;
    UOBrowseBtn: Tbutton;
    Uodir: Tedit;
    Updateonlyonautocompile: Tcheckbox;
    UseFeluccaDif: Tcheckbox;
    BuildTrammel: TCheckBox;
    UseTrammelDif: TCheckBox;
    BuildIlshenar: TCheckBox;
    UseIlshenarDif: TCheckBox;
    BuildFacetsBtn: Tbutton;
    BuildMalas: Tcheckbox;
    UseMalasDif: TCheckBox;
    BuildTokuno: Tcheckbox;
    UseTokunoDif: TCheckBox;
    BuildTermur: Tcheckbox;
    UseTermurDif: Tcheckbox;
    Checkgroup1: Tcheckgroup;
    ProfileScripts: Tcheckbox;
    Combat: Tcheckbox;
    Label61: Tlabel;
    SpdHackMRMSLabel: Tlabel;
    SpdHackMWMSLabel: Tlabel;
    SpdHackFRMSLabel: Tlabel;
    SpdHackFWMSLabel: Tlabel;
    Label66: Tlabel;
    Label69: Tlabel;
    Label70: Tlabel;
    Label71: Tlabel;
    Label72: Tlabel;
    Label73: Tlabel;
    Label74: Tlabel;
    Label75: Tlabel;
    Label76: Tlabel;
    Label77: Tlabel;
    Label78: Tlabel;
    DecayMinutesLabel: Tlabel;
    ContSlotsLabel: Tlabel;
    Label81: Tlabel;
    Label82: Tlabel;
    Label83: Tlabel;
    Profilecprops: Tcheckbox;
    DocViewTab: Ttabsheet;
    FacetsTab: Ttabsheet;
    Threaddecaystatistics: Tcheckbox;
    ThreadStacktracesWhenStuck: TCheckBox;
    UseWinLFH: TCheckBox;
    LoadMyConfigFilesBtn: TButton;
    LoadDefaultsBtn: TButton;
    DebugLevelEdit: TEdit;
    DebugLevelLabel: TLabel;
    WorldDataPathBrowse: TButton;
    UODataPathBrowse: TButton;
    RealmPathBrowse: TButton;
    PidPathBrowse: TButton;
    CacheInteractiveScripts: TCheckBox;
    AllowMultiClientsPerAccount: TCheckBox;
    AttackWhileFrozen: TCheckBox;
    DisplayTitleGuild: TCheckBox;
    DisplayFrozen: TCheckBox;
    DisplayParalyzed: TCheckBox;
    DisplaySquelched: TCheckBox;
    DisplayDeafened: TCheckBox;
    UOFSiege: TCheckBox;
    UOFNPCPopup: TCheckBox;
    UOFeatureCheckBoxGrp: TCheckGroup;
    SendAttackMsg: TCheckBox;
    SendDamagePacket: TCheckBox;
    SingleCombat: TCheckBox;
    WarModeDelay: TEdit;
    Label58: TLabel;
    WarmodeInhibitsRegen: TCheckBox;
    DisplayParrySuccessMessages: TCheckBox;
    MobilesBlockNpcMovement: TCheckBox;
    HonorUnequipScriptOnDeath: TCheckBox;
    UseContainerSlots: TCheckBox;
    ReportURLEdit: TEdit;
    CrashURLLabel: TLabel;
    ReportServerEdit: TEdit;
    CrashServerLabel: TLabel;
    ReportAdminEmailEdit: TEdit;
    CrashEmailLabel: TLabel;
    ReportCrashsAutomatically: TCheckBox;
    SingleThreadDecay: TCheckBox;
    DiscardOldEvents: TCheckBox;
    ShutdownSaveTypeLabel: TLabel;
    ShutdownSaveTypeComboBox: TComboBox;
    DisplayUnknownPackets: TCheckBox;
    Label22: TLabel;
    Label23: TLabel;
    MaxCallDepth: TEdit;
    ReportCriticalScripts: TCheckBox;
    ReportRunToCompletionScripts: TCheckBox;
    RunawayScriptThreshold: TEdit;
    ShowRealmInfo: TCheckBox;
    ShowSpeechColors: TCheckBox;
    TimestampEveryLine: TCheckBox;
    CountResourceTiles: TCheckBox;
    PidFilePathEdit: TEdit;
    Label50: TLabel;
    UOFeatureEnable: TEdit;
    CoreGuildMessages: TCheckBox;
    CoreHandledLocks: TCheckBox;
    CoreHitSounds: TCheckBox;
    CoreSendsCaps: TCheckBox;
    CoreSendsSeason: TCheckBox;
    DefaultLightLevel: TEdit;
    DefaultContainerMaxItems: TEdit;
    DefaultContainerMaxWeight: TEdit;
    ItemColorMask: TEdit;
    EventVisibilityCoreChecks: TCheckBox;
    ForceNewObjCachePackets: TCheckBox;
    DebugLocalOnlyCheckbox: TCheckBox;
    DebugPasswordEdit: TEdit;
    DebugPortEdit: TEdit;
    DumpStackOnAssertionFailure: TCheckBox;
    EnableAssertions: TCheckBox;
    EnableDebugLogCheckbox: TCheckBox;
    LogLevelLabel: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    DebugPortLabel: TLabel;
    DebugPwLabel: TLabel;
    AssertFailActionLabel: TLabel;
    AssertMaxDumpTypeLabel: TLabel;
    LogLevelEdit: TEdit;
    LogScriptCycles: TCheckBox;
    LogSysLoad: TCheckBox;
    MaxPathFindRange: TEdit;
    Label45: TLabel;
    MiniDumpTypeComboBox: TComboBox;
    ReportMissingConfigsCheckbox: TCheckBox;
    ScriptedAttackChecks: TCheckBox;
    ScriptedMerchantHandlers: TCheckBox;
    SendStatLocks: TCheckBox;
    SendSwingPacket: TCheckBox;
    SeperateSpeechTokens: TCheckBox;
    LoggingReportingTab: TTabSheet;
    AllowSecureTradingInWarMode: TCheckBox;
    AllowMovingTrade: TCheckBox;
    DefaultAttributeCap: TEdit;
    MaxContainerSlots: TEdit;
    Label43: TLabel;
    MaxContSlotsLabel: TLabel;
    SpeedHackFootWalkDelayEdit: TEdit;
    SpeedHackFootRunDelayEdit: TEdit;
    SpeedHackMountWalkDelayEdit: TEdit;
    SpeedHackMountRunDelayEdit: TEdit;
    SpdHackMountRunLabel: TLabel;
    SpdHackMountWlkLabel: TLabel;
    SpdHackFootRunLabel: TLabel;
    SpdHackFootWlkLabel: TLabel;
    SpeedhackPreventionCheckBox: TCheckBox;
    InvulTag: TComboBox;
    Label38: TLabel;
    SupportFaces: TComboBox;
    Label37: TLabel;
    ResetSwingOnTurn: TCheckBox;
    HiddenTurnsCount: TCheckBox;
    TotalStatsAtCreation: TEdit;
    Label36: TLabel;
    MovementUsesStamina: TCheckBox;
    DecayItems: TCheckBox;
    DefaultDecayTime: TEdit;
    DefaultCharacterHeight: TEdit;
    CarryingCapacityMod: TEdit;
    DefaultDoubleclickRange: TEdit;
    DoubleClickWait: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    ItemDecayLabel: TLabel;
    UseTileFlagPrefix: TCheckBox;
    VerboseCheckbox: TCheckBox;
    WatchMapCache: TCheckBox;
    WatchRPM: TCheckBox;
    WatchSysLoad: TCheckBox;
    WebServerDebug: TCheckBox;
    YellRange: TEdit;
    WhisperRange: TEdit;
    SpeechRange: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    PrivacyPaperdoll: TCheckBox;
    StartingGold: TEdit;
    Label18: TLabel;
    NewbieStartingEquipment: TCheckBox;
    WebServerPasswordEdit: TEdit;
    MaxObjtype: TEdit;
    Label27: TLabel;
    MaxTileID: TEdit;
    Label24: TLabel;
    UseSingleThreadLogin: TCheckBox;
    DisableNagle: TCheckBox;
    EnforceMountObjtype: TCheckBox;
    WorldDataPathEdit: TEdit;
    AccountDataSaveEdit: TEdit;
    IgnoreLoadErrors: TCheckBox;
    InhibitSavesCheckBox: TCheckBox;
    Label2: TLabel;
    Label25: TLabel;
    AcctDataSaveLabel: TLabel;
    Label3: TLabel;
    WebserverPortLabel: TLabel;
    WebserverPasswordLabel: TLabel;
    RealmDataPathEdit: TEdit;
    RetainCleartextPasswords: TCheckBox;
    SaveSettingsBtn: TButton;
    CharacterSlotsCBox: TComboBox;
    POLdir: TEdit;
    EnableSecureTrading: TCheckBox;
    ExpLosChecksMap: TCheckBox;
    InactivityDisconnectTimeoutEdit: TEdit;
    InactivityWarningTimeoutEdit: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    MaximumClientsEdit: TEdit;
    MaximumClientsBypassCmdLevelCBox: TComboBox;
    MinCmdlevelToLoginCBox: TComboBox;
    MinCmdLvlToIgnoreInactivityCBox: TComboBox;
    ServerConfigPages: TPageControl;
    GamePlayTab: TTabSheet;
    RequireSpellbooks: TCheckBox;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    ServerSettingsTab: TTabSheet;
    UoDataFileRootEdit: TEdit;
    EnableWebServerCheckBox: TCheckBox;
    WebServerLocalOnly: TCheckBox;
    WebServerPortEdit: TEdit;
    procedure ActHelpKeyExecute(Sender: TObject);
    procedure ActTabBackExecuteExecute(Sender: TObject);
    procedure ActTabForwardExecuteExecute(Sender: TObject);
    procedure AddListenerBtnClick(Sender: TObject);
    procedure AddProfileBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClearClientFilesClick(Sender: TObject);
    procedure ClearWorldDataBtnClick(Sender: TObject);
    procedure DecayItemsChange(Sender: TObject);
    procedure EnableDebugLogCheckboxChange(Sender: TObject);
    procedure ExternalBtn1Click(Sender: TObject);
    procedure ExternalBtn2Click(Sender: TObject);
    procedure ExternalBtn3Click(Sender: TObject);
    procedure ExternalBtn4Click(Sender: TObject);
    procedure ExternalBtn5Click(Sender: TObject);
    procedure ExternalBtn6Click(Sender: TObject);
    procedure ExternalBtn7Click(Sender: TObject);
    procedure ExternalBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure InhibitSavesCheckBoxChange(Sender: TObject);
    procedure MapSizeComboChange(Sender: TObject);
    procedure MaxTileIDEditingDone(Sender: TObject);
    procedure RepackUOPBtnClick(Sender: TObject);
    procedure ReportCrashsAutomaticallyChange(Sender: TObject);
    procedure RequiredFilesPresentCheckBoxChange(Sender: TObject);
    procedure ServerNameEditChange(Sender: TObject);
    procedure CopyClientFilesBtnClick(Sender: TObject);
    procedure ListenerListSelectComboBoxChange(Sender: TObject);
    procedure RemoveListenerBtnClick(Sender: TObject);
    procedure SaveListenerBtnClick(Sender: TObject);
    procedure UOBrowseClick(Sender: TObject);
    procedure UOConvertSelectChange(Sender: TObject);
    procedure UOFNPCPopupClick(Sender: TObject);
    procedure UpdateServerBtnClick(Sender: TObject);
    procedure RemoveServerBtnClick(Sender: TObject);
    procedure POLBrowseBtnClick(Sender: TObject);
    Procedure BrowsePkgRootClick(Sender: Tobject);
    Procedure BuildFilesBtnClick(Sender: Tobject);
    Procedure BuildMultisCheckBoxChange(Sender: Tobject);
    Procedure BuildFacetsBtnClick(Sender: Tobject);
    procedure DeleteProfileBtnClick(Sender: TObject);
    Procedure Doremovefilesclick(Sender: Tobject);
    Procedure ExtractMULsBtnClick(Sender: Tobject);
    procedure LoadProfileBtnClick(Sender: TObject);
    Procedure RunPOLBtnClick(Sender: Tobject);
    procedure AddServerBtnClick(Sender: TObject);
    procedure ServerListSelectComboBoxChange(Sender: TObject);
    procedure SpeedhackPreventionCheckBoxChange(Sender: TObject);
    Procedure TestLaunchPOLBtnClick(Sender: Tobject);
    Procedure Delpkgclick(Sender: Tobject);
    Procedure Includebrowseclick(Sender: Tobject);
    Procedure Modulebrowseclick(Sender: Tobject);
    Procedure Polscriptrootbrowseclick(Sender: Tobject);
    Procedure SelAllFacetsClick(Sender: Tobject);
    Procedure EcompileWithSwitchesBtnClick(Sender: Tobject);
    Procedure CompileAllToLogBtnClick(Sender: Tobject);
    Procedure CompileUpdatedBtnClick(Sender: Tobject);
    procedure LoadDefaultsBtnClick(Sender: TObject);
    procedure LoadMyConfigFilesBtnClick(Sender: TObject);
    procedure PidPathBrowseClick(Sender: TObject);
    Procedure Selallusedifclick(Sender: Tobject);
    Procedure UOFSiegeClick(Sender: Tobject);
    procedure UpdateProfileBtnClick(Sender: TObject);
    procedure UseContainerSlotsChange(Sender: TObject);
    procedure UsePOLRootClick(Sender: TObject);
    procedure EnableWebServerCheckBoxChange(Sender: TObject);
    procedure WorldDataPathBrowseClick(Sender: TObject);
    procedure UODataPathBrowseClick(Sender: TObject);
    procedure RealmPathBrowseClick(Sender: TObject);
    procedure DisplayDeafenedChange(Sender: TObject);
    procedure DisplayFrozenChange(Sender: TObject);
    procedure DisplayParalyzedChange(Sender: TObject);
    procedure DisplaySquelchedChange(Sender: TObject);
    procedure DisplayTitleGuildChange(Sender: TObject);
    procedure EnableAssertionsChange(Sender: TObject);
    procedure FormActivate ( Sender: TObject ) ;
    procedure FormCreate(Sender: TObject);
    procedure GamePlayTabContextPopup ( Sender: TObject; MousePos: TPoint;
        var Handled: Boolean ) ;
    procedure SaveSettingsBtnClick ( Sender: TObject ) ;
    procedure LoadConfigFiles(WhichFiles: String);
    procedure SetEcompileDefaultPathSettings();
	Procedure CopyClientFiles();
    Procedure SettingsChanged(Sender: TObject);
    Procedure WriteExtProgsToINI();
    Procedure ReadExtProgsFromINI();
	Function SetRelativePaths(AbsolutePath: String): String;
    procedure HandleExtrnProgButtons(Button: TButton; poglistloc: integer);
    
  private
    { private declarations }
  public
    { public declarations }
  end;
  TStrArray = Array of String;

  TNoiseChar = Set of Char;
  Types = (Str, Int, Tstr, Bool);

  // Record used to store name/value pairs in cfg file TPC internal arrays.
  VarRec = Record
             VarName : String;
             VarType : Types;
             Value : String;
           End;
  // Record holds profile info (TPCProfiles.dat).
  ProfRec = Record
              ProfName : String[20];
              POLLoc : String[127];
              UOLoc : String[127];
              UOClientLoc : String[127];
              UOExpansion : Integer;
            End;
  // Record used for storing server info (servers.cfg).
  ServersRec =	Record
                  ServerKey: String;
                  ServerName : String;
                  ServerIP : String;
                  ServerPort : String;
                  IPMatchArray: Array[0..49] of String;
                End;
  // Record used for storing listener info (uoclient.cfg).
  ListenerRec = Record
                  ListenerKey: String;
                  ListenerPort: String;
                  ListenerEncryption: String;
                  ListenerAoSResistances: Boolean;
                  ListenerKeepClients: Boolean;
                end;
  // Record used for storing program references for the "External Programs" buttons.
  ExtProgRec = Record
                ProgName: String[20];
                ProgLoc: String[200];
                ProgDir: String[200];
               end;

	SetValArray = Array[0..1] of string;					// Setting and value returned by ParseLine

const
    ProgName: String = 'POL Configurator';
    Ver: String = '4.2';

	PolCfgParamList : Array[0..73] of String = ('UoDataFileRoot', 'RealmDataPath', 'WorldDataPath', 'PidFilePath', 'ShowWarningGump', 'ClientEncryptionVersion', 'CountResourceTiles',
	'RetainCleartextPasswords', 'AccountDataSave', 'MinCmdlevelToLogin', 'InactivityWarningTimeout', 'InactivityDisconnectTimeout', 'MinCmdLvlToIgnoreInactivity',
	'ShutdownSaveType', 'SingleThreadDecay', 'ThreadDecayStatistics', 'MaximumClients', 'MaximumClientsBypassCmdLevel', 'CharacterSlots',
	'AllowMultiClientsPerAccount', 'EnforceMountObjtype', 'DiscardOldEvents', 'WatchRpm', 'WatchSysload', 'LogSysload', 'LogScriptCycles',
	'RunawayScriptThreshold', 'ReportRunToCompletionScripts', 'ReportCriticalScripts', 'WatchMapCache', 'ShowSpeechColors', 'ThreadStacktracesWhenStuck',
	'ShowRealmInfo', 'DisableNagle', 'UseSingleThreadLogin', 'ProfileCProps', 'MaxTileID', 'MaxObjtype', 'MaxCallDepth',
	'CacheInteractiveScripts', 'EnableAssertions', 'AssertionFailureAction', 'DumpStackOnAssertionFailure', 'EnableDebugLog', 'DebugLevel', 'DebugPort',
	'DebugPassword', 'DebugLocalOnly', 'MiniDumpType', 'DisplayUnknownPackets', 'LogLevel', 'Verbose', 'ReportMissingConfigs', 'TimestampEveryLine',
	'IgnoreLoadErrors', 'InhibitSaves', 'RequireSpellbooks', 'EnableSecureTrading', 'WebServer', 'WebServerPort', 'WebServerLocalOnly',
	'WebServerDebug', 'WebServerPassword', 'ExpLosChecksMap', 'ReportCrashsAutomatically', 'ReportAdminEmail', 'ReportServer', 'ReportURL',
    'Keyfile', 'ShowWarningItem', 'SelectTimeout', 'LoginServerTimeout', 'ShowWarningCursorSequence', 'AllowedEnvironmentVariablesAccess');
      
	PolCfgParamType : Array[0..73] of Types = (Str, Str, Str, Str, Bool, Tstr, Bool,
	Bool, Bool, Tstr, Str, Str, Tstr,
	Tstr, Bool, Bool, Str, Tstr, Tstr,
	Bool, Bool, Bool, Bool, Bool, Bool, Bool,
	Str, Bool, Bool, Bool, Bool, Bool,
	Bool, Bool, Bool, Bool, Str, Str, Str,
	Bool, Bool, Tstr, Bool, Bool, Str, Str,
	Str, Bool, Tstr, Bool, Str, Bool, Bool, Bool,
	Bool, Bool, Bool, Bool, Bool, Str, Bool,
	Bool, Str, Bool, Bool, Str, Str, Str, Str, Bool, Str, Str, Bool, Str);

	ServSpecOptCfgParamList : Array[0..49] of String = ('StartingGold', 'NewbieStartingEquipment', 'SupportFaces', 'CoreSendsSeason', 'CoreGuildMessages', 'CoreHandledTags',
    'SpeedhackPrevention', 'SpeedHack_MountRunDelay',
	'SpeedHack_MountWalkDelay', 'SpeedHack_FootRunDelay', 'SpeedHack_FootWalkDelay', 'ScriptedMerchantHandlers', 'UseTileFlagPrefix', 'DefaultDoubleclickRange',
	'DoubleClickWait', 'DefaultLightLevel', 'CoreSendsCaps', 'DefaultAttributeCap', 'CoreHandledLocks', 'AllowMovingTrade', 'ForceNewObjCachePackets', 'PrivacyPaperdoll',
	'SeperateSpeechTokens', 'SpeechRange', 'WhisperRange', 'YellRange', 'CarryingCapacityMod', 'DefaultCharacterHeight', 'SendStatLocks', 'UseContainerSlots', 'MaxContainerSlots',
	'EventVisibilityCoreChecks', 'MovementUsesStamina', 'AllowSecureTradingInWarMode', 'TotalStatsAtCreation', 'DecayItems', 'DefaultDecayTime', 'DefaultContainerMaxItems',
	'DefaultContainerMaxWeight', 'UOFeatureEnable', 'HiddenTurnsCount', 'InvulTag', 'MaxPathFindRange', 'ItemColorMask', 'HonorUnequipScriptOnDeath',
	'MobilesBlockNpcMovement', 'UseWinLFH', 'DefaultAccessibleRange','CoreIgnoresDefenceCaps', 'EnableWorldMapPackets');

	ServSpecOptCfgParamType : Array[0..49] of Types = (Str, Bool, Bool, Bool, Bool, Str, Bool, Str,
	Str, Str, Str, Bool, Bool, Str,
	Str, Str, Bool, Str, Bool, Bool, Bool, Bool,
	Bool, Str, Str, Str, Str, Str, Bool, Bool, Str,
	Bool, Bool, Bool, Str, Bool, Str, Str,
	Str, Str, Bool, Tstr, Str, Str, Bool,
	Bool, Bool, Str, Bool, Bool);

    CombatCfgParamList : Array[0..10] of String = ('DisplayParrySuccessMessages', 'WarmodeInhibitsRegen', 'WarModeDelay', 'SingleCombat', 'CoreHitSounds', 'ScriptedAttackChecks', 'ResetSwingOnTurn',
    'SendSwingPacket', 'SendDamagePacket', 'AttackWhileFrozen', 'SendAttackMsg');

	CombatCfgParamType : Array[0..10] of Types = (Bool, Bool, Bool, Bool, Bool, Bool, Bool,
	Bool, Bool, Bool, Bool);

    WatchCfgParamList : Array[0..1] of String = ('Combat', 'ProfileScripts ');

    WatchCfgParamType : Array[0..1] of Types = (Bool, Bool);

    EcompileCfgParamList: Array[0..23]  of String = ('ModuleDirectory', 'IncludeDirectory', 'PolScriptRoot', 'PackageRoot', 'GenerateListing',
    'GenerateDebugInfo', 'GenerateDebugTextInfo', 'DisplayWarnings',
    'CompileAspPages', 'AutoCompileByDefault', 'UpdateOnlyOnAutoCompile', 'OnlyCompileUpdatedScripts', 'DisplaySummary', 'GenerateDependencyInfo',
    'DisplayUpToDateScripts', 'OptimizeObjectMembers', 'ErrorOnWarning', 'ThreadedCompilation', 'NumberOfThreads', 'ParanoiaWarnings', 'ErrorOnFileCaseMissmatch',
    'EmParseTreeCacheSize', 'IncParseTreeCacheSize', 'VerbosityLevel');

    EcompileCfgParamType: Array[0..23] of Types = (Str, Str, Str, Str, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Bool, Str, Bool, Bool,
    Str, Str, Str);

    // Comments to be written to servers.cfg
  	ServersCfgPreamble: Array[0..18] of String = (
  	'/////////////////////////////////////////////////////////////////////////////',
  	'//',
  	'//  SERVERS.CFG: Loginserver configuration data on Gameservers',
  	'//',
  	'//  Entries can contain the following properties:',
  	'//      Name        Display name shown on login screen',
  	'//      IP          IP Address of game server',
  	'//                      Note: --ip-- uses your "Internet IP" address',
  	'//                            --lan-- uses your "LAN IP" address',
  	'//                            Otherwise, must be a numerical IP address.',
  	'//      Port        Listening port of Gameserver',
  	'//                      Note: This does not configure the server to actually',
  	'//                            listen at that port - POL.CFG specifies that.',
  	'//      IPMatch     IPAddr/Mask',
  	'//                      If IPMatch lines are present for a server, that server',
  	'//                      will only be displayed to clients connecting from IP',
  	'//                      addresses matching those specified',
  	'//',
  	'/////////////////////////////////////////////////////////////////////////////');

    UOClientCfgPreamble: Array[0..59] of String = (
    '# Purpose:',
    '# Maps vital and attribute names onto UO Client idioms for character status.',
    '#',
    '# Structure:',
    '# General',
    '# {',
    '#   Strength        (string Strength)',
    '#   Intelligence    (string Intelligence)',
    '#   Dexterity       (string Dexterity)',
    '#',
    '#   Hits            (string Life)',
    '#   Mana            (string Mana)',
    '#   Stamina         (string Stamina)',
    '#   MaxSkillID      (integer maximum UO client skill ID)',
    '# }',
    '# Explanation:',
    '# The left-hand-side "Strength", "Intelligence", and "Dexterity" are Attribute names that',
    '# MUST be defined in attributes.cfg.',
    '# The right-hand-side "Life", "Mana", and "Stamina" are Vital names that',
    '# MUST be defined in vitals.cfg.',
    '# MaxSkillID allows you to use new client skills, but setting it too high can crash older clients.',
    '# You must define skills.cfg entries for each skillID up to MaxSkillID (default 57).',
    '#',
    '# Protocol',
    '# {',
    '#   # EnableFlowControlPackets: use the 0x33 (0x00 / 0x01) pause/restart packets.',
    '#   # Though OSI seems to no longer send these packets, they seem to help with smoothness,',
    '#   # particularly with boat movement.',
    '#   # NOTE: causes clients 4.0.0e and newer to fail login',
    '#   EnableFlowControlPackets    1',
    '# }',
    '#',
    '# Listener',
    '# {',
    '#   Port (int port number 1024..65535)',
    '#   Encryption (string encryption type)',
    '# }',
    '#',
    '# Explanation:',
    '# The Protocol and Listener sections are optional.',
    '# Each Listener section allows you to listen for different client encryption types on different ports.',
    '# This means you can listen for "1.26.4" clients on port 5003 and "ignition" clients on port 5555.',
    '# Valid encryption types are found in the pol.cfg section. If you use Listeners set ListenPort',
    '# in pol.cfg to 0.',
    '# Listener 2.0.0',
    '#{',
    '#',
    '# Enabled mostly for development purposes',
    '# Will be removed when distro goes final',
    '#	Port		5003',
    '#	Encryption	2.0.0',
    '#',
    '# AOSResistances 0/1.',
    '# This flag aids in deciding which version',
    '# of Armor to send in the StatMsg packets. With this enabled, a client who uses',
    '# an account with AOS Expansion enabled will see their Physical Resist instead',
    '# of AR member.',
    '#',
    '#',
		'');

    ClientFileList: Array[0..62] of String = ('soundLegacyMUL.uop', 'artLegacyMUL.uop', 'gumpartLegacyMUL.uop', // 'MultiCollection.uop',
    'map0LegacyMUL.uop', 'map0xLegacyMUL.uop', 'map1LegacyMUL.uop', 'map1xLegacyMUL.uop', 'map2LegacyMUL.uop', 'map2xLegacyMUL.uop',
    'map3LegacyMUL.uop', 'map4LegacyMUL.uop', 'map5LegacyMUL.uop', 'map5xLegacyMUL.uop', 'art.mul', 'artidx.mul', 'gumpart.mul', 'gumpidx.mul',
    'map0.mul', 'map0x.mul', 'map1.mul', 'map1x.mul', 'map2.mul', 'map2x.mul', 'map3.mul', 'map4.mul',
    'map5.mul', 'map5x.mul', 'multi.mul', 'multi.idx', 'sound.mul', 'soundidx.mul',
    'statics0.mul', 'statics0x.mul', 'statics1.mul', 'statics1x.mul', 'statics2.mul', 'statics2x.mul', 'statics3.mul', 'statics4.mul',
    'statics5.mul', 'statics5x.mul', 'stadif0.mul', 'stadif1.mul', 'stadif2.mul', 'stadifi0.mul', 'stadifi1.mul', 'stadifi2.mul',
    'stadifl0.mul', 'stadifl1.mul', 'stadifl2.mul', 'staidx0.mul', 'staidx0x.mul',  'staidx1.mul', 'staidx1x.mul',
    'staidx2.mul', 'staidx2x.mul',  'staidx3.mul', 'staidx4.mul', 'staidx5.mul', 'staidx5x.mul', 'multi.mul', 'multi.idx',
    'tiledata.mul');


var
  POLConfigurator: TPOLConfigurator;
  ConfiguratorDatFile: TextFile;                  // A file written to the POL Installation with data relative
                                                  // to that installation such as World Data path.
  PolFile: TextFile;                              // File ref for POLConfigurator.cfg
  ServSpecOptFile: TextFile;                      // File ref for servspecopt.cfg
  CombatFile: TextFile;                           // File ref for combat.cfg
  WatchFile: TextFile;                            // File ref for watch.cfg
  ServersFile: TextFile;                          // File ref for servers.cfg
  UOClientPath: String;                           // String pointing to the uoclient.cfg file, including
                                                  // the "uoclient.cfg" name
  UOClientFile: TextFile;                         // File ref for uoclient.cfg
  EcompileFile: TextFile;                         // File ref for EcompileTab.cfg
  Configuratorbat: TextFile;                      // Used to create a temp batch file until I can learn to do
                                                  // this properly.
  ConfigIni: TIniFile;                            // File ref for the ini file to hold info that needs to survive
                                                  // program stop/restart
  Instructions: TextFile;                         // File ref for the instructions for using the Configurator
  PolContents: Array[0..1000] of String;          // Buffer that contains the entire POLConfigurator.cfg file
                                                  // including comments.
  ServSpecOptContents: Array[0..1000] of String;  // Buffer that contains the entire servspecopt.cfg file.
  CombatContents: Array[0..1000] of String;       // Buffer that contains the entire combat.cfg file.
  WatchContents: Array[0..24] of String;          // Buffer that contains the entire watch.cfg file.
  ServersContents: Array[0..200] of String;       // Buffer that contains the entries from servers.cfg.
  UOClientContents: Array[0..200] of String;      // Buffer that contains the entries from uoclient.cfg.
  EcompileContents: Array[0..999] of String;      // Buffer that contains the entire EcompileTab.cfg
  PolCfgArraySize: Integer;                       // Holds the last position accessed in the array containing
                                                  // POLConfigurator.cfg during default cfg load
  ServSpecOptCfgArraySize: Integer;               // Holds the last position accessed in the array containing
                                                  // servspecopt.cfg during default cfg load
  CombatCfgArraySize: Integer;                    // Holds the last position accessed in the array containing
                                                  // combat.cfg during default cfg load
  WatchCfgArraySize: Integer;                     // Holds the last position accessed in the array containing
                                                  // watch.cfg during default cfg load
  ServersCfgArraySize: Integer;                   // Holds the last position accessed in the array containing
                                                  // servers.cfg during default cfg load.
  ServerList: array[0..49] of ServersRec;         // Array of possible number of defined servers.
                                                  // 50 ought to be enough.
  ListenerList: array[0..49] of ListenerRec;      // Array of possible number of defined listeners.
                                                  // 50 ought to be enough.
  ServerCount: Integer;                           // Counter of defined servers found in servers.cfg and
                                                  // stored in ServerList.
  ListenerCount: Integer;                         // Counter of defined listeners found in uoclient.cfg and
                                                  // stored in ServerList.
  UOClientCfgArraySize: Integer;                  // Holds the last position accessed in the array containing
                                                  // uoclient.cfg during default cfg load.
  EcompileCfgArraySize: Integer;                  // Holds the last position accessed in the array containing
                                                  // EcompileTab.cfg during default cfg load
  CoreHandledTags: String;                        // Holds the hex string value read in and written for
                                                  // CoreHandledTags setting.
  CoreHandledTagsDec: Integer;                    // Holds the decimal value of CoreHandledTags first 5 bits.
  I: Integer;                                     // Used to index through the cfg arrays while reading and
                                                  // writing the files
  POLDirName: String;                             // String containing the user's POL directory.
  UODirName: String;                              // Strimg containing the user's UO installation directory.
  FName: String;                                  // Place for the current file name being read or written
  TLine: String;                                  // Holds the line from the active cfg file.
  Junk: String;                                   // Just what the name says, scratch space.
  JunkInt: Integer;                               // Temporary variable.
  ScratchInt: Integer;                            // Another temporary var
  StList: TStrings;                               // Used as scratch storage when files are read in on Tstr
                                                  // parameters.
  EqualsPos: Integer;                             // Used to hold the position of the '=' sign in lines read
                                                  // from cfg files.
  Idex: Integer;                                  // Temp var used to store index data
  PadChars: TNoiseChar;                           // Used to sanitize unwanted whitespace, etc. from lines
                                                  // read in from cfg files.
  ParamName: String;                              // Used during reading of standard name/value pairs in POL
                                                  // cfg files.
  ParamVal: String;                               //   "     "      "           "      "    "     "       "
  Delimiters: TSysCharSet;                        // Used in the ParseLine() function.
  PolCfgFileParams : Array[1..67] of VarRec;      // Contains only the variables, their types and their values
                                                  // read in from POLConfigurator.cfg
  CfgParamsIndex: Integer;                        // Index into the current *CfgParams array
  BaseCoreTagsValue: Integer = 65504;             // This is 65535 - 31. It's needed for Core tags setting.
  CoreTagsValue: Integer = 0;                     // Holds the transitional decimal value for CoreHandledTags
  UOFeatureEnableValue: Integer = 0;              // Holds the transitional decimal value for UOFeatureEnable
  Keyfile: String;                                // Place holder for an obsolete parameter
  SelectTimeout: String;                          // Place holder for an obsolete parameter
  POLDirSet: Boolean = False;                     // Flag gets set to True when a valid POL directory
                                                  // is entered.
  UODirSet: Boolean = False;                      // Flag gets set to True when a valid UO installation
                                                  // directory is entered.
  MulsCopied: Boolean = False;                    // Flag gets set when muls are copied from UO Dir to POL Dir
  UseSpecoptLocal: Boolean = False;               // If the user has a servspecopt.local.cfg file this will
                                                  // get set to True in the LoadCFGFiles procedure.
  ModuleDir: String;                              // Used by read default EcompileTab to hold relative
                                                  // reference to module directory
  IncludeDir: String;                             // Used by read default EcompileTab to hold relative
                                                  // reference to include directory
  PolScriptRootDir: String;                       // Used by read default EcompileTab to hold relative
                                                  // reference to script directory
  PackageRootDir: String;                         // Used by read default EcompileTab to hold relative
                                                  // reference to package directory
  PkgRootComboLen: Integer = 0;                   // The number of items in the PkgRootCombo box.
  JunkArray : Array[0..1] of String;              // Used as scratch space for values returned by
                                                  // ParseLine.
  Profile : ProfRec;                              // Record for profiles containing
                                                  // ProfName, PolLoc, UOLoc.
  ProfileList : Array[0..9] of ProfRec;           // The Array containing stored profiles.
  ProfilesFile : File of ProfRec;                 // File where profiles are stored.
  ProfileIndex : Integer;                         // Index into ProfileList pointing to the end of the array.
  UOCClientStr: String;							              // The following variables are used for storing values under
  UOCServerStr: String;							              // the "General" heading in uoclient.cfg.
  UOCClientInt: String;							              //
  UOCServerInt: String;							              //
  UOCClientDex: String;							              //
  UOCServerDex: String;							              //
  UOCClientHP: String;							              //  
  UOCServerHP: String;							              //
  UOCClientMana: String;							            //
  UOCServerMana: String;							            //
  UOCClientStam: String;							            //
  UOCServerStam: String;							            //
  MaxSkillID: String;                             // End uoclient.cfg "General" header variables.
  SettingsLoaded: Boolean = False;                // Set to True when either default or user settings are loaded.
  DataPathsLoaded: Boolean = False;               // Indicates whether the POL installation has a
                                                  // Configurator.dat file with the Path Settings and
                                                  // they were loaded.
  PathsSet: Boolean = False;                      // Used to determine whether the paths on eCompile and
                                                  // Server Settings pages are set.
  MaxServers: Integer = 50;                       // Arbitrary limit set for max servers (servers.cfg).
  MaxListeners: Integer = 50;                     // Arbitrary limit set for max listeners (uoclient.cfg).
  FoundFiles: TStringList;                        // List of files returned by the function LocateFiles().
  ExtProgList: Array[0..7] of ExtProgRec;         // Holds external programme names and locations.
  TPCCfgFilePath: String;                         // Holds the psth where we store our *.ini and profiles files.

implementation

uses missingFilesForm, accountinfoform, filecopyform, unsavedSettings;

// Test
function TestDefault(junk: integer = 1): integer;
Begin
  Result := junk;
end;

// Used to sanitize unwanted (whitespace) characters
function Sanitize(RawWord: String) : String;
Begin
  RemovePadChars(RawWord, PadChars);
  Trim(RawWord);
  Result := RawWord;
End;

// Used to search for the index of a parameter in an array
Function GetParamIndex(Target: String; List: Array of VarRec) : Integer;
var
  I: Integer;
  Found: Boolean;

Begin
  I := 0;
  Found := False;
  While Not(I > High(List)) or Not(Found) Do
  Begin
    If Target = List[I].VarName Then Found := True
    Else I := I + 1;
  End;
  If Not(Found) Then I := -1;
  Result := I;
End;

{
This function parses a text line for a delimiter and splits the line
line at the delimiter. The value on the left side of the delimiter
is assigned to RetVal[0] and the value on the right side of
the delimiter is assigned to RetVal[1]. Both values sre stripped
of preceeding and trailing whitespace.

Currently accepted delimiters are a space, an equals symbol and
a <tab> character.

Input is a string of text
RetVal[0] will contain the ParamName
RetVal[1] will contain the ParamVal
}
Function ParseLine(TexLine: String): SetValArray;

Const
  EqualSign: String = '=';
  TabChar: string = #09;
  SpaceChar: String = ' ';

var
  RetVal: SetValArray;
  DelimiterLoc: Integer;

Begin
  // Get the location of the delimiter in the parameter assignment statement.
  DelimiterLoc := NPos(EqualSign, TexLine, 1);								// Look for an equals symbol
  If(DelimiterLoc = 0) Then DelimiterLoc := NPos(SpaceChar, TexLine, 1);	// No Equals symbol found. Look for a <space> character.
  If(DelimiterLoc = 0) Then DelimiterLoc := NPos(TabChar, TexLine, 1);		// No space found. Look for a <tab> character.
  If(DelimiterLoc <> 0) Then												// No <tab> character found. Generate an error condition.
  Begin
    // Retrieve the parameter name from the line.
    RetVal[0] := Sanitize(LeftStr(TexLine, DelimiterLoc - 1));
    RetVal[0] := Trim(RetVal[0]);
    // Now get the value on the right side of the equals '=' sign.
    RetVal[1] := Sanitize(AnsiRightStr(TexLine, Length(TexLine) - DelimiterLoc));
    RetVal[1] := Trim(RetVal[1]);
  End
  Else
  Begin
    RetVal[0] := Trim(TexLine);
    RetVal[1] := '';
  end;
  result := RetVal;
End;

//////////////////////////////////////////////////////////////////////////
//
// Function LocateFiles.
// Purpose:
// Locates all files in a given directory.
//
// Units required:
// FileUtil.
//
// Usage:
// Create a variable of type TStringList prior to calling LocateFiles.
// Example:
// Var
//		SomeFiles: TStringList;
// Then call the function using your variable.
// SomeFiles := LocateFiles(TargetDirectory + '/', TargetFile, IncludeSubDirs);
//
//
// Parameters:
// TargetDirectory	-	String containing the directory path to search.
//										Example: 'C:/Program Files' minus the last '/'.
// TargetFile				-	String containing the filespec.
//										Example: 'wordpad.exe'.
// IncludeSubDirs		-	Boolean default is True. If False is sent
//										only the main directory specified will be
//										searched.
//
// Returns:
// A TStringList of all occurrences of TargetFile in TargetDirectory.
// If TStringList.count is < 0 no files were found matching the
// filespec.
//
// You MUST release the TStringList when you are finished with it
// From the example above you would use:
// SomeFiles.Free;
//
//////////////////////////////////////////////////////////////////////////
Function LocateFiles(TargetDirectory : String; TargetFile: String; IncludeSubDirs: Boolean = True): TStringList;
var
  FoundFiles: TStringList;
begin
  //No need to create the stringlist; the function does that for you
  FoundFiles := FindAllFiles(TargetDirectory, TargetFile, IncludeSubDirs); //find e.g. all pascal sourcefiles
  Result := FoundFiles;
end;

///////////////////////////////////////////////////////////////
//
// Exception handler for reading settings files.
//
// ExceptErr - The TObject reference to the exception.
// WhatFiles - string will be either 'user' or 'default'.
// TheFile - The name of the file being read, eg. servers.cfg.
//
///////////////////////////////////////////////////////////////
procedure LoadFilesExceptionHandler(ExceptErr: Exception; WhatFiles: String; TheFile: String);
Var
  WhoseString: String;
  Msg: String;

Begin
  If(WhatFiles = 'user') Then
  Begin
    Msg :=      'There was a problem reading the settings from your '  + TheFile + ' file.' + Chr(13) + Chr(10) +
                'This is most likely caused by a formatting error in the file.' + Chr(13) + Chr(10) +
                'I suggest you load the default settings and edit them to suit' + Chr(13) + Chr(10) +
                'your needs and save the settings. That will ensure you have' + Chr(13) + Chr(10) +
                'properly formatted settings files in your POL server.' + Chr(13) + Chr(10) +
                'The error is ' + ExceptErr.Message;
  end
  Else  Msg :=  'Something has corrupted the ' + WhatFiles + ' settings files.' + Chr(13) + Chr(10) +
                'Specifically the error occured with the ' + WhatFiles + ' ' + TheFile + ' file.' +  Chr(13) + Chr(10) +
                'To resolve this issue, re-download the Configurator and' + Chr(13) + Chr(10) +
                'reinstall it. That should fix the problem.' + Chr(13) + Chr(10) +
                'The error is ' + ExceptErr.Message;;
  ShowMessage(Msg);
end;

{ TPOLConfigurator }


/////////////////////////////////////////////////////////////
// Checks for critical and non-critical missing files from
// the POL installation directory. Still not sure what
// exactly to do about uoclient.cfg because it can "live"
// anywhere in a POL installation and, although POL only
// uses one, apparently the "deepest" embedded uoclient.cfg
// file, POL "allows" nore than one to be present. POL
// ignores all others but the deepest one. More testing
// is needed.
// For now it MUST be in the POLDirName +'/config/'
// directory.
/////////////////////////////////////////////////////////////
procedure CheckForMissingFiles();

var
  AMissingFile: Boolean = False;
  JunkPath: String;	// For storing the contrived path.

Begin
  FormMissingFiles.CombatCfgCheckBox.Checked := False;
  FormMissingFiles.EcompileCfgCheckBox.Checked := False;
  FormMissingFiles.POLCfgCheckBox.Checked := False;
  FormMissingFiles.ServersCfgCheckBox.Checked := False;
  FormMissingFiles.ServspecoptCfgCheckBox.Checked := False;
  FormMissingFiles.UOClientCfgCheckBox.Checked := False;
  FormMissingFiles.UOClientSaveBtn.Enabled:=False;
  FormMissingFiles.UOClientLabel.Enabled:=False;
  FormMissingFiles.UOClientDirEdit.Text := '';
  FormMissingFiles.WatchCfgCheckBox.Checked := False;

  If(Not FileExists(POLDirName +'/pol.cfg')) Then
  Begin
    FormMissingFiles.POLCfgCheckBox.Checked := True;
  	AMissingFile := True;
  end;

  If(Not FileExists(POLDirName + '/scripts/ecompile.cfg')) Then
  Begin
    FormMissingFiles.EcompileCfgCheckBox.Checked := True;
  	AMissingFile := True;
  end;
  If(Not FileExists(POLDirName +'/config/servers.cfg')) Then
  Begin
    FormMissingFiles.ServersCfgCheckBox.Checked := True;
  	AMissingFile := True;
  end;
  If(Not FileExists(POLDirName +'/config/combat.cfg')) Then
  Begin
    FormMissingFiles.CombatCfgCheckBox.Checked := True;
  	AMissingFile := True;
  end;
  If(Not FileExists(POLDirName +'/config/servspecopt.cfg')) Then
  Begin
    FormMissingFiles.ServspecoptCfgCheckBox.Checked := True;
  	AMissingFile := True;
  end;
  FoundFiles := FindAllFiles(POLDirName, 'uoclient.cfg', true);
  If(Not (FoundFiles.Count > 0)) Then
  Begin
    FormMissingFiles.UOClientCfgCheckBox.Checked := True;
    AMissingFile := True;
    FormMissingFiles.UOClientDirEdit.Enabled:=True;
    FormMissingFiles.UOClientSaveBtn.Enabled:=True;
    FormMissingFiles.UOClientLabel.Enabled:=True;
  end;
  If(Not FileExists(POLDirName +'/config/watch.cfg')) Then
  Begin
    FormMissingFiles.WatchCfgCheckBox.Checked := True;
  	AMissingFile := True;
  end;
  // Look for missing cfg and required txt files.
  if(AMissingFile) Then
  Begin
    If(FormMissingFiles.ShowModal = mrYes) Then
    Begin
      If(FormMissingFiles.CombatCfgCheckBox.Checked) Then
          CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/defaultcombat.cfg', POLDirName + '/config/combat.cfg');

  	  If(FormMissingFiles.EcompileCfgCheckBox.Checked) Then
          CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/defaultecompile.cfg', POLConfigurator.PolScriptRoot.Text +  '/ecompile.cfg');

  	  If(FormMissingFiles.POLCfgCheckBox.Checked) Then
          CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/defaultpol.cfg', POLDirName + '/pol.cfg');
      
  	  If(FormMissingFiles.ServersCfgCheckBox.Checked) Then
          CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/defaultservers.cfg', POLDirName + '/config/servers.cfg');
      
  	  If(FormMissingFiles.ServspecoptCfgCheckBox.Checked) Then
          CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/defaultservspecopt.cfg', POLDirName + '/config/servspecopt.cfg');
      
  	  If(FormMissingFiles.UOClientCfgCheckBox.Checked) Then
      Begin
        If(Not DirectoryExists(FormMissingFiles.UOClientDirEdit.Text + '/config')) Then CreateDir(FormMissingFiles.UOClientDirEdit.Text + '/config');
        CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/defaultuoclient.cfg', FormMissingFiles.UOClientDirEdit.Text + '/config/uoclient.cfg');
      end;
      If(FormMissingFiles.WatchCfgCheckBox.Checked) Then CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles//defaultwatch.cfg', POLDirName + '/config/watch.cfg');
 	  ShowMessage('The selected default files were copied' + Chr(13) + Chr(10) + 'to your POL installation.');
    End
    Else
    Begin
      ShowMessage('The POL Configurator cannot run without the proper configuration files present in your POL configuration.' + Chr(13) + Chr(10) +
      'Either let the Configurator replace the missing files or copy them from another POL installation to this one.' + Chr(13) + Chr(10) + Chr(13) + Chr(10) +
      'The POL Configurator will now exit.');
      Halt;
    End;
  end;
end;

// This procedure is part of the unpacking of MUL files from UOP files system.
Procedure DeletePrevMULFiles();

var
  I: Integer;
  JunkPath: String;	// For storing the contrived path for UoDataFileRootEdit.

Begin
  If(NPos(':', POLConfigurator.UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + POLConfigurator.UoDataFileRootEdit.Text
  Else JunkPath := POLConfigurator.UoDataFileRootEdit.Text;
  For I := 0 to 5 Do
  Begin
    DeleteFile(JunkPath + 'map' + Dec2Numb(I, 1, 10) + '.mul');
    DeleteFile(JunkPath + 'map' + Dec2Numb(I, 1, 10) + 'x.mul');
  end;
  DeleteFile(JunkPath + 'art.mul');
  DeleteFile(JunkPath + 'artidx.mul');
  DeleteFile(JunkPath + 'gumpart.mul');
  DeleteFile(JunkPath + 'gumpidx.mul');
  DeleteFile(JunkPath + 'multi.mul');
  DeleteFile(JunkPath + 'multi.idx');
  DeleteFile(JunkPath + 'sound.mul');
  DeleteFile(JunkPath + 'soundidx.mul');
end;

// This procedure is part of the packing of MUL files into UOP files system.
procedure DeleteUOPFiles();

var
  I: Integer;
  JunkPath: String;	// For storing the contrived path for UoDataFileRootEdit.

Begin
  If(NPos(':', POLConfigurator.UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + POLConfigurator.UoDataFileRootEdit.Text
  Else JunkPath := POLConfigurator.UoDataFileRootEdit.Text;
  For I := 0 to 5 Do
  Begin
    DeleteFile(JunkPath + 'map' + Dec2Numb(I, 1, 10) + 'LegacyMUL.uop');
    DeleteFile(JunkPath + 'map' + Dec2Numb(I, 1, 10) + 'xLegacyMUL.uop');
  end;
  DeleteFile(JunkPath + 'artLegacyMUL.uop');
  DeleteFile(JunkPath + 'gumpartLegacyMUL.uop');
  DeleteFile(JunkPath + 'MultiCollection.uop');
  DeleteFile(JunkPath + 'soundLegacyMUL.uop');
end;

// Delete the POLDirPath/data directory and recreate the data directory.
// Then write a new accounts.txt and pol.txt file 
procedure ResetWorldData();

var
  AcctFileName: String;
  POLTxtFileName: String;
  AccountsFile: TextFile;
  POLTxtFile: TextFile;
  JunkPath: String;	// For storing the contrived path for WorldDataPathEdit.

Begin
  If(NPos(':', POLConfigurator.WorldDataPathEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + POLConfigurator.WorldDataPathEdit.Text
  Else JunkPath := POLConfigurator.WorldDataPathEdit.Text;
  DeleteDirectory(JunkPath, False);
  CreateDir(JunkPath);

  // Write the new accounts.txt file.
  AcctFileName :=	JunkPath + 'accounts.txt';
  AssignFile(AccountsFile, AcctFileName);
  Rewrite(AccountsFile);
  WriteLn(AccountsFile, 'Account');
  // Open brace.
  WriteLn(AccountsFile, Chr(123));
  WriteLn(AccountsFile, Chr(09) + 'Name' + Chr(09) + Chr(09) + Chr(09) + AccountInfoEntryForm.UserNameEdit.Text);
  WriteLn(AccountsFile, Chr(09) + 'Password' + Chr(09) + Chr(09) + AccountInfoEntryForm.PasswordEdit.Text);
  WriteLn(AccountsFile, Chr(09) + 'Enabled' + Chr(09) + Chr(09) + Chr(09) + '1');
  WriteLn(AccountsFile, Chr(09) + 'Banned' + Chr(09) + Chr(09) + Chr(09) + '0');
  WriteLn(AccountsFile, Chr(09) + 'DefaultCmdLevel' + Chr(09) + 'test');
  WriteLn(AccountsFile, Chr(09) + 'UOExpansion' + Chr(09) + Chr(09) + 'TOL');
  // Close brace
  WriteLn(AccountsFile, Chr(125));
  WriteLn(AccountsFile, '');
  Close(AccountsFile);

  // Write the new pol.txt file.
  POLTxtFileName :=	JunkPath + 'pol.txt';
  AssignFile(POLTxtFile, POLTxtFileName);
  Rewrite(POLTxtFile);
  WriteLn(POLTxtFile, '#');
  WriteLn(POLTxtFile, '#  Created by Version: 99.1 Break Everything Even Rudder');
  WriteLn(POLTxtFile, '#  Mobiles:		 0');
  WriteLn(POLTxtFile, '#  Top-level Items: 0');
  WriteLn(POLTxtFile, '#');
  WriteLn(POLTxtFile, '');
  WriteLn(POLTxtFile, 'System');
  WriteLn(POLTxtFile, Chr(123));	// Open brace
  WriteLn(POLTxtFile, Chr(09) + 'CoreVersion	99');
  WriteLn(POLTxtFile, Chr(09) + 'CoreVersionString	99.1 Break Everything Even Rudder');
  WriteLn(POLTxtFile, Chr(09) + 'CompileDate	Jan  8 2018');
  WriteLn(POLTxtFile, Chr(09) + 'CompileTime	00:43:19');
  WriteLn(POLTxtFile, Chr(09) + 'LastItemSerialNumber	1073741824');
  WriteLn(POLTxtFile, Chr(09) + 'LastCharSerialNumber	1');
  WriteLn(POLTxtFile, Chr(125));	// Close brace
  WriteLn(POLTxtFile, '');
  WriteLn(POLTxtFile, 'GlobalProperties');
  WriteLn(POLTxtFile, Chr(123));	// Open brace
  WriteLn(POLTxtFile, Chr(09) + 'CProp	DayPhase sDay');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	MaxPlayers i1');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	MaxUptime i0');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	NewDay i1');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	ShardDate i1');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	gameclock s1');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	nextlockid i1');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	orelist d0:');
  WriteLn(POLTxtFile, Chr(09) + 'CProp	storagestart i1');
  WriteLn(POLTxtFile, Chr(125));	// Close brace
  WriteLn(POLTxtFile, '');
  Close(POLTxtFile);

  ShowMessage('The accounts.txt file was created in ' + JunkPath + Chr(13) + Chr(10) +
              'with the following developer login information..' + Chr(13) + Chr(10) +
              'Username: ' + AccountInfoEntryForm.UserNameEdit.Text + Chr(13) + Chr(10) +
              'Password: ' + AccountInfoEntryForm.PasswordEdit.Text + Chr(13) + Chr(10) +
              'The default pol.txt was also created in the same directory');
End;

/////////////////////////////////////////////////////////////
// Look for missing accounts.txt and/or pol.txt files
// in the POL installation directory
/////////////////////////////////////////////////////////////
procedure CheckAcctsAndPolTxtPresent();

var
  AccountsFile: TextFile;
  AcctFileName: String;
  JunkPath: String;	// For storing the contrived path for WorldDataPathEdit.

Begin
  If(NPos(':', POLConfigurator.UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + POLConfigurator.WorldDataPathEdit.Text
  Else JunkPath := POLConfigurator.WorldDataPathEdit.Text;

  If(Not (FileExists(JunkPath + 'accounts.txt')) or Not (FileExists(JunkPath + 'pol.txt'))) Then
  Begin
	AccountInfoEntryForm.NewActsAndPolTxtCheckBox.Checked:=True;
    AccountInfoEntryForm.ClearGameDataAuthorisationCheckBox.Checked:=False;
    AccountInfoEntryForm.UserNameEdit.Text:='';
    AccountInfoEntryForm.PasswordEdit.Text:='';
	If(AccountInfoEntryForm.ShowModal = mrYes) Then ResetWorldData()
  Else
  ShowMessage('POL will not launch without a pol.txt and an accounts.txt file' + Chr(13) + Chr(10) +
              'in your POL Data directory.');
  end;
End;

procedure EnablePages();
Begin
  If(SettingsLoaded and POLDirSet) Then
  Begin
    POLConfigurator.SaveSettingsBtn.Enabled:=True;
    POLConfigurator.ClearWorldDataBtn.Enabled:=True;
    POLConfigurator.EcompileTab.Enabled:=True;
    POLConfigurator.LogInSettingsTab.Enabled:=True;
    POLConfigurator.ServerSettingsTab.Enabled:=True;
    POLConfigurator.GamePlayTab.Enabled:=True;
    POLConfigurator.LoggingReportingTab.Enabled:=True;
  end;
  If(UODirSet) and POLDirSet Then POLConfigurator.FacetsTab.Enabled:=True;

end;

procedure DoFileCopy(FromFile: String; ToFile: String);

Begin
  CopyFile(FromFile, ToFile);
  FileCopyFrm.FileCopyProgBar.Position:=1;
  Application.ProcessMessages;
end;

{TPOLConfigurator}

procedure TPOLConfigurator.SettingsChanged(Sender: TObject);
begin
  SettingsChangedLabel.Visible:=True;
end;

// Sets paths to relative paths where applicable.
function TPOLConfigurator.SetRelativePaths(AbsolutePath: String) : String;

Var
  JunkDir: String;

Begin
  // Make UoDataFileRootEdit.Text into a relative path if it contains the POL root dir
  If(NPos(POLDirName + '/', AbsolutePath, 1) > 0) Then AbsolutePath := StringReplace(AbsolutePath, POLDirName + '/', '', [rfIgnoreCase]);
  If(NPos(POLDirName + '\', AbsolutePath, 1) > 0) Then AbsolutePath := StringReplace(AbsolutePath, POLDirName + '\', '', [rfIgnoreCase]);
  If(NPos(POLDirName, AbsolutePath, 1) > 0) Then AbsolutePath := StringReplace(AbsolutePath, POLDirName, '', [rfIgnoreCase]);
  Result := AbsolutePath;
end;


/////////////////////////////////////////////////////////////
// Save ini file.
// Saves all of the ini info to POLConfigurator.ini
/////////////////////////////////////////////////////////////
Procedure TPOLConfigurator.WriteExtProgsToINI();

Var
  I: Integer;
Begin

  ConfigIni:=TIniFile.Create(TPCCfgFilePath + 'POLConfigurator.ini');
  with ConfigIni do
  begin
    WriteString('Startup','Users POL directory', POLDirName);
    WriteString('Startup','Users UO directory', UODir.Text);
    // Save the position of the POL Configurator form.
    WriteInteger('Position and size','Top of window- from top of screen',POLConfigurator.top);
    WriteInteger('Position and size','Left',  POLConfigurator.left);
    WriteInteger('Position and size','Height',POLConfigurator.height);
    WriteInteger('Position and size','Width', POLConfigurator.width);
    WriteString('Misc','eCompileSwitches', EcompileSwitchesEdit.Text);
    // Save external program button info.
    For I := 0 to 7 Do
    Begin
      WriteString('External Programs','ButtonCap' + Dec2Numb(I + 1,1,10), ExtProgList[I].ProgName);
      WriteString('External Programs','ProgLoc' + Dec2Numb(I + 1,1,10), ExtProgList[I].ProgLoc);
    end;

  end;//with...
  ConfigIni.Free;

end;

Procedure TPOLConfigurator.ReadExtProgsFromINI();

Var
  I: Integer;

Begin

  // Create the ini file if not already there.
  ConfigIni := TIniFile.Create(TPCCfgFilePath + 'POLConfigurator.ini');
  with ConfigIni do
  Begin
    For I := 0 to 7 Do
    Begin
      ExtProgList[I].ProgName := ReadString('External Programs','ButtonCap' + Dec2Numb(I + 1,1,10), '<empty>');
      ExtProgList[I].ProgLoc := ReadString('External Programs','ProgLoc' + Dec2Numb(I + 1,1,10), '');
    end;
  end;
  ConfigIni.Free;

end;

procedure TPOLConfigurator.HandleExtrnProgButtons(Button: TButton; poglistloc: integer);

var
  AProcess : TProcess;
  JunkString: String;

begin
  If(Button.Caption = '<empty>') Then
  Begin
    If(ExtrnProgFrm.ShowModal = mrCancel) Then Exit
    Else
    Begin
      Button.Caption := ExtrnProgFrm.NewExtProgName;
      ExtProgList[poglistloc].ProgName := ExtrnProgFrm.NewExtProgName;
      ExtProgList[poglistloc].ProgLoc := ExtrnProgFrm.NewExtProgLoc;
      ExtProgList[poglistloc].ProgDir:=ExtrnProgFrm.NewExtProgDir;
      WriteExtProgsToINI();
      Exit;
    end;
  end;
  If(EditModeCheckBox.Checked) Then
  Begin
    ExtrnProgFrm.ProgNameEdit.Text := ExtProgList[poglistloc].ProgName;
    ExtrnProgFrm.ProgLocEdit.Text:= ExtProgList[poglistloc].ProgLoc;
    ExtrnProgFrm.StartInDirEdit.Text:= ExtProgList[poglistloc].ProgDir;
    If(ExtrnProgFrm.ShowModal = mrCancel) Then Exit
    Else
    Begin
      Button.Caption := ExtrnProgFrm.NewExtProgName;
      ExtProgList[poglistloc].ProgName := ExtrnProgFrm.NewExtProgName;
      ExtProgList[poglistloc].ProgLoc := ExtrnProgFrm.NewExtProgLoc;
      ExtProgList[poglistloc].ProgDir := ExtrnProgFrm.NewExtProgDir;
      WriteExtProgsToINI();
      ReadExtProgsFromINI();
      ExtrnProgFrm.ClearBtnCheckBox.Checked:=False;
      Exit;
    end;
  end;
  JunkString := ExtProgList[poglistloc].ProgLoc;
  AProcess := TProcess.Create(nil);
  JunkString := '"' + ExtProgList[poglistloc].ProgLoc + '"';
  AProcess.Executable := JunkString;
  If(ExtProgList[poglistloc].ProgDir <> '') Then AProcess.CurrentDirectory:=ExtProgList[poglistloc].ProgDir;
  AProcess.Execute;
  AProcess.Free;
end;

Procedure TPOLConfigurator.CopyClientFiles();

var
  I: integer = 0;
  Index2: Integer = 0;
  FileCount: Integer = 0;
  FilesToCopy: TStrArray;
  CopyFileCount: Integer = 0;
  CopySuccess: Boolean;
  JunkPath: String;	//Temporary string used to store contrived path to UoDataFileRootEdit
Begin
  FileCopyProgBar.Position:=0;
  If(CopyUOPsOnlyCheckBox.Checked) Then
    Begin
      // Get the file count so we can present an accurate progress in the progress bar.
      For I := 0 to Length(ClientFileList) - 1 Do
        If((Lowercase(RightStr(ClientFileList[I], 3)) = 'uop') or (Lowercase(LeftStr(ClientFileList[I], 3)) = 'sta')
        	or (Lowercase(LeftStr(ClientFileList[I], 4)) = 'tile') or (Lowercase(LeftStr(ClientFileList[I], 4)) = 'mult')) Then CopyFileCount  := CopyFileCount + 1;
			SetLength(FilesToCopy, CopyFileCount);
	    // Create the list of files to copy if CopyUOPsOnlyCheckBox.Checked)
      For I := 0 to Length(ClientFileList) - 1 Do
		  If((Lowercase(RightStr(ClientFileList[I], 3)) = 'uop') or (Lowercase(LeftStr(ClientFileList[I], 3)) = 'sta')
        	or (Lowercase(LeftStr(ClientFileList[I], 4)) = 'tile') or (Lowercase(LeftStr(ClientFileList[I], 4)) = 'mult')) Then
          Begin
            FilesToCopy[Index2] := ClientFileList[I];
            Index2 := Index2 + 1;
          end;
      // Now to setup statics stuff
    end
	Else FilesToCopy := ClientFileList;
  For I := 0 to Length(FilesToCopy) -1 Do
  Begin
    If(FileExists(UODirName + '/' + FilesToCopy[I])) Then FileCount := FileCount + 1;
  end;
  If(POLDirSet) Then
  Begin
    If(NPos(':', UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + UoDataFileRootEdit.Text
    Else JunkPath := UoDataFileRootEdit.Text;

    CopyClientFilesBtn.Enabled:=False;
    CopyingFileLabel.Caption:='Copying file:';
    If(Not DirectoryExists(JunkPath)) Then CreateDir(JunkPath);
    For I := 0 to Length(FilesToCopy) - 1 Do
    Begin
      FileCopyReport.Caption:=FilesToCopy[I];
      FileCopyProgBar.Max:=FileCount;
      Application.ProcessMessages;
      CopySuccess := CopyFile(UODirName + '/' + FilesToCopy[I], JunkPath + FilesToCopy[I]);
      FileCopyProgBar.Position:=FileCopyProgBar.Position + 1;
      Application.ProcessMessages;
    end;
    CopyingFileLabel.Caption:='Finished copying client files.';
    FileCopyReport.Caption:='   ';
    CopyClientFilesBtn.Enabled:=True;
  end;
End;

procedure TPOLConfigurator.SetEcompileDefaultPathSettings();

Begin
  PolScriptRoot.Text := POLDirName + '/scripts';
  ModuleDirectory.Text := POLDirName + '/scripts/modules';
  IncludeDirectory.Text := POLDirName + '/scripts';
  PkgRootList.Clear;
  PkgRootList.AddItem(POLDirName + '/pkg', nil);
  PkgRootList.AddItem(POLDirName + '/devpkg', nil);
End;

procedure TPOLConfigurator.LoadConfigFiles(WhichFiles: String);

var
  TagsTemp: Integer = 0;
  TagBinVal: String = '';
  SettingsFile: String;
  ExpansionSetting: Integer =  0;
  // GenerateKey is used by the servers.cfg loader.
  GenerateKey: Boolean = False;
  X: Integer = 0;
  IPMatchCount: Integer;


Begin

  {---------------------------------------------------------------------------}
  {					Read pol.cfg file				                                      		}
  {---------------------------------------------------------------------------}
  // We need to know whether we're loading the default config files or the user's config files.
  // If it's the default then we will also want to save the entire file to each array for each file.
  // You'll see that later in this procedure. If it's the user's config files we don't want to
  // touch the arrays, only get the ParaVals for each ParamName setting.
  SettingsFile := 'pol.cfg';
  If(WhichFiles = 'default') Then
    	FName := ExtractFilePath(Application.ExeName) + 'DefaultFiles/default' + SettingsFile;
  If(WhichFiles = 'user') Then FName := POLDir.Text + '/' + SettingsFile;
  Try
  AssignFile(PolFile, FName);
  Reset(PolFile);
  I := 0;
  // We don't want to touch the CfgArray if we are reading the user's configs

  If(WhichFiles = 'default') Then PolCfgArraySize := 0;
  CfgParamsIndex := 0;
  PkgRootList.Clear();
  While Not(EOF(PolFile)) do
  Begin
    ParamName := '';
    Readln(PolFile, TLine);
    // Strip off leading and trailing unwanted characters.
    RemovePadChars(TLine, PadChars);
    // If the line isn't empty and doesn't start with a comment character then we want to process it.
    if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
      Begin
        JunkArray := ParseLine(TLine);
        ParamName := JunkArray[0];
        ParamVal := JunkArray[1];
        // We need to know the ordinal position of the parameter in the array and we use that number
        // in the 'case' statement.
        JunkInt := AnsiIndexStr(ParamName, PolCfgParamList);
        Case JunkInt of
          0: If(WhichFiles = 'user') Then UoDataFileRootEdit.Text := ParamVal
              Else UoDataFileRootEdit.Text := 'MUL/';
          1: If(WhichFiles = 'user') Then RealmDataPathEdit.Text := ParamVal
              Else RealmDataPathEdit.Text := 'realm/';
          2: If(WhichFiles = 'user') Then WorldDataPathEdit.Text := ParamVal
              Else WorldDataPathEdit.Text := 'data/';
          3: If(WhichFiles = 'user') Then PidFilePathEdit.Text := ParamVal
              Else PidFilePathEdit.Text := '/';
          4: ShowWarningGump.Checked := Numb2Dec(ParamVal,2) = 1;
          5: Begin
              // StList := ClientEncryptionVersion.Items;
              // ScratchInt := StList.IndexOf(ParamVal);
              // ClientEncryptionVersion.ItemIndex := ScratchInt;
            End;
          6: CountResourceTiles.Checked := Numb2Dec(ParamVal,2) = 1;
          7: RetainCleartextPasswords.Checked := Numb2Dec(ParamVal,2) = 1;
          8: AccountDataSaveEdit.Text := ParamVal;
          9: Begin
               ScratchInt := Numb2Dec(ParamVal, 10);
               MinCmdlevelToLoginCBox.ItemIndex := ScratchInt;
             End;
          10: InactivityWarningTimeoutEdit.Text := ParamVal;
          11: InactivityDisconnectTimeoutEdit.Text := ParamVal;
          12: Begin
                ScratchInt := Numb2Dec(ParamVal, 10);
                MinCmdLvlToIgnoreInactivityCBox.ItemIndex := ScratchInt;
              End;
          13: Begin
	            StList := ShutdownSaveTypeComboBox.Items;
                ScratchInt := StList.IndexOf(ParamVal);
                ShutdownSaveTypeComboBox.ItemIndex := ScratchInt;
              End;
          14: SingleThreadDecay.Checked := Numb2Dec(ParamVal,2) = 1;
          15: ThreadDecayStatistics.Checked := Numb2Dec(ParamVal,2) = 1;
          16: MaximumClientsEdit.Text := ParamVal;
          17: Begin
                ScratchInt := Numb2Dec(ParamVal, 10);
                MaximumClientsBypassCmdLevelCBox.ItemIndex := ScratchInt;
              End;
          18: Begin
	            StList := CharacterSlotsCBox.Items;
                ScratchInt := StList.IndexOf(ParamVal);
                CharacterSlotsCBox.ItemIndex := ScratchInt;
              End;
          19: AllowMultiClientsPerAccount.Checked := Numb2Dec(ParamVal,2) = 1;
          20: EnforceMountObjtype.Checked := Numb2Dec(ParamVal,2) = 1;
          21: DiscardOldEvents.Checked := Numb2Dec(ParamVal,2) = 1;
          22: WatchRpm.Checked := Numb2Dec(ParamVal,2) = 1;
          23: WatchSysload.Checked := Numb2Dec(ParamVal,2) = 1;
          24: LogSysload.Checked := Numb2Dec(ParamVal,2) = 1;
          25: LogScriptCycles.Checked := Numb2Dec(ParamVal,2) = 1;
          26: RunawayScriptThreshold.Text := ParamVal;
          27: ReportRunToCompletionScripts.Checked := Numb2Dec(ParamVal,2) = 1;
          28: ReportCriticalScripts.Checked := Numb2Dec(ParamVal,2) = 1;
          29: WatchMapCache.Checked := Numb2Dec(ParamVal,2) = 1;
          30: ShowSpeechColors.Checked := Numb2Dec(ParamVal,2) = 1;
          31: ThreadStacktracesWhenStuck.Checked := Numb2Dec(ParamVal,2) = 1;
          32: ShowRealmInfo.Checked := Numb2Dec(ParamVal,2) = 1;
          33: DisableNagle.Checked := Numb2Dec(ParamVal,2) = 1;
          34: UseSingleThreadLogin.Checked := Numb2Dec(ParamVal,2) = 1;
          35: ProfileCProps.Checked := Numb2Dec(ParamVal,2) = 1;
          36: MaxTileID.Text := ParamVal;
          37: MaxObjtype.Text := ParamVal;
          38: MaxCallDepth.Text := ParamVal;
          39: CacheInteractiveScripts.Checked := Numb2Dec(ParamVal,2) = 1;
          40: EnableAssertions.Checked := Numb2Dec(ParamVal,2) = 1;
          41: Begin
	            StList := AssertionFailureActionComboBox.Items;
                ScratchInt := StList.IndexOf(ParamVal);
                AssertionFailureActionComboBox.ItemIndex := ScratchInt;
              End;
          42: DumpStackOnAssertionFailure.Checked := Numb2Dec(ParamVal,2) = 1;
          43: EnableDebugLogCheckbox.Checked := Numb2Dec(ParamVal,2) = 1;
          44: DebugLevelEdit.Text := ParamVal;
          45: DebugPortEdit.Text := ParamVal;
          46: DebugPasswordEdit.Text := ParamVal;
          47: DebugLocalOnlyCheckbox.Checked := Numb2Dec(ParamVal,2) = 1;
          48: Begin
	            StList := MiniDumpTypeComboBox.Items;
                ScratchInt := StList.IndexOf(ParamVal);
                MiniDumpTypeComboBox.ItemIndex := ScratchInt;
              End;
          49: DisplayUnknownPackets.Checked := Numb2Dec(ParamVal,2) = 1;
          50: LogLevelEdit.Text := ParamVal;
          51: VerboseCheckbox.Checked := Numb2Dec(ParamVal,2) = 1;
          52: ReportMissingConfigsCheckbox.Checked := Numb2Dec(ParamVal,2) = 1;
          53: TimestampEveryLine.Checked := Numb2Dec(ParamVal,2) = 1;
          54: IgnoreLoadErrors.Checked := Numb2Dec(ParamVal,2) = 1;
          55: InhibitSavesCheckBox.Checked := Numb2Dec(ParamVal,2) = 1;
          56: RequireSpellbooks.Checked := Numb2Dec(ParamVal,2) = 1;
          57: EnableSecureTrading.Checked := Numb2Dec(ParamVal,2) = 1;
          58: EnableWebServerCheckBox.Checked := Numb2Dec(ParamVal,2) = 1;
          59: WebServerPortEdit.Text := ParamVal;
          60: WebServerLocalOnly.Checked := Numb2Dec(ParamVal,2) = 1;
          61: WebServerDebug.Checked := Numb2Dec(ParamVal,2) = 1;
          62: WebServerPasswordEdit.Text := ParamVal;
          63: ExpLosChecksMap.Checked := Numb2Dec(ParamVal,2) = 1;
          64: ReportCrashsAutomatically.Checked := Numb2Dec(ParamVal,2) = 1;
          65: ReportAdminEmailEdit.Text := ParamVal;
          66: ReportServerEdit.Text := ParamVal;
          67: ReportURLEdit.Text := ParamVal;
          68: Keyfile := ParamVal;
          69: ShowWarningItem.Checked := Numb2Dec(ParamVal,2) = 1;
          70: SelectTimeout := ParamVal;
          71: LoginServerTimeoutEdit.Text := ParamVal;
          72: ShowWarningCursorSequence.Checked := Numb2Dec(ParamVal,2) = 1;
          73: AllowedEnvironmentVariablesAccessEdit.Text := ParamVal;
        End;		// case
      End;				// if
    // We don't want to touch the CfgArray if we are reading the user's configs
    If(WhichFiles = 'default') Then PolContents[I] := TLine;
    I := I + 1;
  End;						// while
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then PolCfgArraySize := I;
  CloseFile(PolFile);

{---------------------------------------------------------------------------}
{					Read servspecopt.cfg file			                              			}
{---------------------------------------------------------------------------}
  SettingsFile := 'servspecopt.cfg';
  If((WhichFiles = 'user') and (FileExists(POLDir.Text + '/config/servspecopt.local.cfg'))) Then
    Begin
      SettingsFile := 'servspecopt.local.cfg';
      FName := POLDir.Text + '/config/' + SettingsFile;
      UseSpecoptLocal := True
    end
  Else FName := POLDir.Text + '/config/servspecopt.cfg';
  If(WhichFiles = 'default') Then FName := ExtractFilePath(Application.ExeName) + '/DefaultFiles/default' + SettingsFile;
  AssignFile(ServSpecOptFile, FName);
  Reset(ServSpecOptFile);
  I := 0;
  X := 0;
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then ServSpecOptCfgArraySize := 0;
  CfgParamsIndex := 0;
  While Not(EOF(ServSpecOptFile)) do
    Begin
      ParamName := '';
      Readln(ServSpecOptFile, TLine);
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then	//We want to parse this line
        Begin
          JunkArray := ParseLine(TLine);
          ParamName := JunkArray[0];
          ParamVal := JunkArray[1];
          if(ParamVal = '') Then ParamVal := '0';
          // We need to know the ordinal position of the parameter in the array and we use that number
          // in the 'case' statement.
          JunkInt := AnsiIndexStr(ParamName, ServSpecOptCfgParamList);
          Case JunkInt of
            0: StartingGold.Text := ParamVal;
            1: NewbieStartingEquipment.Checked := Numb2Dec(ParamVal,2) = 1;
            2:  Begin
                  StList := SupportFaces.Items;
                  ScratchInt := StList.IndexOf(ParamVal);
                  SupportFaces.ItemIndex := ScratchInt;
                End;
            3: CoreSendsSeason.Checked := Numb2Dec(ParamVal,2) = 1;
            4: CoreGuildMessages.Checked := Numb2Dec(ParamVal,2) = 1;
            5:  begin
                  CoreHandledTags := ParamVal;
                  TagsTemp := Hex2Dec(CoreHandledTags[3..6]);
                  TagsTemp := TagsTemp - BaseCoreTagsValue;
                  TagBinVal := Dec2Numb(TagsTemp, 5, 2);
                  for X := 5 downto 1 do
                  Begin
                    case X of
                      1: DisplayTitleGuild.Checked := TagBinVal[5..5] = '1';
                      2: DisplayFrozen.Checked := TagBinVal[4..4] = '1';
                      3: DisplayParalyzed.Checked := TagBinVal[3..3] = '1';
                      4: DisplaySquelched.Checked := TagBinVal[2..2] = '1';
                      5: DisplayDeafened.Checked := TagBinVal[1..1] = '1';
                    end; // case x
                  end; // for
                end; // switch 5
            6: SpeedhackPreventionCheckBox.Checked := Numb2Dec(ParamVal,2) = 1;
            7: SpeedHackMountRunDelayEdit.Text := ParamVal;
            8: SpeedHackMountWalkDelayEdit.Text := ParamVal;
            9: SpeedHackFootRunDelayEdit.Text := ParamVal;
            10: SpeedHackFootWalkDelayEdit.Text := ParamVal;
            11: ScriptedMerchantHandlers.Checked := Numb2Dec(ParamVal,2) = 1;
            12: UseTileFlagPrefix.Checked := Numb2Dec(ParamVal,2) = 1;
            13: DefaultDoubleclickRange.Text := ParamVal;
            14: DoubleClickWait.Text := ParamVal;
            15: DefaultLightLevel.Text := ParamVal;
            16: CoreSendsCaps.Checked := Numb2Dec(ParamVal,2) = 1;
            17: DefaultAttributeCap.Text := ParamVal;
            18: CoreHandledLocks.Checked := Numb2Dec(ParamVal,2) = 1;
            19: AllowMovingTrade.Checked := Numb2Dec(ParamVal,2) = 1;
            20: ForceNewObjCachePackets.Checked := Numb2Dec(ParamVal,2) = 1;
            21: PrivacyPaperdoll.Checked := Numb2Dec(ParamVal,2) = 1;
            22: SeperateSpeechTokens.Checked := Numb2Dec(ParamVal,2) = 1;
            23: SpeechRange.Text := ParamVal;
            24: WhisperRange.Text := ParamVal;
            25: YellRange.Text := ParamVal;
            26: CarryingCapacityMod.Text := ParamVal;
            27: DefaultCharacterHeight.Text := ParamVal;
            28: SendStatLocks.Checked := Numb2Dec(ParamVal,2) = 1;
            29: UseContainerSlots.Checked := Numb2Dec(ParamVal,2) = 1;
            30: MaxContainerSlots.Text := ParamVal;
            31: EventVisibilityCoreChecks.Checked := Numb2Dec(ParamVal,2) = 1;
            32: MovementUsesStamina.Checked := Numb2Dec(ParamVal,2) = 1;
            33: AllowSecureTradingInWarMode.Checked := Numb2Dec(ParamVal,2) = 1;
            34: TotalStatsAtCreation.Text := ParamVal;
            35: DecayItems.Checked := Numb2Dec(ParamVal,2) = 1;
            36: DefaultDecayTime.Text := ParamVal;
            37: DefaultContainerMaxItems.Text := ParamVal;
            38: DefaultContainerMaxWeight.Text := ParamVal;
            39: begin
                  // Convert the string hex value to decimal stripping the leading '0x'.
                  // It's bad form here but I am going to reuse TagsTemp as a temporary variable.
                  // I actually should change TagsTemp to a generic temp name like TempInt. :P
                  TagsTemp := Hex2Dec(ParamVal[3..6]);
                  // Next convert the decimal number to a string representation of the value in binary.
                  UOFSiege.Checked := ((TagsTemp and 4) > 0);		// bit 2 = 4 = 0x4
                  UOFNPCPopup.Checked := ((TagsTemp and 8) > 0);	// bit 3 = 8 = 0x8
                  // The following block of code is commented out and might not be needed any longer.
                  // Here we are going to extract the expansion setting.
                  //ExpansionSetting := TagsTemp and 416;						// AND it with 416 to get only the UO expansion bits.
                  //Case(ExpansionSetting) of
                  //  0: UOConvertSelect.ItemIndex := 0;						// none set			= 0		= 0x0	= Third Dawn
                  //  32: UOConvertSelect.ItemIndex := 1;						// bit 5			= 32 	= 0x20	= Age of Shadows
                  //  160: UOConvertSelect.ItemIndex := 2;						// bits 5 and 8 	= 160	= 0xA0	= Samurai Empire
                  //  416: UOConvertSelect.ItemIndex := 3;						// bits 5, 8, and 9 = 416	=0x1A0	= Mondain's Legacy
                  //End;		// case of ExpansionSetting
                  // Based on the MaxTileID value previously read in we
                  // will adjust the UOExpansion dropdown if need be.
                  //Case (LowerCase(MaxTileID.Text)) of
                  //  '0x7fff': UOExpansion.ItemIndex := 4; // High Seas
                  //  '0xffff': UOExpansion.ItemIndex := 5; // Time of Legends
                  //End;
                  UOFeatureEnable.Text := ParamVal;
                End;			// UOFeaturEnable operation
          
            40: HiddenTurnsCount.Checked := Numb2Dec(ParamVal,2) = 1;
            41:	Begin
                  StList := InvulTag.Items;
                  ScratchInt := StList.IndexOf(ParamVal);
                  InvulTag.ItemIndex := ScratchInt;
                End;
            42: MaxPathFindRange.Text := ParamVal;
            43: ItemColorMask.Text := ParamVal;
            44: HonorUnequipScriptOnDeath.Checked := Numb2Dec(ParamVal,2) = 1;
            45: MobilesBlockNpcMovement.Checked := Numb2Dec(ParamVal,2) = 1;
            46: UseWinLFH.Checked := Numb2Dec(ParamVal,2) = 1;
            47: DefaultAccessibleRange.Text := ParamVal;
            48: CoreIgnoresDefenceCaps.Checked := Numb2Dec(ParamVal,2) = 1;
            49: EnableWorldMapPackets.Checked := Numb2Dec(ParamVal,2) = 1;
          End;	// Case of JunkInt
        End;	// If line parser
      // The following is a workaround to set the UO Expansion drop-down list to
      // either High Seas, if MaxTileID set to 0x7FFF, or Time of Legends
      // if MaxTileId is set to 0xFFFF. This is the only way I could think of to
      // do this as POL does not have a UOFeatureEnable bit setting for those newer
      // expansions.
      //If(WhichFiles = 'user') Then
      //Begin
      //	Case(LowerCase(MaxTileID.Text)) of
      //  	'0x7fff': UOExpansion.ItemIndex := 4;
      //    '0xffff': UOExpansion.ItemIndex := 5;
      //  End;	// Case MaxTileId
      //end;		// If WhichFiles
      // We don't want to touch the CfgArray if we are reading the user's configs
      If(WhichFiles = 'default') Then ServSpecOptContents[I] := TLine;
      I := I + 1;
      
    End;	// While
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then ServSpecOptCfgArraySize := I;
  
  CloseFile(ServSpecOptFile);

{---------------------------------------------------------------------------}
{					Read combat.cfg file																							}
{---------------------------------------------------------------------------}
  SettingsFile := 'combat.cfg';
  If(WhichFiles = 'default') Then
  FName := ExtractFilePath(Application.ExeName) + 'DefaultFiles//default' + SettingsFile;
  
  If(WhichFiles = 'user') Then FName := POLDir.Text + '/config/' + SettingsFile;
  AssignFile(CombatFile, FName);
  Reset(CombatFile);
  I := 0;
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then CombatCfgArraySize := 0;
  CfgParamsIndex := 0;
  While Not(EOF(CombatFile)) do
    Begin
      ParamName := '';
      Readln(CombatFile, TLine);
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
        Begin
          JunkArray := ParseLine(TLine);
          ParamName := JunkArray[0];
          ParamVal := JunkArray[1];
          // We need to know the ordinal position of the parameter in the array and we use that number
          // in the 'case' statement.
          JunkInt := AnsiIndexStr(ParamName, CombatCfgParamList);
            Case JunkInt of
              0: DisplayParrySuccessMessages.Checked := Numb2Dec(ParamVal,2) = 1;
              1: WarmodeInhibitsRegen.Checked := Numb2Dec(ParamVal,2) = 1;
              2: WarModeDelay.Text := ParamVal;
              3: SingleCombat.Checked := Numb2Dec(ParamVal,2) = 1;
              4: CoreHitSounds.Checked := Numb2Dec(ParamVal,2) = 1;
              5: ScriptedAttackChecks.Checked := Numb2Dec(ParamVal,2) = 1;
              6: ResetSwingOnTurn.Checked := Numb2Dec(ParamVal,2) = 1;
              7: SendSwingPacket.Checked := Numb2Dec(ParamVal,2) = 1;
              8: SendDamagePacket.Checked := Numb2Dec(ParamVal,2) = 1;
              9: AttackWhileFrozen.Checked := Numb2Dec(ParamVal,2) = 1;
              10: SendAttackMsg.Checked := Numb2Dec(ParamVal,2) = 1;
            End;	//	case JunkInt
        End;	//	if
      // We don't want to touch the CfgArray if we are reading the user's configs
      If(WhichFiles = 'default') Then CombatContents[I] := TLine;
      I := I + 1;
    End;	//	while
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then CombatCfgArraySize := I - 1;
  CloseFile(CombatFile);

{---------------------------------------------------------------------------}
{					Read watch.cfg file																								}
{---------------------------------------------------------------------------}

  SettingsFile := 'watch.cfg';
  If(WhichFiles = 'default') Then
  FName := ExtractFilePath(Application.ExeName) + '/DefaultFiles/default' + SettingsFile;
  
  If(WhichFiles = 'user') Then FName := POLDir.Text + '/config/' + SettingsFile;
  AssignFile(WatchFile, FName);
  Reset(WatchFile);
  I := 0;
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then WatchCfgArraySize := 0;
  CfgParamsIndex := 0;
  While Not(EOF(WatchFile)) do
    Begin
      ParamName := '';
      Readln(WatchFile, TLine);
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
        Begin
          JunkArray := ParseLine(TLine);
          ParamName := JunkArray[0];
          ParamVal := JunkArray[1];
          // We need to know the ordinal position of the parameter in the array and we use that number
          // in the 'case' statement.
          JunkInt := AnsiIndexStr(ParamName, WatchCfgParamList);
          Case JunkInt of
            0: Combat.Checked := Numb2Dec(ParamVal,2) = 1;
            1: ProfileScripts.Checked := Numb2Dec(ParamVal,2) = 1;
          End;	//	case JunkInt
        End;	//	if
      // We don't want to touch the CfgArray if we are reading the user's configs
      If(WhichFiles = 'default') Then WatchContents[I] := TLine;
      I := I + 1;
    End;	//	while
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then WatchCfgArraySize := I - 1;
  CloseFile(WatchFile);

{---------------------------------------------------------------------------}
{					Read EcompileTab.cfg file																						}
{---------------------------------------------------------------------------}

  SettingsFile := 'ecompile.cfg';
  POLDirName := POLdir.Text;
  If(WhichFiles = 'default') Then FName := ExtractFilePath(Application.ExeName) + '/DefaultFiles/default' + SettingsFile;
  If(WhichFiles = 'user') Then FName := POLDir.Text + '/scripts/' + SettingsFile;
  AssignFile(EcompileFile, FName);
  Reset(EcompileFile);
  I := 0;
  PkgRootList.Clear();
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then EcompileCfgArraySize := 0;
  CfgParamsIndex := 0;
  While Not(EOF(EcompileFile)) do
    Begin
      ParamName := '';
      Readln(EcompileFile, TLine);
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
        Begin
          JunkArray := ParseLine(TLine);
          ParamName := JunkArray[0];
          ParamVal := JunkArray[1];
          // Now get the value on the right side of the equals '=' sign.
          // We need to know the ordinal position of the parameter in the array and we use that number
          // in the 'case' statement.
          JunkInt := AnsiIndexStr(ParamName, EcompileCfgParamList);
          Case JunkInt of
            0: If(WhichFiles = 'user') Then ModuleDirectory.Text := ParamVal
                Else ModuleDirectory.Text := ParamVal;
            1: If(WhichFiles = 'user') Then IncludeDirectory.Text := ParamVal
                Else IncludeDirectory.Text := ParamVal;
            2: If(WhichFiles = 'user') Then PolScriptRoot.Text := ParamVal
                Else PolScriptRoot.Text :=  ParamVal;
            3: If(WhichFiles = 'user') Then PkgRootList.AddItem(ParamVal, Nil)
                Else PkgRootList.AddItem(ParamVal, Nil);
            4: GenerateListing.Checked := Numb2Dec(ParamVal,2) = 1;
            5: GenerateDebugInfo.Checked := Numb2Dec(ParamVal,2) = 1;
            6: GenerateDebugTextInfo.Checked := Numb2Dec(ParamVal,2) = 1;
            7: DisplayWarnings.Checked := Numb2Dec(ParamVal,2) = 1;
            8: CompileAspPages.Checked := Numb2Dec(ParamVal,2) = 1;
            9: AutoCompileByDefault.Checked := Numb2Dec(ParamVal,2) = 1;
            10: UpdateOnlyOnAutoCompile.Checked := Numb2Dec(ParamVal,2) = 1;
            11: OnlyCompileUpdatedScripts.Checked := Numb2Dec(ParamVal,2) = 1;
            12: DisplaySummary.Checked := Numb2Dec(ParamVal,2) = 1;
            13: GenerateDependencyInfo.Checked := Numb2Dec(ParamVal,2) = 1;
            14: DisplayUpToDateScripts.Checked := Numb2Dec(ParamVal,2) = 1;
            15: OptimizeObjectMembers.Checked := Numb2Dec(ParamVal,2) = 1;
            16: ErrorOnWarning.Checked := Numb2Dec(ParamVal,2) = 1;
            17: ThreadedCompilation.Checked := Numb2Dec(ParamVal,2) = 1;
            18: NumberOfThreads.Text := ParamVal;
            19: ParanoiaWarnings.Checked := Numb2Dec(ParamVal,2) = 1;
            20: ErrorOnFileCaseMissmatch.Checked := Numb2Dec(ParamVal,2) = 1;
            21: EmParseTreeCacheSizeEdit.Text := ParamVal;
            22: IncParseTreeCacheSizeEdit.Text := ParamVal;
            23: VerbosityLevelEdit.Text := ParamVal;
          End;//	case JunkInt
        End;	//	if
      // We don't want to touch the CfgArray if we are reading the user's configs
      If(WhichFiles = 'default') Then EcompileContents[I] := TLine;
      I := I + 1;
    End;	//	while
  // We don't want to touch the CfgArray if we are reading the user's configs
  If(WhichFiles = 'default') Then EcompileCfgArraySize := I - 1;
  CloseFile(EcompileFile);
  ModuleDir := ModuleDirectory.Text;
  IncludeDir := IncludeDirectory.Text;
  PolScriptRootDir := PolScriptRoot.Text;

  {---------------------------------------------------------------------------}
  {					Read servers.cfg file																							}
  {---------------------------------------------------------------------------}

  SettingsFile := 'servers.cfg';
  If(WhichFiles = 'default') Then FName := ExtractFilePath(Application.ExeName) + '/DefaultFiles/default' + SettingsFile;
  If(WhichFiles = 'user') Then FName := POLDir.Text + '/config/' + SettingsFile;
  GenerateKey := False;
  ServerCount := 0;
  I := 0;
  ServerListSelectComboBox.Clear;
  AssignFile(ServersFile, FName);
  Reset(ServersFile);
  While Not(EOF(ServersFile)) do
  Begin
  	Readln(ServersFile, TLine);
    I := I + 1;
    JunkArray := ParseLine(TLine);
    // Add each line of servers.cfg to ServersContents.
    If(LowerCase(JunkArray[0]) = 'gameserver') Then
      Begin
        If(ServerCount = MaxServers) Then
        Begin
          ShowMessage('You have more than ' + Dec2Numb(MaxServers, 2, 10) + ' servers defined in your servers.cfg file.' + Chr(13) + Chr(10) +
          			  'The Configurator can currently only read in up to ' + Dec2Numb(MaxServers, 2, 10) + ' servers.' + Chr(13) + Chr(10) +
                      'This limitation may be fixed in a future update.');
          Break;
        End;
				If((JunkArray[1] = '')) Then GenerateKey := True
        Else ServerList[ServerCount].ServerKey := JunkArray[1];
        // While the line we are processing is not equal to a close brace
        While(TLine <> Chr(125)) Do
        Begin
          Readln(ServersFile, TLine);
          TLine := Trim(TLine);
          // Add each line of servers.cfg to ServersContents.
          JunkArray := ParseLine(TLine);
          Case LowerCase(Trim(JunkArray[0])) Of
            'name': ServerList[ServerCount].ServerName := Trim(JunkArray[1]);
            'ip': ServerList[ServerCount].ServerIP := Trim(JunkArray[1]);
            'port': ServerList[ServerCount].ServerPort := Trim(JunkArray[1]);
          End;	// Case
        End;	// While(TLine <> Cgr(125)) Do
        ServerListSelectComboBox.AddItem(ServerList[ServerCount].ServerName, nil);
        If(GenerateKey) Then ServerList[ServerCount].ServerKey := ServerList[ServerCount].ServerName;
 			  ServerCount := ServerCount + 1;
      End   // If(LowerCase(JunkArray[0]) = 'gameserver') Then
	End;	// While Not(EOF(ServersFile)) do
  CloseFile(ServersFile);
  ServerListSelectComboBox.ItemIndex := 0;
  ServerNameEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerName;
  ServerIPEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerIP;
  ServerPortEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerPort;

  {---------------------------------------------------------------------------}
  {					Read uoclient.cfg file																						}
  {---------------------------------------------------------------------------}

  SettingsFile := 'uoclient.cfg';
  If(WhichFiles = 'default') Then
  FName := ExtractFilePath(Application.ExeName) + '/DefaultFiles/default' + SettingsFile;
  If(WhichFiles = 'user') Then FName := POLDirName + '/config/' + SettingsFile;
  If(WhichFiles = 'user') Then
    Begin
      FoundFiles := FindAllFiles(POLDirName, SettingsFile, True);
      UOClientPath := FoundFiles[0];
      FName := FoundFiles[0];
    end;
  ListenerCount := 0;
  ListenerListSelectComboBox.Clear;
  AssignFile(UOClientFile, FName);
  Reset(UOClientFile);
  While Not(EOF(UOClientFile)) do
  Begin
	Readln(UOClientFile, TLine);
    JunkArray := ParseLine(TLine);
    If(LowerCase(JunkArray[0]) = 'general') Then
      While(JunkArray[0] <> Chr(125)) Do
        Begin
          Readln(UOClientFile, TLine);
          TLine := Trim(TLine);
          // Add each line of servers.cfg to ServersContents.
          JunkArray := ParseLine(TLine);
          Case LowerCase(JunkArray[0]) Of
            'strength':
                Begin
                UOCClientStrEdit.Text := JunkArray[0];
                UOCServerStrEdit.Text := JunkArray[1];
              end;
            'intelligence':
                Begin
                  UOCClientIntEdit.Text := JunkArray[0];
                  UOCServerIntEdit.Text := JunkArray[1];
                end;
            'dexterity':
                Begin
                  UOCClientDexEdit.Text := JunkArray[0];
                  UOCServerDexEdit.Text := JunkArray[1];
                end;
            'hits':
                Begin
                  UOCClientHPEdit.Text := JunkArray[0];
                  UOCServerHPEdit.Text := JunkArray[1];
                end;
            'mana':
                Begin
                  UOCClientManaEdit.Text := JunkArray[0];
                  UOCServerManaEdit.Text := JunkArray[1];
                end;
            'stamina':
                Begin
                  UOCClientStamEdit.Text := JunkArray[0];
                  UOCServerStamEdit.Text := JunkArray[1];
                end;
            'maxskillid': UOClientMaxSkillIDEdit.Text := JunkArray[1];
          End;				// Case
        end;					// While(TLine <> Cgr(125)) Do
  End; // While Not(EOF(UOClientFile))

  Reset(UOClientFile);
  While Not(EOF(UOClientFile)) do
  Begin
  	Readln(UOClientFile, TLine);
    JunkArray := ParseLine(TLine);
    If(LowerCase(JunkArray[0]) = 'listener') Then
      Begin
        If(ListenerCount >= MaxListeners) Then
        Begin
          ShowMessage('You have more than ' + Dec2Numb(MaxListeners, 2, 10) + ' Listeners defined in your uoclient.cfg file.' + Chr(13) + Chr(10) +
                      'The Configurator can currently only read in up to ' + Dec2Numb(MaxServers, 2, 10) + ' Listeners.' + Chr(13) + Chr(10) +
                      'This limitation may be fixed in a future update.');
          Break;
        End;
        ListenerList[ListenerCount].ListenerKey := JunkArray[1];
        // While the line we are processing is not equal to a close brace
        While(JunkArray[0] <> Chr(125)) Do
        Begin
          Readln(UOClientFile, TLine);
          TLine := Trim(TLine);
          // Add each line of servers.cfg to ServersContents.
          JunkArray := ParseLine(TLine);
          Case LowerCase(JunkArray[0]) Of
            'encryption':     Begin
                                ListenerList[ListenerCount].ListenerEncryption := Trim(JunkArray[1]);
                                ListenerList[ListenerCount].ListenerKey := Trim(JunkArray[1]);
                              end;
            'port':           ListenerList[ListenerCount].ListenerPort := Trim(JunkArray[1]);
            'aosresistances': ListenerList[ListenerCount].ListenerAoSResistances := (Numb2Dec(Trim(JunkArray[1]), 2) = 1);
            'keepclients':    ListenerList[ListenerCount].ListenerKeepClients := (Numb2Dec(Trim(JunkArray[1]), 2) = 1);
          End; // Case
        end;					// While(TLine <> Cgr(125)) Do
        ListenerListSelectComboBox.AddItem(ListenerList[ListenerCount].ListenerEncryption, nil);
        If(GenerateKey) Then ListenerList[ListenerCount].ListenerKey := ListenerList[ListenerCount].ListenerKey;
 			  ListenerCount := ListenerCount + 1;
      end;	// If(LowerCase(JunkArray[0]) = 'Listener') Then
	End;	// While Not(EOF(ListenersFile)) do
  CloseFile(UOClientFile);
  ListenerListSelectComboBox.ItemIndex := 0;
  ListenerNameEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKey;
  ListenerEncryptionEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerEncryption;
  ListenerPortEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerPort;
  AoSResistancesCheckBox.Checked := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerAoSResistances;
  KeepClientsCheckBox.Checked := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKeepClients;

  If(WhichFiles = 'user') Then
    Begin
	  FName := POLdirName + '/POLConfigurator.dat';
	  If(FileExists(FName)) Then
      begin
        // Read some settings unique to this POL installation in the POL Root such as path to UO files, World Data path etc.
        AssignFile(ConfiguratorDatFile, FName);
        Reset(ConfiguratorDatFile);
        ReadLn(ConfiguratorDatFile, TLine);
        UoDataFileRootEdit.Text := TLine;
        ReadLn(ConfiguratorDatFile, TLine);
        RealmDataPathEdit.Text := TLine;
        ReadLn(ConfiguratorDatFile, TLine);
        WorldDataPathEdit.Text := TLine;
        ReadLn(ConfiguratorDatFile, TLine);
        PidFilePathEdit.Text := TLine;
        ReadLn(ConfiguratorDatFile, TLine);
        UODir.Text := TLine;
        ReadLn(ConfiguratorDatFile, TLine);
        UOConvertSelect.ItemIndex := StrToInt(TLine);
        CloseFile(ConfiguratorDatFile);
        DataPathsLoaded := True;
      end;
    end;

  Except
    On ExceptionError : Exception Do
    Begin
      LoadFilesExceptionHandler(ExceptionError, WhichFiles, SettingsFile);
	  Exit;
    end;
  end;
//  finally
//  end;
  SettingsLoaded := True;
  EnablePages();

End;


procedure TPOLConfigurator.EnableAssertionsChange(Sender: TObject);
begin
  If(EnableAssertions.Checked) Then
  Begin
    DumpStackOnAssertionFailure.Enabled:=True;
    AssertFailActionLabel.Enabled:=True;
    AssertionFailureActionComboBox.Enabled:=True;
    AssertMaxDumpTypeLabel.Enabled:=True;
    MiniDumpTypeComboBox.Enabled:=True;
    SettingsChangedLabel.Visible:=True;
  end
  Else
  Begin
    DumpStackOnAssertionFailure.Enabled:=False;
    AssertFailActionLabel.Enabled:=False;
    AssertionFailureActionComboBox.Enabled:=False;
    AssertMaxDumpTypeLabel.Enabled:=False;
    MiniDumpTypeComboBox.Enabled:=False;
    SettingsChangedLabel.Visible:=True;
  end;

End;

procedure TPOLConfigurator.FormActivate ( Sender: TObject ) ;
begin
  POLConfigurator.caption := ProgName;

  If((POLdir.Text = 'POL location') or (UODir.Text = 'UO Installation Directory')) Then
  ShowMessage('Please set the location of your POL directory and' + Chr(13) + Chr(10) +
              'your UO installation. You can do this at the' + Chr(13) + Chr(10) +
              'bottom left of the Configurator. The default' + Chr(13) + Chr(10) +
              'settings will now be loaded.')
  Else
  ShowMessage('The default settings have been loaded' + Chr(13) + Chr(10) +
              'You may use them as your settings,' + Chr(13) + Chr(10) +
              'change them to suit your needs or' + Chr(13) + Chr(10) +
              'load your settings.');
end;

procedure TPOLConfigurator.FormCreate ( Sender: TObject ) ;

var
  PD : ProfRec;
  x : integer;

Begin

  Welcome.Show;
  Sleep(3000);
  //Welcome.Visible := False;
  //Welcome.Hide;

  TPCCfgFilePath := GetAppConfigDir(True);    // Get the prefered path to write our *.ini and other supporting cfg files.
  CreateDir(TPCCfgFilePath);                  // Create the directory.
  /////////////////////////////////////////////////////////////////////////////
  // If this version of the Configurator is copied into a directory
  // over an earlier version that stored TPC's cfg files in its own directory
  // we need to copy those files to their new home in C:/ProgramDats/TPC.
  If(FileExists(ExtractFilePath(Application.ExeName) + 'POLConfigurator.ini')) Then
    CopyFile(ExtractFilePath(Application.ExeName) + 'POLConfigurator.ini', TPCCfgFilePath + 'POLConfigurator.ini');
  DeleteFile(ExtractFilePath(Application.ExeName) + 'POLConfigurator.ini');
  If(FileExists(ExtractFilePath(Application.ExeName) + 'TPCProfiles')) Then
    CopyFile(ExtractFilePath(Application.ExeName) + 'TPCProfiles', TPCCfgFilePath + 'TPCProfiles.dat');
  DeleteFile(ExtractFilePath(Application.ExeName) + 'TPCProfiles');
  /////////////////////////////////////////////////////////////////////////////
  
  // Create the ini file if not already there.
  ConfigIni := TIniFile.Create(TPCCfgFilePath + 'POLConfigurator.ini');
  with ConfigIni do begin
    // If User's POL directory has a value else make it = to 'POL location'
    POLDirName := ReadString('Startup','Users POL directory','POL location');
    POLdir.Text := POLDirName;
    UODirName := ReadString('Startup','Users UO directory','UO Installation Directory');
    UODir.Text := UODirName;
    POLConfigurator.top   :=ReadInteger('Position and size','Top of window- from top of screen',90);
    POLConfigurator.left  :=ReadInteger('Position and size','Left',365);
    POLConfigurator.height:=ReadInteger('Position and size','Height',864);
    POLConfigurator.width :=ReadInteger('Position and size','Width',1406);
    EcompileSwitchesEdit.Text := ReadString('Misc','eCompileSwitches', '-a -A -r -f');
    If(FileExists(UODirName + '/client.exe') and FileExists(UODirName + '/UOPatch.exe')) Then
    Begin
      UODirSet := True;
      SettingsLoaded := True;
      FacetsTab.Enabled := True;
	  WriteString('Startup','Users UO directory', UODir.Text);
    End; //If FileExists
  end;//with...
  ConfigIni.Free;
  If((FileExists(POLDirName + '/pol.exe') and FileExists(POLDirName + '/uoconvert.exe') and FileExists(POLDirName + '/poltool.exe'))) Then
  Begin
    POLDirSet := True;
    EnablePages();
    LoadMyConfigFilesBtn.Enabled := True;
    CopyingFileLabel.Caption:='   ';
    FileCopyReport.Caption:='   ';
    SetEcompileDefaultPathSettings();
  End;		// If((FileExists(POLDirName + '/pol.exe') etc.
    CopyUOFilesGroupBox.Enabled:=True;
    // Enable POL settings pages if settings are loaded.
	If(SettingsLoaded) Then EnablePages();
    LoadConfigFiles('default');
    SetEcompileDefaultPathSettings();
    // Initialize ExtProgList array.
    For x := 0 to 6 Do
    Begin
      ExtProgList[x].ProgName:='<empty>';
      ExtProgList[x].ProgLoc:='<empty>';
    end;
    ReadExtProgsFromINI();
    ExternalBtn1.Caption:=ExtProgList[0].ProgName;
    ExternalBtn2.Caption:=ExtProgList[1].ProgName;
    ExternalBtn3.Caption:=ExtProgList[2].ProgName;
    ExternalBtn4.Caption:=ExtProgList[3].ProgName;
    ExternalBtn5.Caption:=ExtProgList[4].ProgName;
    ExternalBtn6.Caption:=ExtProgList[5].ProgName;
    ExternalBtn7.Caption:=ExtProgList[6].ProgName;
    ExternalBtn8.Caption:=ExtProgList[7].ProgName;
    // Load profiles.
    FName := TPCCfgFilePath + 'TPCProfiles.dat';
    AssignFile(ProfilesFile, FName);
    If(Not(FileExists(FName))) Then Rewrite(ProfilesFile);
    Reset(ProfilesFile);
    ProfileIndex := 0;
    x := 1;
    Profiles.Clear;
    While Not(Eof(ProfilesFile)) do
    Begin
      x := x + 1;
      Read(ProfilesFile, ProfileList[ProfileIndex]);
      PD := ProfileList[ProfileIndex];
      if(PD.ProfName <> '') Then
        Begin
          Profiles.AddItem(PD.ProfName, nil);
          ProfileIndex := ProfileIndex + 1;
        end;
	End;
  CloseFile(ProfilesFile);
  Profiles.ItemIndex:=0;

  // Load instructions
  Documentation.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/POL Configurator documentation.txt');
  // Documentation.Show;
  SettingsChangedLabel.Visible:=False;
  Application.ProcessMessages;
end;

procedure TPOLConfigurator.GamePlayTabContextPopup ( Sender: TObject; MousePos: TPoint;
     var Handled: Boolean ) ;
begin

end;

procedure TPOLConfigurator.SaveSettingsBtnClick ( Sender: TObject ) ;

Var
  J: Integer =0;
  PKGRootDone: Boolean = False;
  ConfiguratorDatFile: TextFile;
  JunkPath: String;		// For storing the contrived path.

  {---------------------------------------------------------------------------}
  {					Write pol.cfg file					                      }
  {---------------------------------------------------------------------------}

Begin
  If(POLDirSet = True) Then
  Begin
    // Just in case the user forgets to set the directories on the eCompile and Server Settings
    // tabs we will create them here to prevent any exception errors.
    If(NPos(':', UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + UoDataFileRootEdit.Text
    Else JunkPath := UoDataFileRootEdit.Text;
    If(Not DirectoryExists(JunkPath)) Then CreateDir(JunkPath);
    If(NPos(':', RealmDataPathEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + RealmDataPathEdit.Text
    Else JunkPath := RealmDataPathEdit.Text;
    If(Not DirectoryExists(JunkPath)) Then CreateDir(JunkPath);
    If(NPos(':', WorldDataPathEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + WorldDataPathEdit.Text
    Else JunkPath := WorldDataPathEdit.Text;
    If(Not DirectoryExists(JunkPath)) Then CreateDir(JunkPath);
    CheckForMissingFiles();
    I := 0;
    CfgParamsIndex := 0;
    FName := POLdirName + '/pol.cfg';
    AssignFile(PolFile, FName);
      Rewrite(PolFile);
      While I <= PolCfgArraySize do
      Begin
        TLine := PolContents[I];
        // Strip off leading and trailing unwanted characters.
        RemovePadChars(TLine, PadChars);
        // If the line isn't empty and doesn't start with a comment character then we want to process it.
        if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
        Begin
          JunkArray := ParseLine(TLine);
          ParamName := JunkArray[0];
          ParamVal := JunkArray[1];
          ParamVal := '0';
          // We need to know the ordinal position of the parameter in the array and we use that number
          // in the 'case' statement.
          JunkInt := AnsiIndexStr(ParamName, PolCfgParamList);
            Case JunkInt of
              0: ParamVal := UoDataFileRootEdit.Text;
              1: ParamVal := RealmDataPathEdit.Text;
              2: ParamVal := WorldDataPathEdit.Text;
              3: ParamVal := PidFilePathEdit.Text;
              4: ParamVal := IntToStr(StrToInt(BoolToStr(ShowWarningGump.Checked)) * -1);
              // 5: ParamVal := ClientEncryptionVersion.Items[ClientEncryptionVersion.ItemIndex];
              6: ParamVal := IntToStr(StrToInt(BoolToStr(CountResourceTiles.Checked)) * -1);
              7: ParamVal := IntToStr(StrToInt(BoolToStr(RetainCleartextPasswords.Checked)) * -1);
              8: ParamVal := AccountDataSaveEdit.Text;
              9: ParamVal := Dec2Numb(MinCmdlevelToLoginCBox.ItemIndex, 1, 10);
              10: ParamVal := InactivityWarningTimeoutEdit.Text;
              11: ParamVal := InactivityDisconnectTimeoutEdit.Text;
              12: ParamVal := Dec2Numb(MinCmdLvlToIgnoreInactivityCBox.ItemIndex, 1, 10);
              13: ParamVal := ShutdownSaveTypeComboBox.Items[ShutdownSaveTypeComboBox.ItemIndex];
              14: ParamVal := IntToStr(StrToInt(BoolToStr(SingleThreadDecay.Checked)) * -1);
              15: ParamVal := IntToStr(StrToInt(BoolToStr(ThreadDecayStatistics.Checked)) * -1);
              16: ParamVal := MaximumClientsEdit.Text;
              17: ParamVal := Dec2Numb(MaximumClientsBypassCmdLevelCBox.ItemIndex, 1, 10);
              18: ParamVal := CharacterSlotsCBox.Items[CharacterSlotsCBox.ItemIndex];
              19: ParamVal := IntToStr(StrToInt(BoolToStr(AllowMultiClientsPerAccount.Checked)) * -1);
              20: ParamVal := IntToStr(StrToInt(BoolToStr(EnforceMountObjtype.Checked)) * -1);
              21: ParamVal := IntToStr(StrToInt(BoolToStr(DiscardOldEvents.Checked)) * -1);
              22: ParamVal := IntToStr(StrToInt(BoolToStr(WatchRpm.Checked)) * -1);
              23: ParamVal := IntToStr(StrToInt(BoolToStr(WatchSysload.Checked)) * -1);
              24: ParamVal := IntToStr(StrToInt(BoolToStr(LogSysload.Checked)) * -1);
              25: ParamVal := IntToStr(StrToInt(BoolToStr(LogScriptCycles.Checked)) * -1);
              26: ParamVal := RunawayScriptThreshold.Text;
              27: ParamVal := IntToStr(StrToInt(BoolToStr(ReportRunToCompletionScripts.Checked)) * -1);
              28: ParamVal := IntToStr(StrToInt(BoolToStr(ReportCriticalScripts.Checked)) * -1);
              29: ParamVal := IntToStr(StrToInt(BoolToStr(WatchMapCache.Checked)) * -1);
              30: ParamVal := IntToStr(StrToInt(BoolToStr(ShowSpeechColors.Checked)) * -1);
              31: ParamVal := IntToStr(StrToInt(BoolToStr(ThreadStacktracesWhenStuck.Checked)) * -1);
              32: ParamVal := IntToStr(StrToInt(BoolToStr(ShowRealmInfo.Checked)) * -1);
              33: ParamVal := IntToStr(StrToInt(BoolToStr(DisableNagle.Checked)) * -1);
              34: ParamVal := IntToStr(StrToInt(BoolToStr(UseSingleThreadLogin.Checked)) * -1);
              35: ParamVal := IntToStr(StrToInt(BoolToStr(ProfileCProps.Checked)) * -1);
              36: ParamVal := MaxTileID.Text;
              37: ParamVal := MaxObjtype.Text;
              38: ParamVal := MaxCallDepth.Text;
              39: ParamVal := IntToStr(StrToInt(BoolToStr(CacheInteractiveScripts.Checked)) * -1);
              40: ParamVal := IntToStr(StrToInt(BoolToStr(EnableAssertions.Checked)) * -1);
              41: ParamVal := AssertionFailureActionComboBox.Items[AssertionFailureActionComboBox.ItemIndex];
              42: ParamVal := IntToStr(StrToInt(BoolToStr(DumpStackOnAssertionFailure.Checked)) * -1);
              43: ParamVal := IntToStr(StrToInt(BoolToStr(EnableDebugLogCheckbox.Checked)) * -1);
              44: ParamVal := DebugLevelEdit.Text;
              45: ParamVal := DebugPortEdit.Text;
              46: ParamVal := DebugPasswordEdit.Text;
              47: ParamVal := IntToStr(StrToInt(BoolToStr(DebugLocalOnlyCheckbox.Checked)) * -1);
              48: ParamVal := MiniDumpTypeComboBox.Items[MiniDumpTypeComboBox.ItemIndex];
              49: ParamVal := IntToStr(StrToInt(BoolToStr(DisplayUnknownPackets.Checked)) * -1);
              50: ParamVal := LogLevelEdit.Text;
              51: ParamVal := IntToStr(StrToInt(BoolToStr(VerboseCheckbox.Checked)) * -1);
              52: ParamVal := IntToStr(StrToInt(BoolToStr(ReportMissingConfigsCheckbox.Checked)) * -1);
              53: ParamVal := IntToStr(StrToInt(BoolToStr(TimestampEveryLine.Checked)) * -1);
              54: ParamVal := IntToStr(StrToInt(BoolToStr(IgnoreLoadErrors.Checked)) * -1);
              55: ParamVal := IntToStr(StrToInt(BoolToStr(InhibitSavesCheckBox.Checked)) * -1);
              56: ParamVal := IntToStr(StrToInt(BoolToStr(RequireSpellbooks.Checked)) * -1);
              57: ParamVal := IntToStr(StrToInt(BoolToStr(EnableSecureTrading.Checked)) * -1);
              58: ParamVal := IntToStr(StrToInt(BoolToStr(EnableWebServerCheckBox.Checked)) * -1);
              59: ParamVal := WebServerPortEdit.Text;
              60: ParamVal := IntToStr(StrToInt(BoolToStr(WebServerLocalOnly.Checked)) * -1);
              61: ParamVal := IntToStr(StrToInt(BoolToStr(WebServerDebug.Checked)) * -1);
              62: ParamVal := WebServerPasswordEdit.Text;
              63: ParamVal := IntToStr(StrToInt(BoolToStr(ExpLosChecksMap.Checked)) * -1);
              64: ParamVal := IntToStr(StrToInt(BoolToStr(ReportCrashsAutomatically.Checked)) * -1);
              65: ParamVal := ReportAdminEmailEdit.Text;
              66: ParamVal := ReportServerEdit.Text;
              67: ParamVal := ReportURLEdit.Text;
              68: ParamVal := KeyFile;
              69: ParamVal := IntToStr(StrToInt(BoolToStr(ShowWarningItem.Checked)) * -1);
              70: ParamVal := SelectTimeout;
              71: ParamVal := LoginServerTimeoutEdit.Text;
              72: ParamVal := IntToStr(StrToInt(BoolToStr(ShowWarningCursorSequence.Checked)) * -1);
              73: ParamVal := AllowedEnvironmentVariablesAccessEdit.Text;
            End;	// case
  	      TLine := ParamName + '=' + ParamVal;
        End;	// if (AnsiLeftStr(TLine, 1) <>...
        WriteLn(PolFile, TLine);
        I := I + 1;
      End;	// while
  CloseFile(PolFile);

  {---------------------------------------------------------------------------}
  {					Write servspecopt.cfg file			                        					}
  {---------------------------------------------------------------------------}
  I := 0;
  If(FileExists(POLDir.Text + '/config/servspecopt.local.cfg')) Then
  Begin
    FName := POLDir.Text + '/config/servspecopt.local.cfg';
  end
  Else FName := POLDir.Text + '/config/servspecopt.cfg';
  
  AssignFile(ServSpecOptFile, FName);
  Rewrite(ServSpecOptFile);
  
  While I <= ServSpecOptCfgArraySize do
    Begin
      TLine := ServSpecOptContents[I];
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
	    Begin
        JunkArray := ParseLine(TLine);
        ParamName := JunkArray[0];
        ParamVal := JunkArray[1];
        ParamVal := '0';
        // We need to know the ordinal position of the parameter in the array and we use that number
        // in the 'case' statement.
        JunkInt := AnsiIndexStr(ParamName, ServSpecOptCfgParamList);
        Case JunkInt of
          0: ParamVal := StartingGold.Text;
          1: ParamVal := IntToStr(StrToInt(BoolToStr(NewbieStartingEquipment.Checked)) * -1);
          2: ParamVal := SupportFaces.Items[SupportFaces.ItemIndex];
          3: ParamVal := IntToStr(StrToInt(BoolToStr(CoreSendsSeason.Checked)) * -1);
          4: ParamVal := IntToStr(StrToInt(BoolToStr(CoreGuildMessages.Checked)) * -1);
          5: ParamVal := CoreHandledTags;
          6: ParamVal := IntToStr(StrToInt(BoolToStr(SpeedhackPreventionCheckBox.Checked)) * -1);
          7: ParamVal := SpeedHackMountRunDelayEdit.Text;
          8: ParamVal := SpeedHackMountWalkDelayEdit.Text;
          9: ParamVal := SpeedHackFootRunDelayEdit.Text;
          10: ParamVal := SpeedHackFootWalkDelayEdit.Text;
          11: ParamVal := IntToStr(StrToInt(BoolToStr(ScriptedMerchantHandlers.Checked)) * -1);
          12: ParamVal := IntToStr(StrToInt(BoolToStr(UseTileFlagPrefix.Checked)) * -1);
          13: ParamVal := DefaultDoubleclickRange.Text;
          14: ParamVal := DoubleClickWait.Text;
          15: ParamVal := DefaultLightLevel.Text;
          16: ParamVal := IntToStr(StrToInt(BoolToStr(CoreSendsCaps.Checked)) * -1);
          17: ParamVal := DefaultAttributeCap.Text;
          18: ParamVal := IntToStr(StrToInt(BoolToStr(CoreHandledLocks.Checked)) * -1);
          19: ParamVal := IntToStr(StrToInt(BoolToStr(AllowMovingTrade.Checked)) * -1);
          20: ParamVal := IntToStr(StrToInt(BoolToStr(ForceNewObjCachePackets.Checked)) * -1);
          21: ParamVal := IntToStr(StrToInt(BoolToStr(PrivacyPaperdoll.Checked)) * -1);
          22: ParamVal := IntToStr(StrToInt(BoolToStr(SeperateSpeechTokens.Checked)) * -1);
          23: ParamVal := SpeechRange.Text;
          24: ParamVal := WhisperRange.Text;
          25: ParamVal := YellRange.Text;
          26: ParamVal := CarryingCapacityMod.Text;
          27: ParamVal := DefaultCharacterHeight.Text;
          28: ParamVal := IntToStr(StrToInt(BoolToStr(SendStatLocks.Checked)) * -1);
          29: ParamVal := IntToStr(StrToInt(BoolToStr(UseContainerSlots.Checked)) * -1);
          30: ParamVal := MaxContainerSlots.Text;
          31: ParamVal := IntToStr(StrToInt(BoolToStr(EventVisibilityCoreChecks.Checked)) * -1);
          32: ParamVal := IntToStr(StrToInt(BoolToStr(MovementUsesStamina.Checked)) * -1);
          33: ParamVal := IntToStr(StrToInt(BoolToStr(AllowSecureTradingInWarMode.Checked)) * -1);
          34: ParamVal := TotalStatsAtCreation.Text;
          35: ParamVal := IntToStr(StrToInt(BoolToStr(DecayItems.Checked)) * -1);
          36: ParamVal := DefaultDecayTime.Text;
          37: ParamVal := DefaultContainerMaxItems.Text;
          38: ParamVal := DefaultContainerMaxWeight.Text;
          39: ParamVal := UOFeatureEnable.Text;
          40: ParamVal := IntToStr(StrToInt(BoolToStr(HiddenTurnsCount.Checked)) * -1);
          41: ParamVal := InvulTag.Items[InvulTag.ItemIndex];
          42: ParamVal := MaxPathFindRange.Text;
          43: ParamVal := ItemColorMask.Text;
          44: ParamVal := IntToStr(StrToInt(BoolToStr(HonorUnequipScriptOnDeath.Checked)) * -1);
          45: ParamVal := IntToStr(StrToInt(BoolToStr(MobilesBlockNpcMovement.Checked)) * -1);
          46: ParamVal := IntToStr(StrToInt(BoolToStr(UseWinLFH.Checked)) * -1);
          47: ParamVal := DefaultAccessibleRange.Text;
          48: ParamVal := IntToStr(StrToInt(BoolToStr(CoreIgnoresDefenceCaps.Checked)) * -1);
          49: ParamVal := IntToStr(StrToInt(BoolToStr(EnableWorldMapPackets.Checked)) * -1);
        End;	// case
        TLine := ParamName + '=' + ParamVal;
      End;	// if (AnsiLeftStr(TLine, 1) <> '#')
      WriteLn(ServSpecOptFile, TLine);
	  I := I + 1;
    End;	// while
  CloseFile(ServSpecOptFile);


  {---------------------------------------------------------------------------}
  {					Write combat.cfg file						                            			}
  {---------------------------------------------------------------------------}
  
  I := 0;
  FName := POLdir.Text + '/config/combat.cfg';
  AssignFile(CombatFile, FName);
  Rewrite(CombatFile);
  
  While (I <= CombatCfgArraySize) do
    Begin
      TLine := CombatContents[I];
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
        Begin
          JunkArray := ParseLine(TLine);
          ParamName := JunkArray[0];
          ParamVal := JunkArray[1];
          ParamVal := '0';
          // We need to know the ordinal position of the parameter in the array and we use that number
          // in the 'case' statement.
          JunkInt := AnsiIndexStr(ParamName, CombatCfgParamList);
          Case JunkInt of
            0: ParamVal := IntToStr(StrToInt(BoolToStr(DisplayParrySuccessMessages.Checked)) * -1);
            1: ParamVal := IntToStr(StrToInt(BoolToStr(WarmodeInhibitsRegen.Checked)) * -1);
            2: ParamVal := WarModeDelay.Text;
            3: ParamVal := IntToStr(StrToInt(BoolToStr(SingleCombat.Checked)) * -1);
            4: ParamVal := IntToStr(StrToInt(BoolToStr(CoreHitSounds.Checked)) * -1);
            5: ParamVal := IntToStr(StrToInt(BoolToStr(ScriptedAttackChecks.Checked)) * -1);
            6: ParamVal := IntToStr(StrToInt(BoolToStr(ResetSwingOnTurn.Checked)) * -1);
            7: ParamVal := IntToStr(StrToInt(BoolToStr(SendSwingPacket.Checked)) * -1);
            8: ParamVal := IntToStr(StrToInt(BoolToStr(SendDamagePacket.Checked)) * -1);
            9: ParamVal := IntToStr(StrToInt(BoolToStr(AttackWhileFrozen.Checked)) * -1);
            10: ParamVal := IntToStr(StrToInt(BoolToStr(SendAttackMsg.Checked)) * -1);
          End;	// case
	      TLine := ParamName + '=' + ParamVal;

        End;	// if
      WriteLn(CombatFile, TLine);
      I := I + 1;
    End;	// while
  CloseFile(CombatFile);


  {---------------------------------------------------------------------------}
  {					Write watch.cfg file																							}
  {---------------------------------------------------------------------------}
  
  I := 0;
  FName := POLdir.Text + '/config/watch.cfg';
  AssignFile(WatchFile, FName);
  Rewrite(WatchFile);
  
  While (I <= WatchCfgArraySize) do
    Begin
      TLine := WatchContents[I];
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
      Begin
        JunkArray := ParseLine(TLine);
        ParamName := JunkArray[0];
        ParamVal := JunkArray[1];
        ParamVal := '0';
        // We need to know the ordinal position of the parameter in the array and we use that number
        // in the 'case' statement.
        JunkInt := AnsiIndexStr(ParamName, WatchCfgParamList);
        Case JunkInt of
          0: ParamVal := IntToStr(StrToInt(BoolToStr(Combat.Checked)) * -1);
          1: ParamVal := IntToStr(StrToInt(BoolToStr(ProfileScripts.Checked)) * -1);
        End;	// case
        TLine := ParamName + '=' + ParamVal;
   	  End;	// if
      WriteLn(WatchFile, TLine);
      I := I + 1;
    End;	// while
  CloseFile(WatchFile);

  {---------------------------------------------------------------------------}
  {					Write Ecompile cfg file																						}
  {---------------------------------------------------------------------------}
  
  I := 0;
  FName := POLdir.Text + '/scripts/ecompile.cfg';
  AssignFile(EcompileFile, FName);
  Rewrite(EcompileFile);
  
  While (I <= EcompileCfgArraySize) do
    Begin
      TLine := EcompileContents[I];
      // Strip off leading and trailing unwanted characters.
      RemovePadChars(TLine, PadChars);
      // If the line isn't empty and doesn't start with a comment character then we want to process it.
      if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
      Begin
        JunkArray := ParseLine(TLine);
        ParamName := JunkArray[0];
        ParamVal := JunkArray[1];
        ParamVal := '0';
        // We need to know the ordinal position of the parameter in the array and we use that number
        // in the 'case' statement.
        JunkInt := AnsiIndexStr(ParamName, EcompileCfgParamList);
        Case JunkInt of
          0: ParamVal := ModuleDirectory.Text;
          1: ParamVal := IncludeDirectory.Text;
          2: ParamVal := PolScriptRoot.Text;
          3: Begin
                If(PKGRootDone = False) Then
                Begin
                  For J := 0 to (PkgRootList.Items.Count - 1) do
                  Begin
                    ParamVal := PkgRootList.Items.Strings[J];
                    TLine := 'PackageRoot=' + ParamVal;
                    WriteLn(EcompileFile, TLine);
                  End; // For
                  PKGRootDone := True;
                  TLine := 'Blank';
                End // If
                Else TLine := 'Blank';
             End; // Switch 3
          4: ParamVal := IntToStr(StrToInt(BoolToStr(GenerateListing.Checked)) * -1);
          5: ParamVal := IntToStr(StrToInt(BoolToStr(GenerateDebugInfo.Checked)) * -1);
          6: ParamVal := IntToStr(StrToInt(BoolToStr(GenerateDebugTextInfo.Checked)) * -1);
          7: ParamVal := IntToStr(StrToInt(BoolToStr(DisplayWarnings.Checked)) * -1);
          8: ParamVal := IntToStr(StrToInt(BoolToStr(CompileAspPages.Checked)) * -1);
          9: ParamVal := IntToStr(StrToInt(BoolToStr(AutoCompileByDefault.Checked)) * -1);
          10: ParamVal := IntToStr(StrToInt(BoolToStr(UpdateOnlyOnAutoCompile.Checked)) * -1);
          11: ParamVal := IntToStr(StrToInt(BoolToStr(OnlyCompileUpdatedScripts.Checked)) * -1);
          12: ParamVal := IntToStr(StrToInt(BoolToStr(DisplaySummary.Checked)) * -1);
          13: ParamVal := IntToStr(StrToInt(BoolToStr(GenerateDependencyInfo.Checked)) * -1);
          14: ParamVal := IntToStr(StrToInt(BoolToStr(DisplayUpToDateScripts.Checked)) * -1);
          15: ParamVal := IntToStr(StrToInt(BoolToStr(OptimizeObjectMembers.Checked)) * -1);
          16: ParamVal := IntToStr(StrToInt(BoolToStr(ErrorOnWarning.Checked)) * -1);
          17: ParamVal := IntToStr(StrToInt(BoolToStr(ThreadedCompilation.Checked)) * -1);
          18: ParamVal := NumberOfThreads.Text;
          19: ParamVal := IntToStr(StrToInt(BoolToStr(ParanoiaWarnings.Checked)) * -1);
          20: ParamVal := IntToStr(StrToInt(BoolToStr(ErrorOnFileCaseMissmatch.Checked)) * -1);
          21: ParamVal := EmParseTreeCacheSizeEdit.Text;
          22: ParamVal := IncParseTreeCacheSizeEdit.Text;
          23: ParamVal := VerbosityLevelEdit.Text;
		    End;	// case
        If(Tline <> 'Blank') then TLine := ParamName + '=' + ParamVal;
      End;	// if AnsiString
      If(TLine <> 'Blank') Then WriteLn(EcompileFile, TLine);
  	  I := I + 1;
    End;	// while
  CloseFile(EcompileFile);
  {---------------------------------------------------------------------------}
  {					Write servers.cfg file																						}
  {---------------------------------------------------------------------------}

  I := 0;
  FName := POLdir.Text + '/config/servers.cfg';
  AssignFile(ServersFile, FName);
  Rewrite(ServersFile);

  While (I <= Length(ServersCfgPreamble)) do
    Begin
      TLine := ServersCfgPreamble[I];
      WriteLn(ServersFile, TLine);
      I := I + 1;
    End;	// while
  WriteLn(ServersFile, '');
  If(Length(ServerList) > 0) Then
	Begin
    For I := 0 to ServerCount - 1 do
      Begin
        WriteLn(ServersFile, 'GameServer' + Chr(09) + ServerList[I].ServerKey);
        // Open brace
        WriteLn(ServersFile, Chr(123));
        WriteLn(ServersFile, Chr(09) + 'Name' + Chr(09) + ServerList[I].ServerName);
        WriteLn(ServersFile, Chr(09) + 'IP' + Chr(09) + Chr(09) + ServerList[I].ServerIP);
        WriteLn(ServersFile, Chr(09) + 'Port' + Chr(09) + ServerList[I].ServerPort);
        // Close brace
        WriteLn(ServersFile, Chr(125));
        WriteLn(ServersFile, Chr(13) + Chr(10));
      end;    // For...
  End;    // If(Length(ServerList) > 0)...

  CloseFile(ServersFile);
  End;

  {---------------------------------------------------------------------------}
  {					Write uoclient.cfg file																						}
  {---------------------------------------------------------------------------}

  I := 0;
  // Get the location of the uoclient.cfg file.
  FoundFiles := FindAllFiles(POLDirName, 'uoclient.cfg', True);
  FName := FoundFiles[0];
  AssignFile(UOClientFile, FName);
  Rewrite(UOClientFile);

  While (I <> Length(UOClientCfgPreamble)) do
  Begin
    TLine := UOClientCfgPreamble[I];
    WriteLn(UOClientFile, TLine);
    I := I + 1;
  End;	// while
  WriteLn(UOClientFile, '');
  WriteLn(UOClientFile, 'General');
  WriteLn(UOClientFile, Chr(123));
  WriteLn(UOClientFile, Chr(09), UOCClientStrEdit.Text + Chr(09) + Chr(09) + UOCServerStrEdit.Text);
  WriteLn(UOClientFile, Chr(09), UOCClientIntEdit.Text + Chr(09) + UOCServerIntEdit.Text);
  WriteLn(UOClientFile, Chr(09), UOCClientDexEdit.Text + Chr(09) + Chr(09) + UOCServerDexEdit.Text);
  WriteLn(UOClientFile, Chr(09), UOCClientHPEdit.Text + Chr(09) + Chr(09) + Chr(09) + UOCServerHPEdit.Text);
  WriteLn(UOClientFile, Chr(09), UOCClientManaEdit.Text + Chr(09) + Chr(09) + Chr(09) + UOCServerManaEdit.Text);
  WriteLn(UOClientFile, Chr(09), UOCClientStamEdit.Text + Chr(09) + Chr(09) + Chr(09) + UOCServerStamEdit.Text);
  WriteLn(UOClientFile, Chr(09), 'MaxSkillID' + Chr(09) + UOClientMaxSkillIDEdit.Text);
  WriteLn(UOClientFile, Chr(125));
  WriteLn(UOClientFile, '');
  If(Length(ListenerList) > 0) Then
	Begin
    For I := 0 to ListenerCount - 1 do
      Begin
        WriteLn(UOClientFile, 'Listener' + Chr(09) + ListenerList[I].ListenerKey + '-' + ListenerList[I].ListenerPort);
        // Open brace
        WriteLn(UOClientFile, Chr(123));
        WriteLn(UOClientFile, Chr(09) + 'Port' + Chr(09) + ListenerList[I].ListenerPort);
        WriteLn(UOClientFile, Chr(09) + 'Encryption' + Chr(09) + Chr(09) + ListenerList[I].ListenerEncryption);
        IntToStr(StrToInt(BoolToStr(OptimizeObjectMembers.Checked)) * -1);
        WriteLn(UOClientFile, Chr(09) + 'AOSResistances' + Chr(09) + IntToStr(StrToInt(BoolToStr(ListenerList[I].ListenerAoSResistances)) * -1));
        WriteLn(UOClientFile, Chr(09) + 'KeepClients' + Chr(09) + IntToStr(StrToInt(BoolToStr(ListenerList[I].ListenerKeepClients)) * -1));
        // Close brace
        WriteLn(UOClientFile, Chr(125));
        WriteLn(UOClientFile, Chr(13) + Chr(10));
      end;
  end;
  CloseFile(UOClientFile);

  // Save some settings unique to this POL installation in the POL Root such as path to UO files, World Data path etc.
  FName := POLdirName + '\POLConfigurator.dat';
  AssignFile(ConfiguratorDatFile, FName);
  Rewrite(ConfiguratorDatFile);
  WriteLn(ConfiguratorDatFile, UoDataFileRootEdit.Text);
  WriteLn(ConfiguratorDatFile, RealmDataPathEdit.Text);
  WriteLn(ConfiguratorDatFile, WorldDataPathEdit.Text);
  WriteLn(ConfiguratorDatFile, PidFilePathEdit.Text);
  WriteLn(ConfiguratorDatFile, UODir.Text);
  WriteLn(ConfiguratorDatFile, IntToStr(UOConvertSelect.ItemIndex));
  CloseFile(ConfiguratorDatFile);			

  EnablePages();
  CheckAcctsAndPolTxtPresent();
  SettingsChangedLabel.Visible:=False;
End;

// This is a procedure attached to a button on the hidden tab.
// It is used for testing purposes.
procedure TPOLConfigurator.Button1Click(Sender: TObject);
var
  jint: integer;
begin
  ShowMessage(GetAppConfigDir(False));
end;

procedure TPOLConfigurator.ClearClientFilesClick(Sender: TObject);

var
  JunkPath: String;	// For storing the contrived path for UoDataFileRoot.
begin
  If(NPos(':', POLConfigurator.WorldDataPathEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + POLConfigurator.UoDataFileRootEdit.Text
  Else JunkPath := POLConfigurator.UoDataFileRootEdit.Text;
  DeleteDirectory(JunkPath, False);
  CreateDir(JunkPath);
  RequiredFilesPresentCheckBox.Checked := False;
end;

procedure TPOLConfigurator.ClearWorldDataBtnClick(Sender: TObject);
Begin
  If(ServerSettingsTab.Enabled) Then
  Begin
	AccountInfoEntryForm.NewActsAndPolTxtCheckBox.Checked:=False;
    AccountInfoEntryForm.ClearGameDataAuthorisationCheckBox.Checked:=False;
    AccountInfoEntryForm.UserNameEdit.Text:='';
    AccountInfoEntryForm.PasswordEdit.Text:='';
  	If(AccountInfoEntryForm.ShowModal = mrYes) Then ResetWorldData();
  End
  Else
  	ShowMessage('You must load your config files before' + Chr(13) + Chr(10) +
    			'clearing your world data.');

End;

procedure TPOLConfigurator.DecayItemsChange(Sender: TObject);
begin
  If(DecayItems.Checked) Then
  Begin
    ItemDecayLabel.Enabled:=True;
    DefaultDecayTime.Enabled:=True;
    DecayMinutesLabel.Enabled:=True;
    SettingsChangedLabel.Visible:=True;
  end
  Else
    Begin
    ItemDecayLabel.Enabled:=False;
    DefaultDecayTime.Enabled:=False;
    DecayMinutesLabel.Enabled:=False;
    SettingsChangedLabel.Visible:=True;
  end;

end;

procedure TPOLConfigurator.EnableDebugLogCheckboxChange(Sender: TObject);
begin
  if(EnableDebugLogCheckbox.Checked) Then
  Begin
  	VerboseCheckbox.Enabled:=true;
    DebugLevelLabel.Enabled:=true;
    DebugLevelEdit.Enabled:=true;
    LogLevelLabel.Enabled:=true;
    LogLevelEdit.Enabled:=true;
    ReportMissingConfigsCheckbox.Enabled:=true;
    DebugLocalOnlyCheckbox.Enabled:=true;
    DebugPortLabel.Enabled:=true;
    DebugPortEdit.Enabled:=true;
    DebugPwLabel.Enabled:=true;
    DebugPasswordEdit.Enabled:=true;
    SettingsChangedLabel.Visible:=True;
  end
  Else
  Begin
    VerboseCheckbox.Enabled:=false;
    DebugLevelLabel.Enabled:=false;
    DebugLevelEdit.Enabled:=false;
    LogLevelLabel.Enabled:=false;
    LogLevelEdit.Enabled:=false;
    ReportMissingConfigsCheckbox.Enabled:=false;
    DebugLocalOnlyCheckbox.Enabled:=false;
    DebugPortLabel.Enabled:=false;
    DebugPortEdit.Enabled:=false;
    DebugPwLabel.Enabled:=false;
    DebugPasswordEdit.Enabled:=false;
    SettingsChangedLabel.Visible:=True;
  end;
end;
//////////// Beginning of external program launcher button handlers ////////////
procedure TPOLConfigurator.ExternalBtn1Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn1, 0);
end;

procedure TPOLConfigurator.ExternalBtn2Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn2, 1);
end;

procedure TPOLConfigurator.ExternalBtn3Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn3, 2);
end;

procedure TPOLConfigurator.ExternalBtn4Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn4, 3);
end;

procedure TPOLConfigurator.ExternalBtn5Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn5, 4);
end;

procedure TPOLConfigurator.ExternalBtn6Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn6, 5);
end;

procedure TPOLConfigurator.ExternalBtn7Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn7, 6);
end;

procedure TPOLConfigurator.ExternalBtn8Click(Sender: TObject);

begin
  HandleExtrnProgButtons(ExternalBtn8, 7);
end;
//////////// End of external program launcher button handlers ////////////

procedure TPOLConfigurator.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  If(SettingsChangedLabel.Visible) Then
  Begin
    If(UnsavedSettingsFrm.ShowModal = mrYes) Then
    Begin
    	SaveSettingsBtnClick(POLConfigurator);
  		ShowMessage('Your settings were saved.');
    end;
  end;
end;

procedure TPOLConfigurator.InhibitSavesCheckBoxChange(Sender: TObject);
// Note to self: These enable/disable settings are the opposite of
// the other similar enable/disable settings due to the negative
// logic of this setting.
begin
  If(InhibitSavesCheckBox.Checked) Then
  Begin
    AcctDataSaveLabel.Enabled:=False;
    AccountDataSaveEdit.Enabled:=False;
    ShutdownSaveTypeLabel.Enabled:=False;
    ShutdownSaveTypeComboBox.Enabled:=False;
    SettingsChangedLabel.Visible:=True;
  end
  Else
  Begin
	AcctDataSaveLabel.Enabled:=True;
    AccountDataSaveEdit.Enabled:=True;
    ShutdownSaveTypeLabel.Enabled:=True;
    ShutdownSaveTypeComboBox.Enabled:=True;
	SettingsChangedLabel.Visible:=True;
  end;
end;

procedure TPOLConfigurator.MapSizeComboChange(Sender: TObject);
begin

end;

procedure TPOLConfigurator.MaxTileIDEditingDone(Sender: TObject);
begin
  If((LowerCase(MaxTileID.Text) <> '0x3fff') and (LowerCase(MaxTileID.Text) <> '0x7fff') and (LowerCase(MaxTileID.Text) <> '0xffff')) Then
  ShowMessage('You must enter a valid number for Maximum Art Tile ID.' +Chr(13) + Chr(10) +
              'Valid ranges are: 0x3FFF for pre-High Seas,'  +Chr(13) + Chr(10) +
              '0x7FFF for High Seas, and 0xFFFF for Time of Legends.');
end;

procedure TPOLConfigurator.RepackUOPBtnClick(Sender: TObject);

var
  JunkPath: String;	// For storing the contrived path.
  AProcess : TProcess;

begin
  If(NPos(':', UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + UoDataFileRootEdit.Text
  Else JunkPath := UoDataFileRootEdit.Text;

  If(UODirSet) Then
  	IF(DeleteUOPsCheckBox.Checked) Then DeleteUOPFiles();
    AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  	Rewrite(Configuratorbat);
  Begin
    Writeln(Configuratorbat, '"' + ExtractFilePath(Application.ExeName) + 'LegacyMULConverter-v4\LegacyMUL-N"\LegacyMULCL-N ' + '"' + JunkPath + '"');
    Writeln(Configuratorbat, 'pause');
    CloseFile(Configuratorbat);
    AProcess := TProcess.Create(nil);
    AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
    AProcess.Execute;
    AProcess.Free;
    BuildFilesBtn.Enabled := True;
  End

end;

procedure TPOLConfigurator.ReportCrashsAutomaticallyChange(Sender: TObject);
begin
  If(ReportCrashsAutomatically.Checked) Then
  Begin
	CrashEmailLabel.Enabled:=True;
	ReportAdminEmailEdit.Enabled:=True;
	CrashServerLabel.Enabled:=True;
	ReportServerEdit.Enabled:=True;
	CrashURLLabel.Enabled:=True;
	ReportURLEdit.Enabled:=True;
	SettingsChangedLabel.Visible:=True;
  end
  Else
  Begin
	CrashEmailLabel.Enabled:=False;
	ReportAdminEmailEdit.Enabled:=False;
	CrashServerLabel.Enabled:=False;
	ReportServerEdit.Enabled:=False;
	CrashURLLabel.Enabled:=False;
	ReportURLEdit.Enabled:=False;
	SettingsChangedLabel.Visible:=True;
  end;
end;

procedure TPOLConfigurator.RequiredFilesPresentCheckBoxChange(Sender: TObject);
begin
  If(RequiredFilesPresentCheckBox.Checked = True) Then
	Begin
	  CopyClientFilesBtn.Enabled:=True;
	  MapGenGroupBox.Enabled:=True;
	  TilesGroupBox.Enabled:=True;
	  UOPMULGroupBox.Enabled:=True;
	end
	Else
  Begin
    MapGenGroupBox.Enabled:=False;
    TilesGroupBox.Enabled:=False;
    UOPMULGroupBox.Enabled:=False;
  End
end;

procedure TPOLConfigurator.ServerNameEditChange(Sender: TObject);
begin
  UpdateServerBtn.Enabled:=True;
end;

procedure TPOLConfigurator.ListenerListSelectComboBoxChange(Sender: TObject);
begin
  If(ServerListSelectComboBox.ItemIndex >= 0) Then
  Begin
    ListenerNameEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKey;
    ListenerEncryptionEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerEncryption;
    ListenerPortEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerPort;
    AoSResistancesCheckBox.Checked := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerAoSResistances;
    KeepClientsCheckBox.Checked := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKeepClients;
  end;

end;

procedure TPOLConfigurator.RemoveListenerBtnClick(Sender: TObject);
var
  li: integer;
  index : Integer;
  Temp : ListenerRec;

begin
  If(ListenerCount > 1) Then
  Begin
    // Set li to the current position in ListenerListSelectComboBox Combo Box, the profile we want to delete.
    li := ListenerListSelectComboBox.ItemIndex;
    If(li < Length(ListenerList)) Then
    Begin
      For index := li to ListenerCount do
      Begin
    	  // Move the next item down in the array.
        ListenerList[index] := ListenerList[index + 1];
      end;
    End;
  
    // Clear the final entry that was moved down in the array.
    Temp.ListenerKey := '';
    Temp.ListenerPort := '';
    Temp.ListenerEncryption := '';
    Temp.ListenerAoSResistances := False;
    Temp.ListenerKeepClients := False;
    ListenerList[ListenerCount] := Temp;
    ListenerCount := ListenerCount - 1;
    if(ListenerCount <= 0) Then ListenerCount := 0;
    // Time to sync the array with the Listener List combobox.
    // Clear the combo box.
    ListenerListSelectComboBox.Clear;
    // Start at the beginning
    For index := 0 to (ListenerCount - 1) do
    Begin
      // We need a variable to hold the Listener record from the array.
      Temp := ListenerList[index];
      // Place the Listener name in the combo box list of items.
      If(Temp.ListenerKey <> '<empty>') Then ListenerListSelectComboBox.AddItem(Temp.ListenerKey, nil);
    end;		// For loop.
    ListenerListSelectComboBox.ItemIndex:=0;
    End			// If(ListenerCount > 1)
  Else
	Begin
    ListenerNameEdit.Text := '';
    ListenerPortEdit.Text := '';
    ListenerEncryptionEdit.Text := '';
    AoSResistancesCheckBox.Checked := False;
    KeepClientsCheckBox.Checked := False;
    ListenerListSelectComboBox.Clear;
  End;
  ListenerNameEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKey;
  ListenerEncryptionEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerEncryption;
  ListenerPortEdit.Text := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerPort;
  AoSResistancesCheckBox.Checked := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerAoSResistances;
  KeepClientsCheckBox.Checked := ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKeepClients;
  SettingsChangedLabel.Visible:=True;
end;

procedure TPOLConfigurator.SaveListenerBtnClick(Sender: TObject);
begin
  ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKey := ListenerNameEdit.Text;
  ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerEncryption := ListenerEncryptionEdit.Text;
  ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerPort := ListenerPortEdit.Text;
  ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerAoSResistances := AoSResistancesCheckBox.Checked;
  ListenerList[ListenerListSelectComboBox.ItemIndex].ListenerKeepClients := KeepClientsCheckBox.Checked;
  SettingsChangedLabel.Visible:=True;
end;

procedure TPOLConfigurator.UOFNPCPopupClick(Sender: TObject);
var
  temp : Integer;
begin
  temp := Hex2Dec(UOFeatureEnable.Text[3..6]);
  if(UOFNPCPopup.Checked) Then temp := temp or 8
  Else temp := temp and 65527;
  UOFeatureEnable.Text := '0x' + Dec2Numb(temp,4,16);
end;

procedure TPOLConfigurator.UpdateServerBtnClick(Sender: TObject);
begin
  ServerList[ServerListSelectComboBox.ItemIndex].ServerKey := ServerNameEdit.Text;
  ServerList[ServerListSelectComboBox.ItemIndex].ServerName := ServerNameEdit.Text;
  ServerList[ServerListSelectComboBox.ItemIndex].ServerIP := ServerIPEdit.Text;
  ServerList[ServerListSelectComboBox.ItemIndex].ServerPort := ServerPortEdit.Text;
  SettingsChangedLabel.Visible:=True;
end;


procedure TPOLConfigurator.RemoveServerBtnClick(Sender: TObject);

var
  si: integer;
  index : Integer;
  Temp : ServersRec;
begin
  If(ServerCount > 1) Then
  Begin
    // Set si to the current position in ServerListSelectComboBox Combo Box, the profile we want to delete.
    si := ServerListSelectComboBox.ItemIndex;
    If(si < Length(ServerList)) Then
    Begin
      For index := si to ServerCount do
      Begin
    	// Move the next item down in the array.
        ServerList[index] := ServerList[index + 1];
      end;
    End;
    // Clear the final entry that was moved down in the array.
    Temp.ServerKey := '';
    Temp.ServerName := '';
    Temp.ServerIP := '';
    Temp.ServerPort := '';
    ServerList[ServerCount] := Temp;
    ServerCount := ServerCount - 1;

    if(ServerCount <= 0) Then ServerCount := 0;
    // Time to sync the array with the Server List combobox.
    // Clear the combo box.
    ServerListSelectComboBox.Clear;
    // Start at the beginning
    For index := 0 to (ServerCount - 1) do
    Begin
  	  // We need a variable to hold the Server record from the array.
  	  Temp := ServerList[index];
      // Place the server name in the combo box list of items.
      If(Temp.ServerName <> '<empty>') Then
  	  ServerListSelectComboBox.AddItem(Temp.ServerName, nil);
    end;	// For loop.
    // Set the index to position 0.
    ServerListSelectComboBox.ItemIndex:=0;

  end	// If(ServerCount > 1)
  Else
  Begin
    ServerNameEdit.Text := '';
    ServerIPEdit.Text := '';
    ServerPortEdit.Text := '';
    ServerListSelectComboBox.Clear;
  End;
  ServerNameEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerName;
  ServerIPEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerIP;
  ServerPortEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerPort;
  SettingsChangedLabel.Visible:=True;
end;

procedure TPOLConfigurator.AddProfileBtnClick(Sender: TObject);

var
  NewProf : ProfRec;	// Temp variable.
  pi : integer;

begin
  // Make certain NewProfile is not empty.
  If(NewProfile.Text <> '') Then
  Begin
    // Make sure we have room for the new profile.
    If((ProfileIndex + 1) <= 10) Then
    Begin
      NewProf.ProfName := NewProfile.Text;
      NewProf.POLLoc := POLDir.Text;
      NewProf.UOLoc := UODir.Text;
      NewProf.UOExpansion := UOConvertSelect.ItemIndex;
      ProfileList[ProfileIndex] := NewProf;
      Profiles.AddItem(NewProfile.Text, nil);
  	  ProfileIndex := ProfileIndex + 1;
      // And save the ProfileList array to the file.
      FName := TPCCfgFilePath + 'TPCProfiles.dat';
      AssignFile(ProfilesFile, FName);
      Rewrite(ProfilesFile);
      For pi := 0 to Length(ProfileList) do
      Begin
        Write(ProfilesFile, ProfileList[pi]);
      end;
      CloseFile(ProfilesFile);
      Profiles.Clear;
      For pi := 0 to (ProfileIndex - 1) do
      Begin
        NewProf := ProfileList[pi];
        Profiles.AddItem(NewProf.ProfName, nil);
      end;
      Profiles.ItemIndex:=ProfileIndex - 1;
    end	//End of If(ProfileIndex + 1 <= 10)
    // No more room for profiles.
    Else
      ShowMessage('You have used all the spaces for profiles. You will need to delete a profile '+
                  'before you can add a new one.');
  end	// NewProfile...
  // NewProfile.Text is blank.
  Else
  Begin
    ShowMessage('You must enter a profile name in the "New Profile Name" box.');
  end;
end;

procedure TPOLConfigurator.AddListenerBtnClick(Sender: TObject);

var
  NewListener : ListenerRec;	// Temp variable.
  li : integer;
	I: Integer;
begin
  // Check edit boxes for text.
  If(ListenerEncryptionEdit.Text = '') Then
  Begin
    ShowMessage('You need to enter the ecryption for this listener.');
    Exit;
  end;
  If(ListenerPortEdit.Text = '') Then
  Begin
    ShowMessage('You need to enter a listener port.');
    Exit;
  end;
  // Check for duplicate server key and duplicate server name.
  For li := 0 to ListenerCount do
  Begin
    If(ListenerList[li].ListenerKey = ListenerNameEdit.Text) Then
    Begin
      ShowMessage('You already have a listener defined with the same name.');
      Exit;
    End;
  end;	// End 'For'.
  // Make sure we have room for the new profile.
  If((ListenerCount + 1) <= MaxListeners) Then
  Begin
    NewListener.ListenerKey := Trim(ListenerNameEdit.Text);
    NewListener.ListenerEncryption := Trim(ListenerEncryptionEdit.Text);
    NewListener.ListenerPort := Trim(ListenerPortEdit.Text);
    NewListener.ListenerAoSResistances := (AoSResistancesCheckBox.Checked);
    NewListener.ListenerKeepClients := (KeepClientsCheckBox.Checked);
    ListenerList[ListenerCount] := NewListener;
    ListenerListSelectComboBox.AddItem(ListenerNameEdit.Text, nil);
    ListenerCount := ListenerCount + 1;
    ListenerListSelectComboBox.Clear;
    SettingsChangedLabel.Visible:=True;
    For I := 1 to ListenerCount do
      Begin
        ListenerListSelectComboBox.AddItem(ListenerList[I - 1].ListenerKey, nil);
      end
  end	//End of If(ListenerCount + 1 <= MaxListeners)
  // No more room for profiles.
  Else ShowMessage( 'You have used all the spaces for defined listeners. You will need to delete a listener '+
                    'before you can add a new one.');
  ListenerListSelectComboBox.ItemIndex := ListenerListSelectComboBox.Items.Count -1;
end;

procedure TPOLConfigurator.ActTabForwardExecuteExecute(Sender: TObject);
begin
  // It is ServerConfigPages.PageCount -2 to prevent the Hidden Tab from showing.
  if(ServerConfigPages.TabIndex = ServerConfigPages.PageCount -2) then ServerConfigPages.TabIndex := 0
  else ServerConfigPages.TabIndex := ServerConfigPages.TabIndex+1;
end;

procedure TPOLConfigurator.ActTabBackExecuteExecute(Sender: TObject);
begin
  // It is ServerConfigPages.PageCount -2 to prevent the Hidden Tab from showing.
  if(ServerConfigPages.TabIndex = 0) then ServerConfigPages.TabIndex := ServerConfigPages.PageCount -2
  else ServerConfigPages.TabIndex := ServerConfigPages.TabIndex - 1;
end;

procedure TPOLConfigurator.ActHelpKeyExecute(Sender: TObject);
begin
  Documentation.Show;
end;

procedure TPOLConfigurator.POLBrowseBtnClick(Sender: TObject);

begin

  SelectDirectoryDialog1.Title:='Please select your POL installation directory:';
  if SelectDirectoryDialog1.Execute then POLDirName := SelectDirectoryDialog1.FileName;
  If(FileExists(POLDirName + '/pol.exe') and FileExists(POLDirName + '/scripts/ecompile.exe') and FileExists(POLDirName + '/uoconvert.exe')) Then
  Begin
    POLdir.Text := POLDirName; //SelectDirectoryDialog1.FileName;
    ConfigIni:=TIniFile.Create(TPCCfgFilePath + 'POLConfigurator.ini');
    with ConfigIni do begin
      WriteString('Startup','Users POL directory', POLDirName);
      // Save the position of the POL Configurator form.
      WriteInteger('Position and size','Top of window- from top of screen',POLConfigurator.top);
      WriteInteger('Position and size','Left',  POLConfigurator.left);
      WriteInteger('Position and size','Height',POLConfigurator.height);
      WriteInteger('Position and size','Width', POLConfigurator.width);
	  EcompileSwitchesEdit.Text := ReadString('Misc','eCompileSwitches', '-a -A -f');
    end;	//with...
    ConfigIni.Free;
    // Check for necessary config files.
    CheckForMissingFiles();

    POLDirSet := True;
    EnablePages();
  	SettingsChangedLabel.Visible:=False;
    LoadMyConfigFilesBtn.Enabled := True;
    SetEcompileDefaultPathSettings();
  End	// (FileExists(POLDirName...
  Else ShowMessage('You must select a valid POL directory. Either you accidentally chose the wrong directory or you might ' + Chr(13) + Chr(10) +
  'be missing one of three *.exe files that the Configurator uses to validate your POL location. Paths are relative to' + Chr(13) + Chr(10) +
  'your POL installation. These are /pol.exe, /scripts/ecompile.exe, and /scripts/runecl.exe. ' + Chr(13) + Chr(10) +
  'Please note that if you are missing other config files that the Configurator requires this may cause the program to crash. ' + Chr(13) + Chr(10) +
  'It only checks for these three in an attempt to provide some validation to avoid mistakes that the user might make.');
end;

Procedure TPOLConfigurator.BrowsePkgRootClick(Sender: Tobject);

Var
  I: Integer = 0;
  J: Integer = 0;
  ListLineCount: Integer = 0;
  JunkArray2: Array[0..999] of String;
  JunkString: String = '';

Begin
  SelectDirectoryDialog1.Title:='Path to the POL package root directory (Typically this is set to /pkg in your POL installation:';
  SelectDirectoryDialog1.FileName:='pkg';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  SelectDirectoryDialog1.Title:='Select your package root directory (typically one is /pkg under your POL installation):';
  if SelectDirectoryDialog1.Execute then JunkString := SelectDirectoryDialog1.FileName;
  If(Length(JunkString) = 0) Then Exit;
  PkgRootList.AddItem(JunkString, nil);
  SettingsChangedLabel.Visible:=True;
  While (I <= EcompileCfgArraySize) do
  Begin
    TLine := EcompileContents[I];
    // Strip off leading and trailing unwanted characters.
    RemovePadChars(TLine, PadChars);
    // If the line isn't empty and doesn't start with a comment character then we want to process it.
    if (AnsiLeftStr(TLine, 1) <> '#') and (Length(TLine) > 0) then
    Begin
      JunkArray := ParseLine(TLine);
      ParamName := JunkArray[0];
      ParamVal := JunkArray[1];
      // We need to know the ordinal position of the parameter in the array and we use that number
      // in the 'case' statement.
      JunkInt := AnsiIndexStr(ParamName, EcompileCfgParamList);
      // Find Last Occurrence of 'PackageRoot'
  	  If(ParamName = 'PackageRoot') Then
  	  Begin
  		While(ListLineCount < PkgRootList.Items.Count) do
      Begin
        JunkArray2[J] := 'PackageRoot=' + PkgRootList.Items.Strings[ListLineCount];
        ListLineCount := ListLineCount + 1;
        J := J + 1;
      End;
  		TLine := '';
  	  End	// If ParamName = 'PackageRoot'
    End;	// if(AnsiLeftStr(TLine, 1)
    JunkArray2[J] := TLine;
    I := I + 1;
    J := J + 1;
  End;	// while

End;

Procedure TPOLConfigurator.Delpkgclick(Sender: Tobject);
Begin
  If(PkgRootList.GetSelectedText <> '') Then
  Begin
    PkgRootList.DeleteSelected;
  	SettingsChangedLabel.Visible:=True;
  end;
End;

Procedure TPOLConfigurator.Includebrowseclick(Sender: Tobject);

var
  JunkPath: String = '';

Begin
  SelectDirectoryDialog1.Title:='Path to the POL includes directory (Typically this is set to /scripts in your POL installation:';
  SelectDirectoryDialog1.FileName:='scripts';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  SelectDirectoryDialog1.Title:='Select your "includes" directory (typically it is /scripts under your POL installation):';
  if SelectDirectoryDialog1.Execute then JunkPath := SelectDirectoryDialog1.FileName;
  IncludeDirectory.Text := JunkPath;
End;


Procedure TPOLConfigurator.BuildFilesBtnClick(Sender: Tobject);

var
  AProcess : TProcess;
  JunkPath: String;			    // For storing the contrived path.
  UOConvertFile: String = '';	// Used for specifying which uoconvert.cfg file to copy to the POL directory.

Begin
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName);
  If(BuildMultisCheckBox.Checked or BuildTilesCheckBox.Checked or BuildLandtilesCheckBox.Checked) Then
  Begin
    If(NPos(':', UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + UoDataFileRootEdit.Text
    Else JunkPath := UoDataFileRootEdit.Text;
    If((Not FileExists(JunkPath +'/multi.mul')) or (Not FileExists(JunkPath +'/multi.idx')) or (Not FileExists(JunkPath +'/tiledata.mul'))) Then
    Begin
      ShowMessage('Some of the files necessary for building the config files appear' + Chr(13) + Chr(10) +
                  'to be missing. Under normal circumstances this should not happen.' + Chr(13) + Chr(10) +
                  'Just to make sure there are no problems I will copy all of the' + Chr(13) + Chr(10) +
                  'client files again. Once the copy process is finished try to' + Chr(13) + Chr(10) +
                  'the selected cfg files again. If this problem persists your' + Chr(13) + Chr(10) +
                  'UO installation might be corrupted.');
      CopyClientFilesBtn.Enabled:=False;;
      CopyClientFiles();
      CopyClientFilesBtn.Enabled:=True;
      Exit;
    end;
    Case UOConvertSelect.ItemIndex of
      0: UOConvertFile := 'UOR_uoconvert.cfg';
      1: UOConvertFile := 'UOR_uoconvert.cfg';
      2: UOConvertFile := 'uoconvert.cfg';
      3: UOConvertFile := 'uoconvert.cfg';       
      4: UOConvertFile := 'uoconvert.cfg';
      5: UOConvertFile := 'ML_uoconvert.cfg';
      6: UOConvertFile := 'ML_uoconvert.cfg';
      7: UOConvertFile := 'HSA_uoconvert.cfg';       
      8: UOConvertFile := 'ToL_uoconvert.cfg';       
    end;
    DeleteFile(POLDirName + '/uoconvert.cfg');
    CopyFile(ExtractFilePath(Application.ExeName) + '/DefaultFiles/' + UOConvertFile, POLDirName + '/uoconvert.cfg');
    If(BuildMultisCheckBox.Checked) Then
    Begin
      Writeln(Configuratorbat, 'uoconvert multis');
      Writeln(Configuratorbat, 'move multis.cfg ' + '"' + POLDirName + '"/config')
  	End;
    If(BuildTilesCheckBox.Checked) Then
    Begin
      Writeln(Configuratorbat, 'uoconvert tiles');
      Writeln(Configuratorbat, 'move tiles.cfg ' + '"' + POLDirName + '"/config');
    End;
    If(BuildLandtilesCheckBox.Checked) Then
    Begin
      Writeln(Configuratorbat, 'uoconvert landtiles');
      Writeln(Configuratorbat, 'move landtiles.cfg ' + '"' + POLDirName + '"/config')
  	End;
  	Writeln(Configuratorbat, 'pause');
  	CloseFile(Configuratorbat);
  	If(BuildMultisCheckBox.Checked or BuildTilesCheckBox.Checked or BuildLandtilesCheckBox.Checked) Then
    Begin
      AProcess := TProcess.Create(nil);
      AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
      AProcess.Execute;
      AProcess.Free;
    End;
  End	// First If(BuildMultisCheckBox.Checked or 
  Else
  	ShowMessage('You must check at least one of the "Build" checkboxes above');
End;

Procedure TPOLConfigurator.BuildMultisCheckBoxChange(Sender: Tobject);
Begin

End;

Procedure TPOLConfigurator.BuildFacetsBtnClick(Sender: Tobject);

var
  mapsize: String;
  mapstring: String = ' map realm=';
  staticsstring: String = ' statics realm=';
  maptilesstring: String = ' maptile realm=';
  buildstring: String = '';
  difstring: String = ' usedif=';
  usedif: String;
  buildsomething: Boolean = False;
  AProcess : TProcess;
Begin
  mapsize := '6144';											// Third Dawn map size
  If(MapSizeCombo.ItemIndex = 1) Then mapsize := '7168';		// They've selected Mondain's Legacy map size
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName);
  If(BuildFelucca.Checked or BuildTrammel.Checked or BuildIlshenar.Checked or BuildMalas.Checked or BuildTokuno.Checked or BuildTermur.Checked) Then
  Begin
  buildsomething := True;
    If(BuildFelucca.Checked) Then
    Begin
      usedif := IntToStr(StrToInt(BoolToStr(UseFeluccaDif.Checked)) * -1);
      buildstring := '"' + POLDirName + '/uoconvert"' + mapstring + 'britannia' + ' mapid=0' + difstring + usedif + ' width=' + mapsize + ' height=4096';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + staticsstring + 'britannia';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + maptilesstring + 'britannia';
      Writeln(Configuratorbat, buildstring);
	  End;
    If(BuildTrammel.Checked) Then
    Begin
      usedif := IntToStr(StrToInt(BoolToStr(UseTrammelDif.Checked)) * -1);
      buildstring := '"' + POLDirName + '/uoconvert"' + mapstring + 'britannia_alt' + ' mapid=1' + difstring + usedif + ' width=' + mapsize + ' height=4096';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + staticsstring + 'britannia_alt';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + maptilesstring + 'britannia_alt';
      Writeln(Configuratorbat, buildstring);
   End;
    If(BuildIlshenar.Checked) Then
    Begin
      usedif := IntToStr(StrToInt(BoolToStr(UseIlshenarDif.Checked)) * -1);
      buildstring := '"' + POLDirName + '/uoconvert"' + mapstring + 'ilshenar' + ' mapid=2' + difstring + usedif + ' width=2304' + ' height=1600';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + staticsstring + 'ilshenar';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + maptilesstring + 'ilshenar';
      Writeln(Configuratorbat, buildstring);
	  End;
    If(BuildMalas.Checked) Then
    Begin
      usedif := IntToStr(StrToInt(BoolToStr(UseMalasDif.Checked)) * -1);
      buildstring := '"' + POLDirName + '/uoconvert"' + mapstring + 'malas' + ' mapid=3' + difstring + usedif + ' width=2560' + ' height=2048';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + staticsstring + 'malas';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + maptilesstring + 'malas';
      Writeln(Configuratorbat, buildstring);
	  End;
    If(BuildTokuno.Checked) Then
    Begin
      usedif := IntToStr(StrToInt(BoolToStr(UseTokunoDif.Checked)) * -1);
      buildstring := '"' + POLDirName + '/uoconvert"' + mapstring + 'tokuno' + ' mapid=4' + difstring + usedif + ' width=1448' + ' height=1448';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + staticsstring + 'tokuno';
      Writeln(Configuratorbat, buildstring);
      buildstring := '"' + POLDirName + '/uoconvert"' + maptilesstring + 'tokuno';
      Writeln(Configuratorbat, buildstring);
	  End;
    If(BuildTermur.Checked) Then
    Begin
      usedif := IntToStr(StrToInt(BoolToStr(UseTermurDif.Checked)) * -1);
      buildstring := '"' + POLDirName + '/uoconvert"' + mapstring + 'termur' + ' mapid=5' + difstring + usedif + ' width=1280' + ' height=4096';
      Writeln(Configuratorbat, buildstring);
      buildstring :='"' + POLDirName + '/uoconvert"' + staticsstring + 'termur';
      Writeln(Configuratorbat, buildstring);
      buildstring :='"' + POLDirName + '/uoconvert"' + maptilesstring + 'termur';
      Writeln(Configuratorbat, buildstring);
	  End;
	  Writeln(Configuratorbat, 'pause');
	  CloseFile(Configuratorbat);
	  If(buildsomething) Then
    Begin
      AProcess := TProcess.Create(nil);
      AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
      AProcess.Execute;
      AProcess.Free;
    End;
  End
  Else showmessage('You must check at least one of the "Build facet" checkboxes above');
end;

procedure TPOLConfigurator.DeleteProfileBtnClick(Sender: TObject);

var
  pi: integer;
  index : Integer;
  Temp : ProfRec;

begin
  If(ProfileIndex <> 0) Then
  Begin
    // Set pi to the current position in Profiles Combo Box, the profile we want to delete.
    pi := Profiles.ItemIndex;
    If(pi < Length(ProfileList)) Then
    Begin
      For index := pi to ProfileIndex do
      Begin
    	  // Move the next item down in the array.
        ProfileList[index] := ProfileList[index + 1];
      end;
    End;

    // Clear the final entry that was moved down in the array.
    Temp.ProfName:='';
    Temp.PolLoc:='';
    Temp.UOLoc:='';
    ProfileList[ProfileIndex] := Temp;
    ProfileIndex := ProfileIndex - 1;
    if(ProfileIndex <= 0) Then ProfileIndex := 0;
    // Time to sync the array with the Profiles combobox.
    // Clear the combo box.
    Profiles.Clear;
    // Start at the beginning
    For index := 0 to (ProfileIndex - 1) do
    Begin
  	  // We need a variable to hold the Profile record from the array.
  	  Temp := ProfileList[index];
      // Place the profile name in the combo box list of items.
      If(Temp.ProfName <> '<empty>') Then
  	  Profiles.AddItem(Temp.ProfName, nil);
    end;

    // And save the ProfileList array to the file.
    FName := TPCCfgFilePath + 'TPCProfiles';
    AssignFile(ProfilesFile, FName);
    Rewrite(ProfilesFile);
    For pi := 0 to Length(ProfileList) do
    Begin
      Write(ProfilesFile, ProfileList[pi]);
    end;

    CloseFile(ProfilesFile);
    If(ProfileIndex - 1 > -1) Then Profiles.ItemIndex:=ProfileIndex - 1;
  end;			// If(profileIndex <> 0)

end;

Procedure TPOLConfigurator.Doremovefilesclick(Sender: Tobject);

// Writes out a batch file to perform "clean-up" of the POL directory.
var
  AProcess : TProcess;

Begin
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName);
  // I copied the following code from another place in my code
  // but left in the 'Begin' and 'Ends' just in case I need to add something later.
  If(RemoveECL.Checked) Then Writeln(Configuratorbat, 'del /S *.ecl');
  If(RemoveDEP.Checked) Then Writeln(Configuratorbat, 'del /S *.dep');
  If(RemoveLST.Checked) Then Writeln(Configuratorbat, 'del /S *.lst');
  If(RemoveDBG.Checked) Then Writeln(Configuratorbat, 'del /S *.dbg');
  If(RemoveDBGTXT.Checked) Then Writeln(Configuratorbat, 'del /S *dbg.txt');
  If(RemoveBAK.Checked) Then Writeln(Configuratorbat, 'del /S *.bak');
  If(RemoveLOG.Checked) Then Writeln(Configuratorbat, 'del /S *.log');
  If(RemoveCustom.Checked) Then Writeln(Configuratorbat, 'del /S ' + RemoveOptional.Text);
  Writeln(Configuratorbat, 'pause');
  CloseFile(Configuratorbat);
  AProcess := TProcess.Create(nil);
  AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
  AProcess.Execute;
  AProcess.Free;

End;


Procedure TPOLConfigurator.ExtractMULsBtnClick(Sender: Tobject);
var
  UltimaDataFileRoot: String;
  AProcess : TProcess;
  JunkPath: String;	// For storing the contrived path.

Begin
  If(UODirSet) Then AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  If(NPos(':', UoDataFileRootEdit.Text, 1) < 1) Then JunkPath := POLDirName + '/' + UoDataFileRootEdit.Text
  Else JunkPath := UoDataFileRootEdit.Text;
  UltimaDataFileRoot := StringReplace(JunkPath, '/', '\', [rfReplaceAll]);
  IF(DeleteOldMULs.Checked) Then DeletePrevMULFiles();
  Writeln(Configuratorbat, '"' + ExtractFilePath(Application.ExeName) + 'LegacyMULConverter-v4\LegacyMUL-N"\LegacyMULCL-N -x "' + JunkPath + '"');
  Writeln(Configuratorbat, 'pause');
  CloseFile(Configuratorbat);
  AProcess := TProcess.Create(nil);
  AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
  AProcess.Execute;
  AProcess.Free;
  BuildFilesBtn.Enabled := True;
End;

procedure TPOLConfigurator.LoadProfileBtnClick(Sender: TObject);

var
  Temp : ProfRec;
begin
  If(Profiles.ItemIndex < 0) Then Exit;
  Temp := ProfileList[Profiles.ItemIndex];
  POLDir.Text := Temp.POLLoc;
  UODir.Text := Temp.UOLoc;
  UOConvertSelect.ItemIndex := Temp.UOExpansion;
  LoadConfigFiles('user');
  SettingsChangedLabel.Visible:=False;
  ShowMessage('The settings for that profile have been loaded.');
end;

Procedure TPOLConfigurator.RunPOLBtnClick(Sender: Tobject);
 
var
  AProcess : TProcess;
  JunkString : String;
Begin
  JunkString := POLDirName + '\pol.exe';
  AProcess := TProcess.Create(nil);
  AProcess.CurrentDirectory:=POLDirName;
  try
    AProcess.Executable := JunkString;
    AProcess.Options := AProcess.Options;
    AProcess.Execute;
    { Next lines assume the process returns zero if sucessful }
    if AProcess.ExitCode <> 0 then
      ShowMessageFmt('Error: %s reports error code %d', [JunkString, AProcess.ExitCode])
  finally
    AProcess.Free;
  end;
End;

procedure TPOLConfigurator.AddServerBtnClick(Sender: TObject);

var
  NewServer : ServersRec;	// Temp variable.
  si : integer;
  I: Integer;

begin
  // Check edit boxes for text.
  If(ServerNameEdit.Text = '') Then
  Begin
    ShowMessage('You need to enter a server name.');
    Exit;
  end;
  If(ServerIPEdit.Text = '') Then
  Begin
    ShowMessage('You need to enter a server IP.');
    Exit;
  end;
  If(ServerPortEdit.Text = '') Then
  Begin
    ShowMessage('You need to enter a server port.');
    Exit;
  end;

  // Check for duplicate server key and duplicate server name.
  For si := 0 to ServerCount do
  Begin
    If(ServerList[si].ServerName = ServerNameEdit.Text) Then
    Begin
      ShowMessage('You already have a server defined with the same name.');
      Exit;
    End;
  end;				// End 'For'.

  // Make sure we have room for the new profile.
  If((ServerCount + 1) <= MaxServers) Then
  Begin
    SettingsChangedLabel.Visible:=True;
    NewServer.ServerKey := Trim(ServerNameEdit.Text);
    NewServer.ServerName := Trim(ServerNameEdit.Text);
    NewServer.ServerIP := Trim(ServerIPEdit.Text);
    NewServer.ServerPort := Trim(ServerPortEdit.Text);
    ServerList[ServerCount] := NewServer;
    ServerListSelectComboBox.AddItem(ServerNameEdit.Text, nil);
    ServerCount := ServerCount + 1;
    ServerListSelectComboBox.Clear;
    For I := 1 to ServerCount do
      Begin
        ServerListSelectComboBox.AddItem(ServerList[I - 1].ServerName, nil);
      end
  end	 //End of If(ServerCount + 1 <= MaxServers)
  // No more room for servers.
  Else ShowMessage(	'You have used all the spaces for defined servers. You will need to delete a server '+
                    'before you can add a new one.');
  ServerListSelectComboBox.ItemIndex:=ServerListSelectComboBox.Items.Count - 1;

end;

procedure TPOLConfigurator.ServerListSelectComboBoxChange(Sender: TObject);

var
  Index: Integer;

begin
  If(ServerListSelectComboBox.ItemIndex >= 0) Then
  Begin
    ServerNameEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerName;
    ServerIPEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerIP;
    ServerPortEdit.Text := ServerList[ServerListSelectComboBox.ItemIndex].ServerPort;
    For Index := 0 to Length(ServerList[ServerListSelectComboBox.ItemIndex].IPMatchArray) - 1 do
    Begin
    End;
  End;
end;

procedure TPOLConfigurator.SpeedhackPreventionCheckBoxChange(Sender: TObject);
begin
  If(SpeedhackPreventionCheckBox.Checked) Then
  Begin
    SpdHackMountRunLabel.Enabled:=True;
    SpdHackMRMSLabel.Enabled:=True;
    SpdHackMountWlkLabel.Enabled:=True;
    SpdHackMWMSLabel.Enabled:=True;
    SpdHackFootRunLabel.Enabled:=True;
    SpdHackFRMSLabel.Enabled:=True;
    SpdHackFootWlkLabel.Enabled:=True;
    SpdHackFWMSLabel.Enabled:=True;
    SpeedHackMountRunDelayEdit.Enabled:=True;
    SpeedHackMountWalkDelayEdit.Enabled:=True;
    SpeedHackFootRunDelayEdit.Enabled:=True;
    SpeedHackFootWalkDelayEdit.Enabled:=True;
    SettingsChangedLabel.Visible:=True;
  end
  Else
  Begin
    SpdHackMountRunLabel.Enabled:=False;
    SpdHackMRMSLabel.Enabled:=False;
    SpdHackMountWlkLabel.Enabled:=False;
    SpdHackMWMSLabel.Enabled:=False;
    SpdHackFootRunLabel.Enabled:=False;
    SpdHackFRMSLabel.Enabled:=False;
    SpdHackFootWlkLabel.Enabled:=False;
    SpdHackFWMSLabel.Enabled:=False;
    SpeedHackMountRunDelayEdit.Enabled:=False;
    SpeedHackMountWalkDelayEdit.Enabled:=False;
    SpeedHackFootRunDelayEdit.Enabled:=False;
    SpeedHackFootWalkDelayEdit.Enabled:=False;
    SettingsChangedLabel.Visible:=True;
  end;
end;

Procedure TPOLConfigurator.TestLaunchPOLBtnClick(Sender: Tobject);

var
  AProcess : TProcess;

Begin
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'ExecutePOL.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName);
  Writeln(Configuratorbat, '"' + POLDirName + '/pol.exe"');
  Writeln(Configuratorbat, 'pause');
  CloseFile(Configuratorbat);
  AProcess := TProcess.Create(nil);
  AProcess.Executable := ExtractFilePath(Application.ExeName) + '/ExecutePOL.bat';
  AProcess.Execute;
  AProcess.Free;
End;

Procedure TPOLConfigurator.Modulebrowseclick(Sender: Tobject);

var
  JunkPath: String = '';

Begin
  SelectDirectoryDialog1.Title:='Path to the POL modules directory (Typically /modules in the /scripts directory in your POL installation:';
  SelectDirectoryDialog1.FileName:='modules';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  SelectDirectoryDialog1.Title:='Select your POL modules directory (Typically it is /scripts/modules under your POL installation):';
  if SelectDirectoryDialog1.Execute then JunkPath := SelectDirectoryDialog1.FileName;

  If(FileExists(JunkPath + '/uo.em') and FileExists(JunkPath + '/attributes.em') and FileExists(JunkPath + '/os.em')) Then
  ModuleDirectory.Text := JunkPath
  Else ShowMessage(	'You must select a valid directory where the POL modules can be found. This is typically '+
                    'under your POL scripts directory. Either you accidentally chose the wrong directory or '+
                    'you might be missing one of three EM files that the Configurator uses to validate your '+
                    'POL location. These are uo.em, attributes.em, and os.em. Please note that there are more '+
                    'modules required for POL to function but the Configurator only checks for these three in '+
                    'an attempt validate that you have chosen the correct directory.');


End;

Procedure TPOLConfigurator.Polscriptrootbrowseclick(Sender: Tobject);

Var
  JunkPath: String = '';

Begin
  SelectDirectoryDialog1.Title:='Path to the POL script root directory (Typically this is set to /scripts in your POL installation:';
  SelectDirectoryDialog1.FileName:='scripts';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  SelectDirectoryDialog1.Title:='Select your scripts root directory (typically it is /scripts under your POL installation):';
  if SelectDirectoryDialog1.Execute then JunkPath := SelectDirectoryDialog1.FileName;
  If((FileExists(JunkPath + '/ecompile.exe')) and (FileExists(JunkPath + '/ecompile.cfg'))) Then PolScriptRoot.Text := JunkPath
  Else ShowMessage(	'You must select a valid script root directory. This is typically under your POL directory. '+
                    'Either you accidentally chose the wrong directory or you might be missing one or more of '+
                    'the three files that the Configurator uses to validate your POL location. '+
                    'These are start.src, ecompile.exe, and ecompile.cfg.');

End;

Procedure TPOLConfigurator.SelAllFacetsClick(Sender: Tobject);
Begin
  If(SelAllFacets.Checked) Then
 	Begin
 	  BuildFelucca.Checked := True;
 	  BuildTrammel.Checked := True;
 	  BuildIlshenar.Checked := True;
 	  BuildMalas.Checked := True;
 	  BuildTokuno.Checked := True;
 	  BuildTermur.Checked := True;
     SelAllFacets.Caption := 'Unselect all facets (realms)';
  End
  Else
 	Begin
 	  BuildFelucca.Checked := False;
 	  BuildTrammel.Checked := False;
 	  BuildIlshenar.Checked := False;
 	  BuildMalas.Checked := False;
 	  BuildTokuno.Checked := False;
 	  BuildTermur.Checked := False;
    SelAllFacets.Caption := 'Select all facets (realms)';
  End;
End;


Procedure TPOLConfigurator.EcompileWithSwitchesBtnClick(Sender: Tobject);

var
  AProcess : TProcess;

Begin
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName + '/scripts');
  Writeln(Configuratorbat, 'ecompile ' + POLDirName + '/ ' + EcompileSwitchesEdit.Text);
  Writeln(Configuratorbat, 'pause');
  CloseFile(Configuratorbat);

  AProcess := TProcess.Create(nil);
  AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
  AProcess.Execute;
  AProcess.Free;
  ConfigIni:=TIniFile.Create(TPCCfgFilePath + 'POLConfigurator.ini');
  with ConfigIni do
  Begin
    WriteString('Misc','eCompileSwitches', EcompileSwitchesEdit.Text);
    ConfigIni.Free;
  End;
End;

Procedure TPOLConfigurator.CompileAllToLogBtnClick(Sender: Tobject);

var
  AProcess : TProcess;

Begin
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName + '/scripts');
  Writeln(Configuratorbat, 'ecompile ' + POLDirName + '/ -b -A -f -T > ' + POLDirName + '/log\ecompile.log 2> ' + POLDirName + '/log\ecompile_error.log');
  Writeln(Configuratorbat, 'pause');
  CloseFile(Configuratorbat);
  AProcess := TProcess.Create(nil);
  AProcess.CurrentDirectory := POLDirName + '/scripts';
  AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
  AProcess.Execute;
  AProcess.Free;
End;

Procedure TPOLConfigurator.CompileUpdatedBtnClick(Sender: Tobject);

var
  AProcess : TProcess;
Begin
  AssignFile(Configuratorbat, ExtractFilePath(Application.ExeName) + 'Configurator_tmp.bat');
  Rewrite(Configuratorbat);
  Writeln(Configuratorbat, 'cd /D ' + POLDirName + '/scripts');
  Writeln(Configuratorbat, 'ecompile ' + POLDirName + '/ -a -Au -D');
  Writeln(Configuratorbat, 'pause');
  CloseFile(Configuratorbat);
  AProcess := TProcess.Create(nil);
  AProcess.Executable := ExtractFilePath(Application.ExeName) + '/Configurator_tmp.bat';
  AProcess.Execute;
  AProcess.Free;
End;

Procedure TPOLConfigurator.CopyClientFilesBtnClick(Sender: Tobject);

Begin
  CopyClientFilesBtn.Enabled:=False;
  CopyClientFiles();
  CopyClientFilesBtn.Enabled:=True;
  MapGenGroupBox.Enabled:=True;
  TilesGroupBox.Enabled:=True;
  UOPMULGroupBox.Enabled:=True;

End;

procedure TPOLConfigurator.LoadDefaultsBtnClick(Sender: TObject);

Begin
  LoadConfigFiles('default');
  EnablePages();
  ShowMessage('The default settings have been loaded.' + Chr(13) + Chr(10) +
              'Please review the settings prior to' + Chr(13) + Chr(10) +
              'saving them to your POL installation.');
end;

procedure TPOLConfigurator.LoadMyConfigFilesBtnClick(Sender: TObject);

begin
  CheckForMissingFiles();
  LoadConfigFiles('user');
  EnablePages();
  CheckAcctsAndPolTxtPresent();
  SetEcompileDefaultPathSettings();
  SettingsChangedLabel.Visible:=False;
end;

procedure TPOLConfigurator.PidPathBrowseClick(Sender: TObject);
begin
  SelectDirectoryDialog1.Title:='Pid File Path (typically the main POL directory):';
  SelectDirectoryDialog1.FileName:='';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  if SelectDirectoryDialog1.Execute then
  FName := SetRelativePaths(SelectDirectoryDialog1.FileName);
  PidFilePathEdit.Text := FName + '/';
  If(Not DirectoryExists(PidFilePathEdit.Text)) Then CreateDir(PidFilePathEdit.Text);
end;
// Select all Use Dif files.
Procedure TPOLConfigurator.Selallusedifclick(Sender: Tobject);
Begin
  If(SelAllUseDif.Checked) Then
  Begin
    UseFeluccaDif.Checked := True;
    UseTrammelDif.Checked := True;
    UseIlshenarDif.Checked := True;
    UseMalasDif.Checked := True;
    UseTokunoDif.Checked := True;
    UseTermurDif.Checked := True;
    SelAllUseDif.Caption := 'Unselect all "Use Dif checkboxes';
  End
  Else
  Begin
    UseFeluccaDif.Checked := False;
    UseTrammelDif.Checked := False;
    UseIlshenarDif.Checked := False;
    UseMalasDif.Checked := False;
    UseTokunoDif.Checked := False;
    UseTermurDif.Checked := False;
    SelAllUseDif.Caption := 'Select all "Use Dif checkboxes';
  End;

End;

procedure TPOLConfigurator.UOFSiegeClick(Sender: Tobject);
var
  temp : Integer;
begin
  temp := Hex2Dec(UOFeatureEnable.Text[3..6]);
  if(UOFSiege.Checked) Then temp := temp or 4
  Else temp := temp and 65531;
  UOFeatureEnable.Text := '0x' + Dec2Numb(temp,4,16);
end;

Procedure TPOLConfigurator.UOBrowseClick(Sender: Tobject);
Begin
  SelectDirectoryDialog1.Title:='Please select your UO client installation directory:';
  // Create the ini file if not already there
  ConfigIni := TIniFile.Create(TPCCfgFilePath + 'POLConfigurator.ini');
  if SelectDirectoryDialog1.Execute then UODir.Text := SelectDirectoryDialog1.FileName;
  UODirName := UODir.Text;
  If(FileExists(UODirName + '/client.exe') and FileExists(UODirName + '/UOPatch.exe'))Then
  Begin
    UODirSet := True;
	  with ConfigIni do WriteString('Startup','Users UO directory', UODir.Text);
    If(POLDirSet = True) Then
    Begin
      CopyUOFilesGroupBox.Enabled:=True;
      EnablePages();
    End; // If POLDirSet
  End // If FileExists
  Else ShowMessage(	'You must select a valid UO directory. Either you accidentally entered the wrong directory info '+
                    'or you might be missing one of two files that the Configurator uses to validate your UO '+
                    'location. These are client.exe and UOPatch.exe. Please note that if you are missing other files '+
                    'that the Configurator requires this may cause the program to crash. It only checks for these two '+
                    'files in an attempt to provide some validation to avoid mistakes that the user might make.');
End;

procedure TPOLConfigurator.UOConvertSelectChange(Sender: TObject);

var
  UOConvertFile: String = '';   // Used for specifying which uoconvert.cfg file to copy to the POL directory.

begin
  case(UOConvertSelect.ItemIndex) of
    // Renaissance
    0:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := 0;
          UOConvertFile := 'UOR_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 0;
        end;
    // Third Dawn
    1:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := 0;
          UOConvertFile := 'UOR_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 0;
        end;
    // Lord Blackthorn's Revenge
    2:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := 0;
          UOConvertFile := 'UOR_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 0;
        end;
    // Age of Shadows
    3:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := UOFeatureEnableValue or 32;
          UOConvertFile := 'UOR_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 0;
        end;
    // Samurai Empire
    4:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := UOFeatureEnableValue or 160;
          UOConvertFile := 'UOR_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 0;
        end;
    // Mondain's Legacy
    5:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := UOFeatureEnableValue or 416;
          UOConvertFile := 'ML_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 1;
        end;
    // Stygian Abyss
    6:  begin
          MaxTileID.Text := '0x3FFF';
          UOFeatureEnableValue := UOFeatureEnableValue or 416;
          UOConvertFile := 'ML_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 1;
        end;
    // High Seas
    7:  begin
          MaxTileID.Text := '0x7FFF';
          UOFeatureEnableValue := UOFeatureEnableValue or 416;
          UOConvertFile := 'ML_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 1;
        end;
    // Time of Legends and, for now, future expansions
    8:  begin
          MaxTileID.Text := '0xFFFF';
          UOFeatureEnableValue := UOFeatureEnableValue or 416;
          UOConvertFile := 'ML_uoconvert.cfg';
          MapSizeCombo.ItemIndex := 1;
        end;
  end; // case...
  If UOFSiege.Checked Then UOFeatureEnableValue := UOFeatureEnableValue or 4;
  If UOFNPCPopup.Checked Then UOFeatureEnableValue := UOFeatureEnableValue or 8;
  UOFeatureEnable.Text := '0x' + Dec2Numb(UOFeatureEnableValue,4,16);

end;

procedure TPOLConfigurator.UpdateProfileBtnClick(Sender: TObject);

var
  UpdatedProf : ProfRec;

begin
  UpdatedProf.POLLoc := POLDir.Text;
  UpdatedProf.UOLoc := UODir.Text;
  UpdatedProf.UOExpansion := UOConvertSelect.ItemIndex;
  ProfileList[Profiles.ItemIndex] := UpdatedProf;
end;

procedure TPOLConfigurator.UseContainerSlotsChange(Sender: TObject);
begin
  If(UseContainerSlots.Checked) Then
  Begin
    MaxContSlotsLabel.Enabled:=True;
    MaxContainerSlots.Enabled:=True;
    ContSlotsLabel.Enabled:=True;
  end
  Else
  Begin
    MaxContSlotsLabel.Enabled:=False;
    MaxContainerSlots.Enabled:=False;
    ContSlotsLabel.Enabled:=False;
  end;
  SettingsChangedLabel.Visible:=True;

end;

procedure TPOLConfigurator.UsePOLRootClick(Sender: TObject);
begin
  PolScriptRoot.Text := POLDirName + '/scripts';
  ModuleDirectory.Text := POLDirName + '/scripts/modules';
  IncludeDirectory.Text := POLDirName + '/scripts';
  PkgRootList.Clear;
  PkgRootList.AddItem(POLDirName + '/pkg', nil);
  PkgRootList.AddItem(POLDirName + '/devpkg', nil);
end;

procedure TPOLConfigurator.EnableWebServerCheckBoxChange(Sender: TObject);
begin
  If(EnableWebServerCheckBox.Checked) Then
  Begin
    WebServerLocalOnly.Enabled:=True;
    WebserverPortLabel.Enabled:=True;
    WebServerPortEdit.Enabled:=True;
    WebserverPasswordLabel.Enabled:=True;
    WebServerPasswordEdit.Enabled:=True;
    SettingsChangedLabel.Visible:=True;
  end
  Else
  Begin
    WebServerLocalOnly.Enabled:=False;
    WebserverPortLabel.Enabled:=False;
    WebServerPortEdit.Enabled:=False;
    WebserverPasswordLabel.Enabled:=False;
    WebServerPasswordEdit.Enabled:=False;
    SettingsChangedLabel.Visible:=True;
  end;
end;

procedure TPOLConfigurator.WorldDataPathBrowseClick(Sender: TObject);
begin
  SelectDirectoryDialog1.Title:='World Data Path:';
  SelectDirectoryDialog1.FileName:='data';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  if SelectDirectoryDialog1.Execute then
  FName := SetRelativePaths(SelectDirectoryDialog1.FileName);
  WorldDataPathEdit.Text := FName + '/';
  CheckAcctsAndPolTxtPresent();
end;

procedure TPOLConfigurator.UODataPathBrowseClick(Sender: TObject);
begin
  SelectDirectoryDialog1.Title:='Path to UO Datafiles:';
  SelectDirectoryDialog1.FileName:='MUL';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  if SelectDirectoryDialog1.Execute then FName := SetRelativePaths(SelectDirectoryDialog1.FileName);
  UoDataFileRootEdit.Text := FName + '/';
end;

procedure TPOLConfigurator.RealmPathBrowseClick(Sender: TObject);
begin
  SelectDirectoryDialog1.Title:='Realm Data Path:';
  SelectDirectoryDialog1.FileName:='realm';
  SelectDirectoryDialog1.InitialDir:=POLDirName;
  if SelectDirectoryDialog1.Execute then FName := SetRelativePaths(SelectDirectoryDialog1.FileName);
  RealmDataPathEdit.Text := FName + '/';
end;

procedure TPOLConfigurator.DisplayTitleGuildChange(Sender: TObject);
begin
  IF(DisplayTitleGuild.Checked) Then CoreTagsValue := CoreTagsValue + 1
  Else CoreTagsValue := CoreTagsValue - 1;
  CoreHandledTags := '0x' + IntToHex(CoreTagsValue + BaseCoreTagsValue, 4);
  SettingsChangedLabel.Visible:=True;
end;

procedure TPOLConfigurator.DisplayFrozenChange(Sender: TObject);
begin
  IF(DisplayFrozen.Checked) Then CoreTagsValue := CoreTagsValue + 2
  Else CoreTagsValue := CoreTagsValue - 2;
  CoreHandledTags := '0x' + IntToHex(CoreTagsValue + BaseCoreTagsValue, 4);
  SettingsChangedLabel.Visible:=True;
end;

procedure TPOLConfigurator.DisplayParalyzedChange(Sender: TObject);
begin
  IF(DisplayParalyzed.Checked) Then CoreTagsValue := CoreTagsValue + 4
  Else CoreTagsValue := CoreTagsValue - 4;
  CoreHandledTags := '0x' + IntToHex(CoreTagsValue + BaseCoreTagsValue, 4);
end;

procedure TPOLConfigurator.DisplaySquelchedChange(Sender: TObject);
begin
  IF(DisplaySquelched.Checked) Then CoreTagsValue := CoreTagsValue + 8
  Else CoreTagsValue := CoreTagsValue - 8;
  CoreHandledTags := '0x' + IntToHex(CoreTagsValue + BaseCoreTagsValue, 4);
  SettingsChangedLabel.Visible:=True;
end;

procedure TPOLConfigurator.DisplayDeafenedChange(Sender: TObject);
begin
  IF(DisplayDeafened.Checked) Then CoreTagsValue := CoreTagsValue + 16
  Else CoreTagsValue := CoreTagsValue - 16;
  CoreHandledTags := '0x' + IntToHex(CoreTagsValue + BaseCoreTagsValue, 4);
  SettingsChangedLabel.Visible:=True;
end;




initialization
  {$I polcfgedit.lrs}
  {}

end.


