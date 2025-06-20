-- Fri Jun 20 22:54:14 UTC 2025
--
-- Unofficial Arturia Minilab3 configuration for Logic Pro.
--
-- Loosely based on config.lua by Farès MEZDOUR (Copyright (c) 2022 Farès MEZDOUR).
--
-- Copyright (c) 2025 Krystian Lewandowski.
-- k.lewandowski+midi@icloud.com
--
-- MIT License
--

arturia = {
    CONFIG_VERSION = 11,

    MIDI_PORT_IN = 'MIDI',
    MIDI_PORT_OUT = 'MIDI',

    SYSEX_MESSAGE_DEVICE_REQUEST = { 0xF0, 0x7E, MIDI_Wildcard, 0x06, 0x01, 0xF7 },
    SYSEX_MESSAGE_DEVICE_RESPONSE = { 0xF0, 0x7E, 0x7F, MIDI_Wildcard, 0x02, 0x00, 0x20, 0x6B, 0x02, 0x00, 0x04, 0x04,
        MIDI_Wildcard, MIDI_Wildcard, MIDI_Wildcard, MIDI_Wildcard, 0xF7 },

    SYSEX_MESSAGE_PREFIX = { 0xF0, 0x00, 0x20, 0x6B, 0x7F, 0x42 },
    SYSEX_MESSAGE_SUFFIX = { 0xF7 },

    SYSEX_DATA_CONNECT = { 0x02, 0x02, 0x40, 0x6A, 0x21 },
    SYSEX_DATA_DISCONNECT = { 0x02, 0x02, 0x40, 0x6A, 0x20 },

    SYSEX_DATA_PAD_PREFIX = { 0x02, 0x02, 0x16 },

    BUTTON_SHIFT_PRESSED_MIDI_MSG = { [0] = 0xB0, [1] = 0x1B, [2] = 0x7F },

    PAD_LOOP_MIDI_MSG = { [0] = 0x99, [1] = 0x27, [2] = MIDI_Wildcard },
    PAD_LOOP_ACTUAL_MIDI_MSG = { [0] = 0xB0, [1] = 0x69, [2] = 0x7F },

    PAD_STOP_MIDI_MSG = { [0] = 0x99, [1] = 0x28, [2] = MIDI_Wildcard },
    PAD_STOP_ACTUAL_MIDI_MSG = { [0] = 0xB0, [1] = 0x6A, [2] = 0x7F },

    PAD_PLAY_MIDI_MSG = { [0] = 0x99, [1] = 0x29, [2] = MIDI_Wildcard },
    PAD_PLAY_ACTUAL_MIDI_MSG = { [0] = 0xB0, [1] = 0x6B, [2] = 0x7F },

    PAD_REC_MIDI_MSG = { [0] = 0x99, [1] = 0x2A, [2] = MIDI_Wildcard },
    PAD_REC_ACTUAL_MIDI_MSG = { [0] = 0xB0, [1] = 0x6C, [2] = 0x7F },

    -- I don't get how TAP actually works, for me it's entering some random tempo values
    -- on pad event, but lets use it the way it is used with shift button pressed
    PAD_TAP_MIDI_MSG = { [0] = 0x99, [1] = 0x2B, [2] = MIDI_Wildcard },
    PAD_TAP_ACTUAL_MIDI_MSG = { [0] = 0xB0, [1] = 0x6D, [2] = MIDI_Wildcard },

    ENCODER_HW_ID = { 0x56, 0x57, 0x59, 0x5A, 0x6E, 0x6F, 0x74, 0x75 },
    FADER_HW_ID = { 0x0E, 0x0F, 0x1E, 0x1F },
    -- TODO: check values
    TRANSPORT_HW_ID = { 105, 106, 107, 108, 109 },


    pad = {},
    page = {
        DEFAULT = 1,
        TWO_LINES = 2,
        ENCODER = 3,
        FADER = 4,
        SCROLL = 5,
        PICTO = 10,
    },

    display = {},
    table = {},
    string = {},
}

arturia.pad = {
    ARP = 1,
    BANK = 2,
    PROG = 3,
    LOOP = 4,
    STOP = 5,
    PLAY = 6,
    REC = 7,
    TAP = 8,

    RED_ON = { 0x7f, 0x00, 0x00 },
    RED_OFF = { 0x2a, 0x00, 0x00 },
    GREEN_ON = { 0x00, 0x7f, 0x00 },
    GREEN_OFF = { 0x00, 0x2a, 0x00 },
    BLUE_ON = { 0x00, 0x00, 0x7f },
    BLUE_OFF = { 0x00, 0x00, 0x2a },
    ORANGE_ON = { 0x7f, 0x20, 0x00 },
    ORANGE_OFF = { 0x2a, 0x08, 0x00 },
    WHITE_ON = { 0x7f, 0x7f, 0x7f },
    WHITE_OFF = { 0x2a, 0x2a, 0x2a },
    YELLOW_ON = { 0x7f, 0x68, 0x00 },
    YELLOW_OFF = { 0x2a, 0x18, 0x00 },
    CYAN_OFF = { 0x00, 0x2a, 0x2a },
    CYAN_ON = { 0x00, 0x7f, 0x7f },
    PURPLE_OFF = { 0x2a, 0x00, 0x2a },
    PURPLE_ON = { 0x7f, 0x00, 0x7f },
}

arturia.pad.ADDR = {
    0x34, 0x35, 0x36, 0x37,
    0x38, 0x39, 0x3A, 0x3B,
    0x3C, 0x3D, 0x3E, 0x3F,
    0x40, 0x41, 0x42, 0x43,
}

arturia.pad.COLORS_ON = {
    arturia.pad.CYAN_ON,   -- Arp
    arturia.pad.PURPLE_ON, -- Pad
    arturia.pad.WHITE_ON,  -- Prog
    arturia.pad.ORANGE_ON, -- Loop
    arturia.pad.BLUE_ON,   -- Stop
    arturia.pad.GREEN_ON,  -- Play
    arturia.pad.RED_ON,    -- Record
    arturia.pad.YELLOW_ON, -- Tap
}

arturia.pad.COLORS_OFF = {
    arturia.pad.CYAN_OFF,   -- Arp
    arturia.pad.PURPLE_OFF, -- Pad
    arturia.pad.WHITE_OFF,  -- Prog
    arturia.pad.ORANGE_OFF, -- Loop
    arturia.pad.BLUE_OFF,   -- Stop
    arturia.pad.GREEN_OFF,  -- Play
    arturia.pad.RED_OFF,    -- Record
    arturia.pad.YELLOW_OFF, -- Tap
}

-- default colors
arturia.pad.colors = {
    arturia.pad.COLORS_OFF[1], -- Arp
    arturia.pad.COLORS_OFF[2], -- Pad
    arturia.pad.COLORS_OFF[3], -- Prog
    arturia.pad.COLORS_OFF[4], -- Loop
    arturia.pad.COLORS_OFF[5], -- Stop
    arturia.pad.COLORS_OFF[6], -- Play
    arturia.pad.COLORS_OFF[7], -- Record
    arturia.pad.COLORS_OFF[8], -- Tap
}

arturia.display = {
    page = 1,
    line1 = ' ',
    line2 = ' ',

    trackInfo = '',
    instr = '',

    -- a value for a fader or knob (set in midi_in callback)
    -- assuming it is used for pictography of a fader or a knob
    paramValue = ''
}

arturia.state = {
    -- for stop, play, record
    playing = nil,
    recording = nil,
    stopped = nil,

    -- for display
    midiInEventType = nil,

    -- for pads, keeping the last beat value, so message is sent only when beat has changed
    -- also used for bar calculations
    prevBeatValue = -1,
}

TABLE_EMPTY = {}

MIDI_MESSAGE_EMPTY = { midi = TABLE_EMPTY, outport = arturia.MIDI_PORT_IN }

--=============================================================================

kControlIDEncoder1 = 1
kControlIDEncoder2 = 2
kControlIDEncoder3 = 3
kControlIDEncoder4 = 4
kControlIDEncoder5 = 5
kControlIDEncoder6 = 6
kControlIDEncoder7 = 7
kControlIDEncoder8 = 8
kControlIDFader1 = 9
kControlIDFader2 = 10
kControlIDFader3 = 11
kControlIDFader4 = 12
kControlIDLoop = 13
kControlIDStop = 14
kControlIDPlay = 15
kControlIDRecord = 16
kControlIDTrackInfo = 70
kControlIDInst = 71
kControlIDArm = 73
kControlIDPlayhead = 74

kControlIDEncoders = {
    kControlIDEncoder1, kControlIDEncoder2, kControlIDEncoder3, kControlIDEncoder4, kControlIDEncoder5,
    kControlIDEncoder6, kControlIDEncoder7, kControlIDEncoder8
}

kControlIDFaders = {
    kControlIDFader1,
    kControlIDFader2,
    kControlIDFader3,
    kControlIDFader4
}

controls = {
    { name = 'Keyboard',                    label = 'MINILAB', objectType = 'Keyboard',      midiType = 'Keyboard',               startKey = 48,                   numberKeys = 25,                midi = { 0x90, MIDI_Wildcard, MIDI_Wildcard } },

    { name = 'encoder1',                    controlID = 1,     objectType = 'Knob',          midi = { 0xB0, 0x56, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder2',                    controlID = 2,     objectType = 'Knob',          midi = { 0xB0, 0x57, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder3',                    controlID = 3,     objectType = 'Knob',          midi = { 0xB0, 0x59, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder4',                    controlID = 4,     objectType = 'Knob',          midi = { 0xB0, 0x5A, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder5',                    controlID = 5,     objectType = 'Knob',          midi = { 0xB0, 0x6E, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder6',                    controlID = 6,     objectType = 'Knob',          midi = { 0xB0, 0x6F, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder7',                    controlID = 7,     objectType = 'Knob',          midi = { 0xB0, 0x74, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'encoder8',                    controlID = 8,     objectType = 'Knob',          midi = { 0xB0, 0x75, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },

    { name = 'fader1',                      controlID = 9,     objectType = 'VFader',        midi = { 0xB0, 0x0E, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'fader2',                      controlID = 10,    objectType = 'VFader',        midi = { 0xB0, 0x0F, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'fader3',                      controlID = 11,    objectType = 'VFader',        midi = { 0xB0, 0x1E, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'fader4',                      controlID = 12,    objectType = 'VFader',        midi = { 0xB0, 0x1F, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },

    { name = 'LOOP',                        controlID = 13,    objectType = 'Button',        midi = { 0xB0, 0x69, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'STOP',                        controlID = 14,    objectType = 'Button',        midi = { 0xB0, 0x6A, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'PLAY',                        controlID = 15,    objectType = 'Button',        midi = { 0xB0, 0x6B, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'RECORD',                      controlID = 16,    objectType = 'Button',        midi = { 0xB0, 0x6C, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'TAP',                         controlID = 17,    objectType = 'Button',        midi = { 0xB0, 0x6D, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'REWIND',                      controlID = 18,    objectType = 'Button',        midi = { 0xB0, 0x1D, 0x3E },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'REWIND2',                     controlID = 19,    objectType = 'Button',        midi = { 0xB0, 0x1D, 0x3D },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'FASTFORWARD',                 controlID = 20,    objectType = 'Button',        midi = { 0xB0, 0x1D, 0x41 },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'FASTFORWARD2',                controlID = 21,    objectType = 'Button',        midi = { 0xB0, 0x1D, 0x42 },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },

    { name = 'trackp',                      controlID = 22,    objectType = 'Button',        midi = { 0xB0, 0x1C, 0x41 },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'trackp2',                     controlID = 23,    objectType = 'Button',        midi = { 0xB0, 0x1C, 0x42 },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'trackm',                      controlID = 24,    objectType = 'Button',        midi = { 0xB0, 0x1C, 0x3E },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'trackm2',                     controlID = 25,    objectType = 'Button',        midi = { 0xB0, 0x1C, 0x3D },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Main Encoder Click',          controlID = 26,    objectType = 'Button',        midi = { 0xB0, 0x76, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Shift Encoder Click PRESS',   controlID = 27,    objectType = 'Button',        midi = { 0xB0, 0x77, 0x7F },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Shift Encoder Click RELEASE', controlID = 28,    objectType = 'Button',        midi = { 0xB0, 0x77, 0x00 },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },

    { name = 'Pitch Bend',                  controlID = 29,    objectType = 'Wheel',         midi = { 0xE0, MIDI_MSB, MIDI_LSB }, fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Modulation',                  controlID = 30,    objectType = 'Wheel',         midi = { 0xB0, 0x01, MIDI_LSB },     fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Sustain Pedal',               controlID = 32,    objectType = 'Sustain Pedal', midiType = 'Momentary',              midi = { 0xB0, 0x40, MIDI_LSB }, inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },

    { name = 'Pad 1',                       controlID = 33,    objectType = 'Drumpad',       midi = { 0x99, 0x24, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 2',                       controlID = 34,    objectType = 'Drumpad',       midi = { 0x99, 0x25, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 3',                       controlID = 35,    objectType = 'Drumpad',       midi = { 0x99, 0x26, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 4',                       controlID = 36,    objectType = 'Drumpad',       midi = { 0x99, 0x27, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 5',                       controlID = 37,    objectType = 'Drumpad',       midi = { 0x99, 0x28, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 6',                       controlID = 38,    objectType = 'Drumpad',       midi = { 0x99, 0x29, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 7',                       controlID = 39,    objectType = 'Drumpad',       midi = { 0x99, 0x2A, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 8',                       controlID = 40,    objectType = 'Drumpad',       midi = { 0x99, 0x2B, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 9',                       controlID = 41,    objectType = 'Drumpad',       midi = { 0x99, 0x2C, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 10',                      controlID = 42,    objectType = 'Drumpad',       midi = { 0x99, 0x2D, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 11',                      controlID = 43,    objectType = 'Drumpad',       midi = { 0x99, 0x2E, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 12',                      controlID = 44,    objectType = 'Drumpad',       midi = { 0x99, 0x2F, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 13',                      controlID = 45,    objectType = 'Drumpad',       midi = { 0x99, 0x30, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 14',                      controlID = 46,    objectType = 'Drumpad',       midi = { 0x99, 0x31, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 15',                      controlID = 47,    objectType = 'Drumpad',       midi = { 0x99, 0x32, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },
    { name = 'Pad 16',                      controlID = 48,    objectType = 'Drumpad',       midi = { 0x99, 0x33, MIDI_LSB },     inport = arturia.MIDI_PORT_IN,   outport = arturia.MIDI_PORT_OUT },

    { name = 'Track Info',                  controlID = 70,    fbType = FB_TEXTONLY,         inport = arturia.MIDI_PORT_IN,       outport = arturia.MIDI_PORT_OUT },
    { name = 'Instrument',                  controlID = 71,    fbType = FB_TEXTONLY,         inport = arturia.MIDI_PORT_IN,       outport = arturia.MIDI_PORT_OUT },
    { name = 'Tempo',                       controlID = 72,    fbType = FB_TEXTONLY,         inport = arturia.MIDI_PORT_IN,       outport = arturia.MIDI_PORT_OUT },
    { name = 'Arm',                         controlID = 73,    fbType = FB_TEXTONLY,         inport = arturia.MIDI_PORT_IN,       outport = arturia.MIDI_PORT_OUT },


    { name = 'Playhead',                    controlID = 74,    fbType = FB_TEXTONLY,         midi = { 0xB0, 0x6F, MIDI_LSB },     valueMode = kAssignScaled,       inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Shift Button Press',          controlID = 75,    objectType = 'Button',        midi = { 0xB0, 0x1B, 0x7F },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },
    { name = 'Shift Button Release',        controlID = 76,    objectType = 'Button',        midi = { 0xB0, 0x1B, 0x00 },         fbType = FB_TEXTONLY,            inport = arturia.MIDI_PORT_IN,  outport = arturia.MIDI_PORT_OUT },

}

--=============================================================================

function controller_info()
    return {
        model = 'Minilab 3',
        manufacturer = 'Arturia',
        preset_name = 'MIDI Preset 1',

        device_request = arturia.SYSEX_MESSAGE_DEVICE_REQUEST,
        device_reply = arturia.SYSEX_MESSAGE_DEVICE_RESPONSE,

        version = arturia.CONFIG_VERSION,
        items = controls,

        assignments = { --------------------------------------------------------------
            { zone = 'MiniLab 3' },

            { control = 'encoder1',                    trackParam = CS_INSTRUMENTPAR1 },
            { control = 'encoder2',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 1 },
            { control = 'encoder3',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 2 },
            { control = 'encoder4',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 3 },
            { control = 'encoder5',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 4 },
            { control = 'encoder6',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 5 },
            { control = 'encoder7',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 6 },
            { control = 'encoder8',                    trackParam = CS_INSTRUMENTPAR1, paramOffset = 7 },

            { control = 'fader1',                      trackParam = AUVOLUME,          paramName = '@tp' },
            { control = 'fader2',                      trackParam = AUSEND1,           paramOffset = 0,            paramName = '@tp' },
            { control = 'fader3',                      trackParam = AUSEND1,           paramOffset = 1,            paramName = '@tp' },
            { control = 'fader4',                      trackParam = AUPAN,             paramName = '@tp' },


            { control = 'LOOP',                        keyCmd = 15 },  -- Cycle Mode
            { control = 'RECORD',                      keyCmd = 7 },   -- Record
            { control = 'PLAY',                        keyCmd = 3 },   -- Play
            { control = 'STOP',                        keyCmd = 5 },   -- Stop
            { control = 'TAP',                         keyCmd = 532 }, -- Tap
            { control = 'REWIND',                      keyCmd = 10 },  -- REWIND
            { control = 'FASTFORWARD',                 keyCmd = 11 },  -- FASTFORWARD
            { control = 'REWIND2',                     keyCmd = 10 },  -- REWIND
            { control = 'FASTFORWARD2',                keyCmd = 11 },  -- FASTFORWARD

            { control = 'trackm',                      keyCmd = 1272 },
            { control = 'trackm2',                     keyCmd = 1272 },
            { control = 'trackp',                      keyCmd = 1273 },
            { control = 'trackp2',                     keyCmd = 1273 },
            { control = 'Main Encoder Click',          keyCmd = 2397 },
            { control = 'Shift Encoder Click PRESS',   keyCmd = 749 },
            { control = 'Shift Encoder Click RELEASE', keyCmd = 2315 },

            { control = 'Track Info',                  CSTrack = true,                 trackParam = CS_NAME,       paramName = '@tp', shortParamName = "@tn" },
            { control = 'Instrument',                  instr = 0,                      trackParam = CS_INSTRUMENT, paramName = '@tp', shortParamName = '@tn' },
            { control = 'Arm',                         trackParam = CS_RECRDY },

            { control = 'Playhead',                    globalObj = AGL_BEATS,          clockPart = ACP_BAR,        paramName = '@tp', shortParamName = '@tn' },
        },
    }
end

function controller_initialize(applicationName, deviceNewlyDetected)
    return arturia.midi_message(
        arturia.sysex_message(arturia.SYSEX_DATA_CONNECT), -- will select Bank A automatically
        arturia.display.sysex_message(10, 'Minilab 3', 'by Arturia'),
        arturia.pad.sysex_message_default_colors()
    )
end

function controller_finalize()
    return arturia.midi_message(arturia.sysex_message(arturia.SYSEX_DATA_DISCONNECT))
end

function controller_midi_out(midiEvent, portName, valueString, _a_color)
    return nil
end

-- from midi controller to Logic Pro
function controller_midi_in(midiEvent, portName)
    arturia.display.paramValue = midiEvent[2]

    -- apparenty CSFeedbackText should only react on events if they first appeared here
    -- I assume, we only want to listen for user triggered events, not of state updates (when switching track)
    if arturia.table.contains(arturia.ENCODER_HW_ID, midiEvent[1]) then
        arturia.display.page = arturia.page.ENCODER
        arturia.display.line2 = ''
        arturia.state.midiInEventType = arturia.ENCODER_HW_ID
    elseif arturia.table.contains(arturia.FADER_HW_ID, midiEvent[1]) then
        arturia.display.page = arturia.page.FADER
        arturia.display.line2 = ''
        arturia.state.midiInEventType = arturia.FADER_HW_ID
    elseif arturia.table.contains(arturia.TRANSPORT_HW_ID, midiEvent[1]) then
        arturia.display.page = arturia.page.PICTO
        arturia.display.line2 = ''
        arturia.state.midiInEventType = arturia.TRANSPORT_HW_ID
    else
        arturia.display.page = arturia.page.TWO_LINES
        arturia.display.line2 = ''
        arturia.state.midiInEventType = nil
    end

    -- ignore button press, handle release (when last byte is 0x00)
    if midiEvent[2] == 0x00 then
        return nil
    end

    if arturia.table.midi_equals(arturia.PAD_LOOP_MIDI_MSG, midiEvent) then
        return arturia.midi_message(arturia.PAD_LOOP_ACTUAL_MIDI_MSG)
    elseif arturia.table.midi_equals(arturia.PAD_STOP_MIDI_MSG, midiEvent) then
        return arturia.midi_message(arturia.PAD_STOP_ACTUAL_MIDI_MSG)
    elseif arturia.table.midi_equals(arturia.PAD_PLAY_MIDI_MSG, midiEvent) then
        return arturia.midi_message(arturia.PAD_PLAY_ACTUAL_MIDI_MSG)
    elseif arturia.table.midi_equals(arturia.PAD_REC_MIDI_MSG, midiEvent) then
        return arturia.midi_message(arturia.PAD_REC_ACTUAL_MIDI_MSG)
    elseif arturia.table.midi_equals(arturia.PAD_TAP_MIDI_MSG, midiEvent) then
        return arturia.midi_message(arturia.PAD_TAP_ACTUAL_MIDI_MSG)
    end

    return nil
end

function controller_timer_trigger()
    return arturia.midi_message(arturia.display.sysex_message(arturia.page.PICTO, arturia.display.trackInfo,
        arturia.display.instr))
end

--=============================================================================

function CSFeedback(controlID, currentValue, minValue, maxValue, nSubSequentControls, centerValue, assignment)
    -- assuming it is required to refresh screen after encoders/faders event
    settriggertimer(1000)

    local messages = {}
    local oldValue = nil

    if controlID == kControlIDLoop then
        local message = arturia.pad.sysex_message(arturia.pad.LOOP, currentValue == 1)
        table.insert(messages, message)
    elseif controlID == kControlIDStop then
        oldValue = arturia.state.stopped
        arturia.state.stopped = (currentValue == 1)
        local message = nil
        if not oldValue or oldValue ~= arturia.state.stopped then
            -- flip stopped flag for on/off
            message = arturia.pad.sysex_message(arturia.pad.STOP, not arturia.state.stopped)
            table.insert(messages, message)
        end
        -- reset beat and bar values
        arturia.state.prevBeatValue = -1

        message = arturia.pad.sysex_message(arturia.pad.TAP, false)
        table.insert(messages, message)

        message = arturia.pad.sysex_message(arturia.pad.TAP, false)
        table.insert(messages, message)
    elseif controlID == kControlIDPlay then
        oldValue = arturia.state.playing
        arturia.state.playing = (currentValue == 1)
        if not oldValue or oldValue ~= arturia.state.playing then
            local message = arturia.pad.sysex_message(arturia.pad.PLAY, arturia.state.playing)
            table.insert(messages, message)
        end
    elseif controlID == kControlIDArm then
        local message = arturia.pad.sysex_message(arturia.pad.REC, currentValue == 1)
        table.insert(messages, message)
    end

    local midi_message = arturia.midi_message(table.unpack(messages))
    -- what does 'ret' mean?
    -- but apparently Track Info and Instr start providing proper values (instead of single letter or -1 pText)
    -- when ret is provided
    midi_message.ret = 16
    return midi_message
end

function CSFeedbackText(controlID, pText, textLength, something)
    if not pText then
        return MIDI_MESSAGE_EMPTY
    end

    local messages = {}

    if controlID == kControlIDPlayhead and arturia.state.playing then
        -- assuming beats is always even it could be done % 2, but what if not
        local playhead = arturia.string.split(pText)
        local beat = tonumber(playhead[2])
        local division = tonumber(playhead[3])

        -- pad is on for 1st beat and odd, off 2nd and even
        local beatState = (beat % 2 ~= 0)

        local message = arturia.pad.sysex_message(arturia.pad.STOP, (division % 2 ~= 0))
        table.insert(messages, message)

        -- send message only when beat has changed
        if arturia.state.prevBeatValue ~= beat then
            message = arturia.pad.sysex_message(arturia.pad.PLAY, beatState)
            table.insert(messages, message)

            -- turn on bar for 1st beat, - off bar for 2nd+ beat
            -- send message only when pad state needs to be switched
            local firstBeat = (beat == 1)
            if firstBeat or (beat == 2) then
                message = arturia.pad.sysex_message(arturia.pad.TAP, firstBeat)
                table.insert(messages, message)
            end
        end
        arturia.state.prevBeatValue = beat
    elseif controlID == kControlIDRecord then
        oldValue = arturia.state.recording
        arturia.state.recording = (pText == 'On')
        if not oldValue or oldValue ~= arturia.state.recording then
            message = arturia.pad.sysex_message(arturia.pad.REC, arturia.state.recording)
            table.insert(messages, message)
        end
    elseif controlID == kControlIDTrackInfo then
        arturia.display.trackInfo = pText
        local message = arturia.display.sysex_message(arturia.page.PICTO, arturia.display.trackInfo,
            arturia.display.line2)
        table.insert(messages, message)
    elseif controlID == kControlIDInst then
        arturia.display.instr = pText
        local message = arturia.display.sysex_message(arturia.page.PICTO, arturia.display.line1, arturia.display.instr)
        table.insert(messages, message)
    elseif arturia.state.midiInEventType == arturia.ENCODER_HW_ID and
        arturia.table.contains(kControlIDEncoders, controlID) then
        arturia.display.line2 = pText
        local message = arturia.display.sysex_message(arturia.page.ENCODER, arturia.display.line1, arturia.display.line2)
        table.insert(messages, message)
    elseif arturia.state.midiInEventType == arturia.FADER_HW_ID and
        arturia.table.contains(kControlIDFaders, controlID) then
        arturia.display.line2 = pText
        local message = arturia.display.sysex_message(arturia.page.FADER, arturia.display.line1, arturia.display.line2)
        table.insert(messages, message)
    end

    return arturia.midi_message(table.unpack(messages))
end

function CSLongFeedbackText(controlID, pText, textLength)
    if not pText then
        return MIDI_MESSAGE_EMPTY
    end

    if arturia.state.midiInEventType == arturia.ENCODER_HW_ID and
        arturia.table.contains(kControlIDEncoders, controlID) then
        arturia.display.line2 = pText
        message = arturia.display.sysex_message(arturia.page.ENCODER, arturia.display.line1, arturia.display.line2)
    elseif arturia.state.midiInEventType == arturia.FADER_HW_ID and
        arturia.table.contains(kControlIDFaders, controlID) then
        arturia.display.line2 = pText
        message = arturia.display.sysex_message(arturia.page.FADER, arturia.display.line1, arturia.display.line2)
    end

    return arturia.midi_message(message)
end


function CSLabel(controlID, pText, textLength1, textLength2)
    arturia.display.line1 = pText
    return nil
end

function CSLongLabel(controlID, pText, textLength)
    arturia.display.line1 = pText
    return nil
end


--=============================================================================

function arturia.pad.sysex_message(pad, on)

    local pad_color = on and arturia.pad.COLORS_ON[pad] or arturia.pad.COLORS_OFF[pad]
    return arturia.table.concat(arturia.SYSEX_MESSAGE_PREFIX, arturia.pad.color(pad, pad_color),
        arturia.SYSEX_MESSAGE_SUFFIX)
end

function arturia.pad.color(index, rgb)
    arturia.pad.colors[index] = rgb
    return arturia.table.concat(arturia.SYSEX_DATA_PAD_PREFIX, { arturia.pad.ADDR[index] }, rgb)
end

function arturia.pad.sysex_message_default_colors()

    local messages = {}
    for i = 1, #arturia.pad.colors do
        message = arturia.table.concat(arturia.SYSEX_MESSAGE_PREFIX, arturia.pad.color(i, arturia.pad.colors[i]),
            arturia.SYSEX_MESSAGE_SUFFIX)
        table.insert(messages, message)
    end
    return table.unpack(messages)
end

--=============================================================================

function arturia.display.sysex_message(page, line1, line2)
    page = page or arturia.display.page
    line1 = line1 or arturia.display.line1
    line2 = line2 or arturia.display.line2

    local data_control = {}

    if page == arturia.page.DEFAULT then
        -- do nothing
    elseif page == arturia.page.TWO_LINES then
        data_control = { 0x1F, 0x02, 0x01 }
    elseif page == arturia.page.ENCODER then
        data_control = { 0x1F, 0x03, 0x01, arturia.display.paramValue }
    elseif page == arturia.page.FADER then
        data_control = { 0x1F, 0x04, 0x01, arturia.display.paramValue }
    elseif page == arturia.page.SCROLL then
        data_control = { 0x1F, 0x05, 0x01, 0x00 }
    elseif page == arturia.page.PICTO then
        data_control = { 0x1F, 0x07, 0x01 }
        table.insert(data_control, arturia.state.recording and 0x03 or 0x00)
        table.insert(data_control, arturia.state.playing and 0x02 or 0x00)
        table.insert(data_control, 0x01)
    end

    arturia.display.page = page
    arturia.display.line1 = line1
    arturia.display.line1 = line2

    return arturia.sysex_message(
        arturia.table.concat(
            { 0x04, 0x02, 0x60 },
            data_control,
            { 0x00, 0x00, 0x01 },
            arturia.display.bytes(line1, 31),
            { 0x00, 0x02 },
            arturia.display.bytes(line2, 31),
            { 0x00 }
        )
    )
end

function arturia.display.bytes(str, maxLen)
    if maxLen and maxLen > 0 then
        str = string.sub(str, 1, maxLen)
    end

    local bytes = {}
    for i = 1, #str do
        bytes[i] = string.byte(str, i)
    end

    return bytes
end

--=============================================================================

function arturia.midi_message(...)
    local msg = {}
    for i, v in ipairs({ ... }) do
        table.insert(msg, v)
    end

    return { midi = msg, outport = arturia.MIDI_PORT_IN }
end

function arturia.sysex_message(data)
    return arturia.table.concat(arturia.SYSEX_MESSAGE_PREFIX, data, arturia.SYSEX_MESSAGE_SUFFIX)
end

--=============================================================================

function arturia.table.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function arturia.table.concat(...)
    local result = {}
    for _, v1 in ipairs({ ... }) do
        for _, v2 in ipairs(v1) do
            table.insert(result, v2)
        end
    end
    return result
end

function arturia.table.midi_equals(arr1, arr2)
    if type(arr1) ~= "table" or type(arr2) ~= "table" then
        return false
    end

    if #arr1 ~= #arr2 then
        return false
    end

    for i = 0, #arr1 - 1 do
        if (arr1[i] ~= MIDI_Wildcard and arr2[i] ~= MIDI_Wildcard) and (arr1[i] ~= arr2[i]) then
            return false
        end
    end
    return true
end

--=============================================================================

function arturia.string.split(str)
    local result = {}
    for word in str:gmatch("%S+") do
        table.insert(result, word)
    end
    return result
end

--=============================================================================
