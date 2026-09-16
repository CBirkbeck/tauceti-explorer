#!/usr/bin/env python3
"""Index the declarations of a Lean source tree (search aid for blueprint workers).

Usage: python3 index_declarations.py <baseline dir>
Reads <baseline>/TauCeti and <baseline>/mathlib/Mathlib and writes
<baseline>/declarations.tsv with columns: library, full name, kind, file, line,
signature start. Names are reconstructed from `namespace` blocks and are
approximate (sections, `open ... in`, and macros are not interpreted), so a
worker must confirm every hit in the source file before citing it.
"""
import re
import sys
from pathlib import Path

# Modifiers include `public` and `meta` from Lean's module system, which recent
# Mathlib files use (`public theorem ...`, `@[expose] public section`).
MODIFIERS = r"(?:(?:private|protected|public|noncomputable|partial|unsafe|nonrec|scoped|meta)\s+)*"
DECL = re.compile(r"^\s*(?:@\[[^\]]*\]\s*)*" + MODIFIERS +
                  r"(theorem|lemma|def|abbrev|structure|class|instance|inductive|opaque|axiom|irreducible_def|alias)\s+"
                  r"(?!\()([^\s:({\[⦃]+)")
NAMESPACE = re.compile(r"^\s*namespace\s+(\S+)")
SECTION = re.compile(r"^\s*(?:@\[[^\]]*\]\s*)*" + MODIFIERS + r"section(?:\s+(\S+))?\s*$")
END = re.compile(r"^\s*end(?:\s+(\S+))?\s*$")


def scan(root: Path, library: str, relative_to: Path, out):
    count = 0
    for path in sorted(root.rglob("*.lean")):
        stack = []  # entries: ("ns", name) or ("sec", name)
        in_comment = 0
        rel = path.relative_to(relative_to).as_posix()
        try:
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        except OSError:
            continue
        for number, line in enumerate(lines, 1):
            stripped = line
            if in_comment or "/-" in stripped:
                opens, closes = stripped.count("/-"), stripped.count("-/")
                before = in_comment
                in_comment = max(0, in_comment + opens - closes)
                if before or (opens and stripped.strip().startswith("/-")):
                    continue
            m = NAMESPACE.match(stripped)
            if m:
                # `namespace A.B` opens A then B; `end A.B` closes both.
                for part in m.group(1).split("."):
                    stack.append(("ns", part))
                continue
            m = SECTION.match(stripped)
            if m:
                stack.append(("sec", m.group(1) or ""))
                continue
            m = END.match(stripped)
            if m:
                name = m.group(1)
                if stack:
                    if name is None:
                        stack.pop()
                    else:
                        parts = name.split(".")
                        tail = [entry[1] for entry in stack[-len(parts):]]
                        if len(parts) <= len(stack) and tail == parts and all(entry[0] == "ns" for entry in stack[-len(parts):]):
                            del stack[-len(parts):]
                        elif stack[-1] == ("sec", name):
                            stack.pop()
                        else:
                            # Unmatched: close the innermost block, as before.
                            stack.pop()
                continue
            m = DECL.match(stripped)
            if not m:
                continue
            kind, name = m.group(1), m.group(2)
            if name.startswith("_root_."):
                full = name[len("_root_."):]
            else:
                prefix = ".".join(entry[1] for entry in stack if entry[0] == "ns")
                full = f"{prefix}.{name}" if prefix else name
            signature = stripped.strip()[:160].replace("\t", " ")
            out.write(f"{library}\t{full}\t{kind}\t{rel}\t{number}\t{signature}\n")
            count += 1
    return count


def main():
    base = Path(sys.argv[1])
    # Written beside the index and moved into place, so a worker reading it
    # never sees a half-written file.
    partial = base / "declarations.tsv.partial"
    with open(partial, "w", encoding="utf-8") as out:
        out.write("library\tname\tkind\tfile\tline\tsignature\n")
        t = scan(base / "TauCeti" / "TauCeti", "tauceti", base / "TauCeti", out)
        m = scan(base / "mathlib" / "Mathlib", "mathlib", base / "mathlib", out)
    partial.replace(base / "declarations.tsv")
    print(f"indexed tauceti {t}, mathlib {m}")


if __name__ == "__main__":
    main()
