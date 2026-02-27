# Robot Framework runner for Vector CANoe + CAPL TestType1_ReceivedFrame

This adds a Robot Framework suite that:
1. Connects to Vector CANoe
2. Initializes CAN channel
3. Creates/validates IUT node
4. Runs CAPL testcases **7.1.1** and **7.1.2**
5. Produces Robot report output and an execution marker file

## Files
- `tests/type1_received_frame.robot`
- `resources/vector_can_keywords.resource`
- `libraries/VectorCANoeLibrary.py`

## Run (mock mode, default)
```bash
robot -d robot/reports robot/tests/type1_received_frame.robot
```

## Run with real CANoe (Windows)
- Install `pywin32`
- Set `${MOCK_MODE}` to `${FALSE}` in the suite (or parameterize it)
- Replace `robot/config/Type1_Test.cfg` with actual CANoe config

Then run:
```bash
robot -d robot/reports -v MOCK_MODE:False robot/tests/type1_received_frame.robot
```
