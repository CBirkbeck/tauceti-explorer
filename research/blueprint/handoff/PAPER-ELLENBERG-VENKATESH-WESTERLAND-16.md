# Handoff: PAPER-ELLENBERG-VENKATESH-WESTERLAND-16

Issue #1184. Codex — codex-a71f92. 2026-09-22. Partial extraction checkpoint;
no Lean implementation or compilation.

## Done

Read the entire published 58-page paper. Recorded publisher URL, exact PDF
hash and reading scope. Read RW06 §§4.1–4.5 and Achter–Pries introduction,
§§2.1–2.4 and §§3.1–3.3 with proofs. No claim to have read all their references.

Delivered 125 items (7 library, 6 planned, 112 missing), 222 DAG edges,
3 routes, 36 API outlines with 108 planned acceptance tests, and
14 unreviewed source findings. All missing items are routed exactly once.
The report contains a self-contained replacement for the Lemma8.4
aggregate inequality and complete finite-regression code (1154 assertions).

Current check_paper.py and custom structure/DAG/API/route checks pass.
Nothing is independently reviewed or formalized.

## Resume here

1. Read the originals behind Salvetti's cell model and §5.5 arc connectivity.
   Verify the precise arc variants, endpoint isotopies, simultaneous isotopy
   extension and relative pi2 input. Split any newly exposed prerequisites.
2. Resolve general balanced right/left graded tensor/Tor over noncommutative
   rings. Do not treat commutative ModuleCat tensor or abstract
   CategoryTheory.Tor as an already complete EVW implementation. Find the
   correct existing supplier before designing new generic machinery.
3. Read SGA1 XII/XIII, SGA7II XIII2.1.8.9/2.1.11 and Knudsen's genus-zero
   compactification. Close RW06's deformation, field-of-moduli descent and
   good-reduction/valuative finiteness references.
4. Close item116: the full hyperelliptic-moduli monodromy theorem needs a
   comparison to the actual EVW family with infinity fixed and affine
   coordinates. Track labels, the involution gerbe and fundamental-group
   surjectivity. Then close the original integral symplectic lifting lemma,
   Jacobian/Kummer comparison and the CFT involution/degree dictionary.
5. Read the CL mass/moment and Haar-cokernel primary proofs. Independently
   verify the replacement enlargement formula/proof and every sourceIssue.
   Render the remaining minor disputed pages and compare author/arXiv
   versions before calling findings new.
6. Recheck all generic ownership and accepted restructures on fresh main.
   Retain the Part II specialized stability boundary, existing IG.3/IG.5
   moduli sources, and ST.0/ST.5 statistical consumer route.

Do not drop L>max(|G|,q,n) from Proposition7.8, assume Frobenius-equivariant
stabilization, claim fixed-q density convergence, omit the sign quotient or
factor2, include nonabelian A, use whole class groups as ell-group-valued
random variables, or broaden characteristic hypotheses without new proofs.

## Validation

Run the current scripts/check_paper.py on the result. Recheck exact-once
routing, DAG, API/test coverage, galaxy IDs and baseline declaration names.
The report embeds the exact Python finite regression and its SHA-256.
The saved finite checks are regression evidence only, not Lean verification.

Opening the pull request ends this worker's claim. Do not manually merge,
close, relabel or mark the source findings confirmed.

