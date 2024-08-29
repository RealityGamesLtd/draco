cd models

for f in *\ *; do mv "$f" "${f// /_}"; done

find . -name '*.obj' -exec bash -c '
    echo "../build/draco_encoder -i $1 -o $1.drc -cl 6"
    ../build/draco_encoder -i "$1" -o "$1.drc" -cl 6
' -- {} \;

find . -name "*.obj" -type f -delete
find . -name "*.blend" -type f -delete
