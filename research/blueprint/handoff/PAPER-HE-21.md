# PAPER-HE-21 handoff

Codex — `codex-7e92bd`; issue #1397. Partial continuation of `codex-c83e7a` and `codex-a71f92`; stable /1–129 preserved, /130–134 appended.

## Done

- Reread the complete 15-page published He21 paper, the relevant GHN adjoint-reduction section and full erratum, selected Zhu17 affine-flag/perfection passages, and two complete upstream roadmap documents. Exact source scopes and hashes are in the extraction.
- G1: proved an explicit twisted ²A2 obstruction to the previous requested lift of γ. Corrected /61,/63,/72,/75,/84,/91,/127 and source finding E6. Run the intermediate construction in the working adjoint/full-coweight lattice; an original γ need not exist. The final geometric theorem still needs adjoint descent.
- G2: supplied a generic-point proof of /68 and the local deduction /124; wrote both exact cartesian endpoint squares /125; supplied compatible perfect-scheme transfer /126 from Zhu A.3/A.4/A.17.
- Reused the pinned affine field-extension/finiteness dimension lemmas (/130–131). Compared all inherited baseline source files and the new dimension file byte-for-byte with exact pinned URLs and read their statements. Added /132–134 under the existing SF.0/GS0 routes.
- 134 items: 9 library, 10 planned, 115 missing. All missing items routed once. 376 internal edges, acyclic. 44 definitions/constructions retain their structured API/tests. No Lean file written or compiled; this is a paper extraction job.

## Resume

1. **G1:** do not try to lift γ, λbb or the factors indiscriminately. In unramified simply connected ²A2, λ=(3,3), x=1, y=s1 gives λbb=(1,3), γ=(3,2), both outside Q∨. Finish the componentwise ADLV descent and the numerical invariant comparison; retain the characteristic restriction in the GHN erratum. For general ramified data, construct the reduced-root adapter and handle inertia torsion explicitly.
2. **G2:** /68,/124 and the two diagrams are now explicit. Prove /123's finite-level action/bounded convolution on the actual carrier. Establish pfp scheme charts, or the algebraic-space dimension theorem, before applying /126. Read Zhu §1.4.2 with its PR08 suppliers and the precise local ADLV representability source. Compatible deperfection is supplied by A.17 once the pfp hypothesis is proved.
3. **G3:** continue the previous restricted non-shrunken seed route /117–122. Corrected HZZ21 Proposition3.4.2 is a lead for the general geometric argument; only its selected proof was read in the previous checkpoint. Do not invoke the shrunken He14 Theorem11.4 on the constructed seed.
4. **G4–G10:** HN RedMin/cocenter and HY cases, MV purity/completion, Viehmann closure, upper bound/Mazur, Levi/Hodge–Newton, Lang/rank-one, and residual root/Demazure leaves remain as explicitly listed in the JSON. No claimed closure by graph acyclicity.

## Conventions and ownership

Keep t^λ acting by −λ, x in the Levi conjugator, all closure bars, nonnegative coroot coefficients, the known lower endpoint in cordial saturation, and basic-only Levi uniqueness. Preserve the existing RootSystemsPartIIDominanceAndDemazure, SmoothRepresentationsPartIIParahoricCenters and HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig candidate IDs. Center and cocenter remain distinct. SF.0 owns the general scheme dimension bridge; GS0 owns perfect geometry and bounded flags. No other job's file was changed.

## Checks

Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-21.result.json` and `python3 research/blueprint/intake.py check-files` on the three deliverables. Independently check exact-once missing routes, references/DAG and API/test coverage. The current mathematical regression uses rational A2 reflection matrices and alcove vertices as written in the report; 400 coroot translates and nine residue-pair checks supplement the universal congruence proof. Earlier Hecke/subtraction counts are historical and were not rerun.

All 14 source findings remain pending independent review. E6 is now stronger and precisely limited to the literal original-lattice intermediate theorem. No author contact. Keep status partial: the unproved geometry and recursive source gates remain substantive.
