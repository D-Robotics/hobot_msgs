English| [简体中文](./README_cn.md)

# ai_msgs

Custom ai msg, including detection boxes roi for people/objects/vehicles, tracking track id, capture, features, gesture recognition, and other results. Used to publish inference results after algorithm model reasoning.

Detailed description of the message is as follows:

## PerceptionTargets.msg

Message definition for perception results, generally one perception result message corresponds to one frame of the image. The message includes:

1. std_msgs/Header header

Message header, including stamp and frame_id, consistent with the image header used for model reasoning, to indicate the image corresponding to this message.

2. int16 fps

Output frame rate of perception results, i.e. the frame rate at which the algorithm model reasoning is processed, negative value if invalid.

When the fps is lower than the output frame rate of the sensor's image, it indicates that the algorithm model reasoning takes longer, and optimization of the reasoning process is needed.

3. Perf[] perfs

Performance statistics information, such as recording the time consumed by each model reasoning.

When there are multiple models, performance information of each model can be recorded to identify the performance bottleneck in the model reasoning process. Also, when an inference exception occurs leading to no AI message output, the model name in the performance statistics information can be used to determine which model did not output, achieving a quick narrowing down of the search range.

4. Target[] targets

Perception target collection.

5. Target[] disappeared_targets

Disappeared target collection.

## CaptureTargets.msg

Message definition for capture results. The message includes:

1. std_msgs/Header header

Message header, including stamp and frame_id, consistent with the image header used for model reasoning, to indicate the image corresponding to this message.

2. Perf.msg

Performance statistics information, such as recording the time consumed by each model reasoning.

4. Target[] targets

Capture target collection.## Perf.msg

Performance statistics.

1. string type

Type used to represent processing module. For example, when type is the model name, it indicates the performance statistics of inference on this model.

2. builtin_interfaces/Time stamp_start

Timestamp when processing started.

3. builtin_interfaces/Time stamp_end

Timestamp when processing completed.

## Target.msg

Target message.

1. string type

Name of target type, such as: person, car, animal, object, with specific values defined as person/car/object/animal.

2. uint64 track_id

Target tracking ID.

3. Roi[] rois

Detection boxes of the target. A target may contain multiple detection boxes, such as body, head, and face detection boxes simultaneously.

4. Attribute[] attributes

Attributes. A target may contain multiple attribute information, such as age, gender, and gesture results simultaneously.

5. Point[] points

Key points. A target may contain multiple key point information, such as facial key points, body skeleton points, and hand key points simultaneously.

6. Capture[] captures

Capture image information of the tracked target, including captured images, features, and information on the results of feature indexing in the database.

## Roi.msg

Roi perception message, such as: body detection box, head detection box, face detection box, hand detection box.

1. string type- **roi type, such as body/head/face/hand.**

2. `sensor_msgs/RegionOfInterest rect`

   Detection frame.

3. `float32 score`

   Confidence score of the detection result.

## Attribute.msg

Attribute perception message, such as: age, gender, gesture, glasses, mask, liveness information, vehicle type, vehicle color, vehicle speed, vehicle lane information.

1. `string type`

   Attribute type, such as age: age, gender: gender, gesture: gesture.

2. `float32 value`

   Attribute value.

   Example definitions of age value:

   - val represents the actual age value

   Example definitions of gender value:

   - "1": "Male", "-1": "Female"

   Example definitions of gesture value:

   - 0: Background, // No gesture

   - 1: FingerHeart,  // Finger heart

   - 2: ThumbUp,  // Thumbs up

   - 3: Victory, // V sign

   - 4: Mute, // Shh

   - 10: Palm, // Palm

   - 11: Okay, // OK gesture

   - 12: ThumbRight, // Thumbs up to the right

   - 13: ThumbLeft, // Thumbs up to the left14: Awesome, // 666 hand gesture

3. float32 confidence

Confidence level of the attribute result.

## Point.msg

Perception result of key points, such as facial keypoints, skeletal points of the body, and keypoints of hands.

1. string type

Type, such as body_kps/face_kps/hand_kps.

2. geometry_msgs/Point32[] point

Numerical values of the keypoints.

3. float32[] confidence

Confidence level of each keypoint, with the same dimension as the keypoint numerical values.

## Capture.msg

Capture information.

1. std_msgs/Header header 

Timestamp and frame_id corresponding to the original video frame of the captured image.

2. sensor_msgs/Image img

Captured image.

3. float32[] features

Feature data corresponding to the captured image, with a length of 0 indicating no features.

4. DBResult db_result

Database retrieval result of the features. This result is valid only when features are present.

## DBResult.msg

Database retrieval result.

1. string db_type

Name of the database.2、string match_id

Matched target ID.

3、float32 distance

Feature matching distance.

4、float32 similarity

Feature matching similarity.