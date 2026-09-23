# Handoff: PAPER-ELLENBERG-VENKATESH-WESTERLAND-16

Issue1184. Codex — codex-c83e7a. 2026-09-23. Continuation of PR1843.
Partial research checkpoint; no Lean file authored or compiled.

## Done in this continuation

Read all58 published EVW pages729–786. Read AP author PDF pp.1–15 and19–20;
Vasiu arXiv math/0209237v2 pp.1–5,9,16,23–28. Exact URLs/hashes and reading
limits are in the result/report. Rendered AP5,10,14 and Vasiu2.

Supplied item116's exact monic odd-degree polynomial-family comparison:
B_n={(a,b,d):d²=a^n}≃Ga⋊Gm is connected, [PConf_n/B_n] is the fully
labelled hyperelliptic stack, and the connected torsor surjects on pi1.
Deck involution is retained. AP labelled monodromy and Vasiu give full
integral image for n≥5 (also n=3,ell≥5), sufficient for EVW's eventual n.
The general curve and stack prerequisites remain imported, unformalised.

Found Vasiu's extra g=1,ell=3 hypothesis. The report exhibits an order24
subgroup of SL2(Z/9), ambient order648, reducing bijectively to SL2(F3).
Its inverse image shows full mod3 image alone does not force integral
surjectivity. The exceptional geometric theorem is not disproved.

Corrected predecessor item115/E7/report: the rare-event group must be
(C_ell)^n, not cyclic C_(ell^n). Added unreviewed supporting-source findings:
E15 integral lifting exception; E16 deck gerbe in AP Lemma2.3; E17 general
arithmetic/geometric quotient requires a kernel term. Do not treat these
as independently confirmed or claim novelty. E18–E19 additionally record
Vasiu§2.2’s single-dual-number Lie bracket and general-base freeness
statements; neither literal statement is used in the lifting application.

Current inventory:137 items (7 library,8 planned,122 missing),
243 dependency edges,3 routes,39 structured API outlines,117 planned tests,
19 unreviewed source findings. Existing36 APIs now have roles and uses.
All missing items route once. Current owners/audits and fresh inputs checked.

## Resume

1. Independently verify the quotient-stack comparison and its normality,
   smooth-curve and compact-type hypotheses; close generic IG.0/R09.4
   finite-etale stack and SF.3 double-cover/relative-line-bundle suppliers.
   If uniform all-genus monodromy is wanted, supply g=1,ell=3 separately.
2. Read original curve-moduli base-case monodromy and AP group-generation
   references; Vasiu's remaining root-system/representation prerequisites
   were not exhaustively read. Do not advertise recursive closure.
3. Continue the inherited Salvetti/arc-complex/isotopy-extension task,
   balanced noncommutative graded right/left tensor/Tor ownership, SGA1
   XII/XIII and SGA7II XIII2.1.8.9/2.1.11, Knudsen compactification and
   RW deformation/descent/good-reduction originals.
4. Close Jacobian/Kummer and CFT constants/degree/involution inputs;
   read original CL mass/moment and Haar-cokernel proofs. The report's
   enlargement proof is inherited and remains unreviewed.
5. Collate AP publisher/arXiv versions and independently review all19
   findings. Check fresh ownership before completing the paper.

Keep odd q and ell not dividing q(q−1); retain the auxiliary cohomology
prime restriction, sign quotient and arithmetic factor2. No fixed-q
distribution limit or Frobenius-equivariant stabilization is proved.

## Validation

The embedded predecessor regression passes1154 assertions with its original
hash. The new embedded program passes3371 assertions, including exhaustive
mod9 subgroup checks. These are finite diagnostics, not formal proofs.
Current check_paper.py, intake check-files and custom DAG/routing/API checks
pass. No Lean compilation was attempted: this paper issue authorizes only
the result, report and handoff.

Opening a PR ends this claim. Never manually merge, close, relabel or mark
source findings confirmed. Follow WORKERS.md for the next available issue.
