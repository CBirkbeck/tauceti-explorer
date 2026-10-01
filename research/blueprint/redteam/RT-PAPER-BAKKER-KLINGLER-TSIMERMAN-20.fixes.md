# FIX-RT-PAPER-BAKKER-KLINGLER-TSIMERMAN-20

Complete fix by Codex, session codex-J6LwjP, 2026-10-01, for [issue #5531](https://github.com/CBirkbeck/tauceti-explorer/issues/5531). Read the red-team result and its verified verdicts: all three findings are confirmed. All three concern the extraction; no new error in the published BKT article is alleged.

## /1 — exceptional Hodge tensors

**Fixed.** /generic-mumford-tate-group and /hodge-locus now use rational type-(0,0) tensors in the untwisted tensor algebra. Exceptional tensors are those of type (0,0) at the fibre but outside the generic type-(0,0) invariant subspace. A type-(p,p) class requires the explicit twist (p), with the Tate character included, before any invariant test. The generic group, analytic locus, rational-subdatum countability and strict-special-preimage interfaces now agree; dependencies explicitly import the corrected locus where needed. Route 8 carries these conventions. Added the actual background prerequisite [K17], §2.4 Lemma 2.5 and §2.6, preprint pp. 8–9.

Added proposed tests for the constant Z(-1) variation and for generic invariant tensors. Direct check: in its tensor/dual space of bidegrees (a,b), the Hodge type is (a−b,a−b), and scalar 2 acts by 2^(a−b). Type (0,0) and invariance thus both require a=b; these subspaces are constant on the base, so there is no exceptional tensor. The type-(1,1) generator is excluded untwisted; its twist (1) cancels the Tate weight/action and makes it generic. Exact rational checks for 0≤a,b≤5 verified this witness. This is a check of the convention, not a proof of the general tensor-stabilizer theorem.

## /2 — ambient period points versus a Mumford–Tate domain

**Fixed.** /general-period-domain now realizes the represented Hodge group’s chosen real orbit as a subtype of the pinned full polarized PeriodDomain.Point carrier, retaining additional tensor conditions and the connected-component choice. Its manifold and compact-dual geometry belong to that orbit. The API replaces unconditional pointEquivalence by pointInclusion and adds fullComponentEquivalence under the full-polarization-isometry specialization; it does not assert a proper domain equals every ambient point. Updated its proof obligations, the /period-point reuse note, both copies of the proposed period-domain tests, the reader and route 8. The existing E27 represented-group/central-cover adapter remains required; no adjoint action on the original lattice is fabricated.

Read the actual pinned PeriodDomain.Point definition and laws in TauCeti/Geometry/Hodge/PeriodDomain.lean, lines 57–135, at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Its fields are the Hodge structure, type weight, fixed polarization and prescribed dimensions; it has no Mumford–Tate/tensor predicate. The reviewed HodgeStructures L3 audit agrees. The existing carrier and library status are preserved. K17 §3.1 Proposition 3.1 and Definitions 3.3–3.4, p. 10, provide the group-orbit and component source locator.

Added the CM non-surjectivity test and qualified the old weight-one/Siegel test by the full symplectic datum. For Q(e₁,e₂)=1 and u_y=e₁+yi e₂, iQ(u_y,conjugate u_y)=2y>0 for y=1,2, so both filtrations are polarized. J=[[0,−1],[1,0]] sends u_y to (−yi,1); this is proportional to (1,yi) precisely when y²=1. Thus J preserves F_i and excludes F_{2i}. The CM group at i is a torus, its derived group is trivial, and its orbit is a singleton inside a larger polarized ambient domain. The polarization and proportionality arithmetic was checked exactly.

## /3 — unbounded partial faces in the proposed chart repair

**Fixed by withdrawing the false proof.** /siegel-chart-refinement is now an explicit finite semialgebraic local-slice supplier with the complete fixed-K arithmetic-quotient hypotheses. Its conclusion retains finite injective open chart sections, quotient-topology compatibility and semialgebraic transition graphs. Its proof is not supplied. The note and proof obligations require every incident parabolic partial face to be handled with bounded directions as parameters; only the region where every root height is bounded above as well as below may use the compact interior argument. Route 7, G2 and the reader carry this boundary. E23 is preserved verbatim as the original source chart gap; no new counterexample to quotient definability or source issue is recorded. PROTOCOL §16 permits the extraction to state this missing supplier while proof development belongs to its design/blueprint job.

Added partial-face and bounded-interior tests. For integer t≥2, a(t)=diag(2t,t,1/(2t²)) has determinant 1 and root heights 2 and 2t³. It lies in A_(P,1) outside A_(P,3), but the second height is unbounded; inverse-root coordinates approach (1/2,0). Hence the complement of the all-roots-large region is not a compact remainder. Exact Fraction arithmetic verified determinant/root identities for t=2,…,100; the displayed identity proves unboundedness for the whole family. This establishes the obstruction, not the replacement supplier’s proof.

## Sources, limits and validation

Read on 2026-10-01:

- [Published BKT, JAMS 33 (2020), 917–939](https://par.nsf.gov/servlets/purl/10200187): pp. 920–921, 924, 926 and 934. 23 pages; SHA-256 `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058`.
- [Author copy of the official 2023 erratum](https://benjamin-bakker.github.io/DefArithErr.pdf): §1.4–1.5 on p. 3, with §1.1 context. Four pages; SHA-256 `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`.
- [Klingler, Hodge loci and atypical intersections: conjectures, arXiv:1711.09387](https://arxiv.org/pdf/1711.09387): preprint pp. 8–10, p. 8 also rendered. 22 pages; SHA-256 `fb0ea85a98db871ec140378feef334e2f67cc8215fc2a5e3c0e75d8d42015939`. No published-version collation claimed.

All source hashes match the red-team record. Earlier whole-paper reading claims remain attributed to their authors; this fix claims only the reads above. No new library availability claim is introduced, no upstream roadmap or campaign/data file is edited, and no original-source proof closure is asserted.

- `python3 scripts/check_paper.py` passed for the corrected packet.
- `python3 research/blueprint/intake.py check-files` passed on the three deliverables: three files, zero problems.
- Independent structural check: 147 distinct items, 10 library / 14 planned / 123 missing; each missing item routed exactly once; all prerequisites resolve; 228 prerequisite edges form an acyclic graph. Item IDs/statuses and all route memberships are preserved.
- Every source route’s named stages resolves in its roadmap extract. All 60 existing sourceIssues, including E23, are unchanged. The obsolete unconditional pointEquivalence is absent from the API.
- Exact rational regression checks for the three counterexamples passed; `git diff --check` passed. Proposed API/test contracts remain unimplemented planning specifications.
- No Lean deliverable was requested or changed, and no compilation, library build or language server was run.
