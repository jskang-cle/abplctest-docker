# AB PLC Emulator Docker Container

## 1. Create `tags.txt` file
Use provided [`tags_example.txt`](tags_example.txt) as a template. Add tags to the file, one per line.

### Tag format

```
CIP-based PLC tags are in the format: <name>:<type>[<sizes>] where:
<name> is alphanumeric, starting with an alpha character.
<type> is one of:
    SINT   - 1-byte signed integer.  Requires array size(s).
    INT    - 2-byte signed integer.  Requires array size(s).
    DINT   - 4-byte signed integer.  Requires array size(s).
    LINT   - 8-byte signed integer.  Requires array size(s).
    REAL   - 4-byte floating point number.  Requires array size(s).
    LREAL  - 8-byte floating point number.  Requires array size(s).
    STRING - 82-byte string.  Requires array size(s).
    BOOL   - 1-byte boolean value.  Requires array size(s).

<sizes> field is one or more (up to 3) numbers separated by commas.
```

### Example
```
BoolExample:BOOL[1, 1]
```

## 2. Run docker compose
```bash
docker-compose up
```
