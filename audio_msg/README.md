English| [简体中文](./README_cn.md)

# audio_msg

Custom audio frame audio msg, including audio frame index, timestamp, audio frame type, audio frame data and other results. This data structure is used for Horizen voice algorithm to process audio frames and publish intelligent voice results.



The details of the message are as follows:

## AudioFrame.msg

The message definition of audio frame data, including:

1. uint32 index

Audio frame number.

2. builtin_interfaces/Time pts

Timestamp information of audio frame.

3. AudioFrameType frame_type

Information of audio frame type, including normal audio frame data type, intelligent audio frame data type. For detailed definitions, please refer to AudioFrameType.msg.

4. SmartAudioData smart_audio

Information of intelligent audio frame data




## AudioFrameType.msg

Information about audio frame types. Frame type is defined as uint8 type, which includes the following:

1. FRAME_TYPE_UNKNOW

Unknown frame type.

2. FRAME_TYPE_AUDIO

Normal audio frame data.

3. FRAME_TYPE_SMART_AUDIO

Intelligent audio frame data## SmartAudioData.msg

1. SmartAudioFrameType frame_type

Intelligent audio frame data type, including denoised audio data type, audio events, command words, wakeup audio data, and sound source localization Direction of Arrival (Doa) angle information. For detailed definitions, refer to SmartAudioFrameType.msg.

2. AudioEventType event_type

Audio event type, including normal wakeup event, one-shot wakeup event, ASR detection timeout event, VAD start event, VAD middle event, VAD end event. For detailed definitions, refer to AudioEventType.msg. This field is valid when the frame type is SMART_AUDIO_TYPE_EVENT in SmartAudioFrameType.

3. string cmd_word

Command word information of intelligent audio frame, including wakeup word. This field is valid when the frame type is SMART_AUDIO_TYPE_CMD_WORD in SmartAudioFrameType.

4. uint8[] data

Frame data of intelligent audio frame. This field is valid when the frame type is SMART_AUDIO_TYPE_VOIP (denoised audio frame) or SMART_AUDIO_TYPE_WAKEUP_DATA (wakeup audio frame) in SmartAudioFrameType. The data contains audio content, and for other types, this field is empty.

5. float32 doa_theta

Direction of Arrival (Doa) angle information in intelligent audio frame. The unit is in degrees with a value range of 0 to 180 degrees. This field is valid when the frame type is SMART_AUDIO_TYPE_DOA in SmartAudioFrameType.

## SmartAudioFrameType.msg

Type information of intelligent audio frame, including the following frame types:

1. SMART_AUDIO_TYPE_VOIP

Denoised audio frame data type

2. SMART_AUDIO_TYPE_EVENT

Audio event frame type

3. SMART_AUDIO_TYPE_CMD_WORD

Command word audio frame type

4. SMART_AUDIO_TYPE_WAKEUP_DATA

Wakeup word audio frame type

5. SMART_AUDIO_TYPE_DOA

Sound source localization Doa angle audio frame type, including information about the Doa angle of the sound source. Supported Doa angles range from 0 to 180 degrees.## AudioEventType.msg

6. SMART_AUDIO_TYPE_ASR_DATA

Denoised and crop with vad audio frame data type


Audio event type information. The event type is defined as uint8 type, including the following types:

1. EVENT_WKPNORMAL

   Normal wakeup event.

2. EVENT_WKPONESHOT

   One-shot wakeup event.

3. EVENT_WAITASRTIMEOUT

   ASR detection timeout event.

4. EVENT_VADBEGIN

   VAD start time.

5. EVENT_VADMID

   VAD middle event.

6. EVENT_VADEND

   VAD end event.