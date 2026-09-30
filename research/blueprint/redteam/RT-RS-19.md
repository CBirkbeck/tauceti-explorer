# RT-RS-19 — independent red team of RS-19

Reviewer: Codex — codex-a71f92. Date: 30 September 2026.
Target: accepted RS-19 and REV-RS-19, not a certification of the future
implementations. Neither original job was written or reviewed by this session.
Audit snapshot: `14e0fb4d9e0b702fa59a604790b30ad2500b745d`.

## Result

Complete for this restructuring review: **no actionable finding established**.
The four dropped vertices are genuinely import/aggregate vertices. Their two
surviving consumers retain all recorded inputs, and their mathematical
obligations remain at the named owners. In particular, neither the Hitchin
support theorem nor the contracting-boundary Igusa trace theorem is replaced
by a generic perverse-sheaf theorem.

This is a scoped negative result, not an assertion that all the mathematics
of EDC or ET is proved, formalized, exhaustively decomposed, or correct in every
unexamined source. The existing EDC decomposition remains partial.

## Inputs and extent of reading

Read the complete family file (30 evidence records), accepted result and
report, independent review, and both authoritative campaign README documents.
Compared all **28** member stages, all **13** owner entries and all **four**
link reasons. The member split is 13 EDC stages and 15 ET stages; 24 decisions
are keep and four are drop. Neither roadmap is retired or renamed.

Read the full descriptions of 36 outside stages, comprising the 34 native
outside consumers plus IG.0 and IG.1. The consumers belong to
AutomorphicGaloisRepresentationsPartII, ClassicalAdicEtaleCohomology,
DeligneWeightsAndPurity, ExcursionOperatorsAndSpectralAction,
GL2AutomorphicRepresentationsAndTransfer, GeometricSatakeAndFusion,
GlobalShtukasAndFunctionFieldLanglands, GrossZagierAndArithmeticHeights,
IgusaVarietiesAndTorsionConcentration, LefschetzPencilsAndVanishingCycles and
WeilConjectures. These are stage-contract reads, not claims to have read every
paper cited by those roadmaps.

Read all 13 member entries present in `data/library-coverage.json` (EDC).
ET has no entries in that aggregate at this snapshot. Separately read the
15 ET entries and roadmap summary in AUDIT-32 and the complete REV-AUDIT-32
report. The report accepts the audit, but the audit result's review field is
absent/null; this distinction was not silently promoted to aggregate coverage.
Audit absence assertions are prior evidence, not a fresh exhaustive library
search by this reviewer.

Read the complete integrated EDC decomposition, its two nodes, seven links,
13 coverage entries, three gaps and accepted-review metadata. Searched all
packet/decomposition JSON string fields and reserved node IDs for exact
references to a dropped stage or a node beneath it; none found. No integrated
ET decomposition exists in this snapshot.

## Ownership and loss-of-target attacks

The following mapping was checked against the actual member text, not inferred
from layer numbers.

| Retired ET vertex | Retained supplier/obligation |
| --- | --- |
| ET.2 | EDC.0–7, LPV.6 and the independent Hitchin application ET.2b |
| ET.2a | EDC.0–7 and LPV.6, with early and late branches distinct |
| ET.2a:duality-perversity | EDC.0–6 and LPV.6; surviving consumer ET.5 |
| ET.2a:pure-decomposition | EDC.7; surviving consumer ET.2b checks its hypotheses |

ET.2 has no recorded consumer. ET.2a exports only to that retired aggregate.
ET.2b survives as its own vertex; it is not a child orphaned by hiding ET.2.
The basic/decomposition textual aliases are historical redirects, not requests
for extra mathematical stages. IG's ownership paragraph already names EDC.5–6
and LPV.6 directly and describes ET.2a as a re-export.

The 13 owner entries preserve the following distinctions:

1. **EDC.0 and foundational imports.** The finite-level coefficient categories,
   compact support and enhancement remain imported from their own owners.
   Compatibility with the enhancement is not a replacement axiomatization of
   the six operations.
2. **EDC.1–2 internal order.** The intended chain is adjoint, smooth trace/purity,
   constructible biduality, then pairings. Keeping the aggregate labels does not
   assert that all of EDC.1 precedes all of EDC.2. The independent curve/finite-flat
   trace input is not obtained by assuming the biduality it helps prove.
3. **Duality hypotheses.** Finite Tor dimension and coefficient-ring restrictions
   remain explicit. Relative duality over the base étale topos is not confused
   with absolute arithmetic duality; integral derived duals are not replaced
   by naive perfect pairings of individual cohomology groups.
4. **EDC.3–4.** Smooth-pair purity is not expanded to arbitrary regular immersions
   in singular ambient schemes. Singular-cycle and perfect-field restrictions
   survive. Weak Lefschetz, blowup and projective-bundle formulas do not assume
   the later hard-Lefschetz or decomposition splitting.
5. **EDC.5.** Early perversity, recollement, IC and exactness bounds are retained.
   The integral p/p+ torsion-pair construction is not identified with the
   field-coefficient self-dual situation. Dualizing IC retains the dual local
   system and twist, rather than claiming unqualified self-duality.
6. **EDC.6 and LPV.6.** Comparison functors remain with their own suppliers;
   EDC transports the specified operations through them. Trait-relative nearby
   cycles and the shifted function-to-line convention are distinguished.
   The particular finite-level/filtered-colimit support extension needed by
   IG.4 is not a theorem that all nonconstructible ind-objects are constructible.
7. **EDC.7 versus ET.2b.** Rational geometric semisimplicity and noncanonical
   decomposition are not integral/mod-ell statements or arithmetic Frobenius
   semisimplicity. Proper direct image and projective relative hard Lefschetz
   with an ample class have different hypotheses. ET.2b keeps Chevalley/Kostant,
   Hitchin/Picard and affine-Springer geometry, product formula, delta-regularity,
   support estimates and the actual locus/coefficient/purity checks.
8. **EDC.8 versus ET.5.** Construction and functoriality of a trace class do not
   remove fixed-point, compactification, contracting-boundary or large-Frobenius
   obligations. ET.5 retains these, acceptable correspondences, effective
   Kottwitz triples, stabilization and the shift/density argument.

The remaining keep decisions also preserve the endoscopic and automorphic
work: stable conjugacy, transfer factors and harmonic analysis, ordinary and
nonstandard fundamental lemmas with their separate change-of-characteristic
bounds, and stable/twisted unitary comparison. Nothing turns these into EDC
targets merely because both roadmaps use sheaf theory.

ET.6 retains the full characteristic-zero Weil–Deligne correspondence and
monodromy, rather than substituting a semisimple Weil parameter. The early raw
cohomology input and later local/global comparison remain separated. ET.6a
keeps the mixed-characteristic two-tower realization and its source-access
boundary, independently of the equal-characteristic ES7 branch. ET.7a remains
pure automorphic transfer without an IG.4–7 concentration premise; ET.7b remains
a rational alternating representation with virtual multiplicities, not a
statement about individual integral cohomology groups.

The outside contracts were consistent with this split: GS1 uses early
perversity while GS4:rational-reductivity uses late EDC.7; IG.4 still distinguishes
partial compact support from ordinary localized cohomology and needs the later
boundary argument; IG.5 uses the dual Hecke ideal and its actual lattice, not an
undualized trace constituent. WC.2 retains the determinant/sign computation
without assuming Frobenius diagonalizability. The LPV/DWP invariant-cycle branch
does not import DWP.9 while constructing an input needed to prove DWP.9.

## Fresh source probes

Both public PDFs were obtained and read on 30 September 2026. These probes
test the vulnerable ownership boundaries; they do not replace full source
extraction jobs.

**Beilinson–Bernstein–Deligne, Faisceaux pervers, Astérisque 100 (1982).**
[IAS public scan](https://publications.ias.edu/sites/default/files/Faisceaux%20pervers.pdf).
SHA-256: `801582f731eddeb734bd5f1dbf3462875cf02a8cb26aec144e53d510b8008f8a`.
This is image-only; selected pages were read visually, not through empty OCR.
PDF page number is printed page plus one. Read §5.0 on printed p.122;
5.3.6–5.3.9 on pp.137–139; 5.4.3–5.4.6 on p.142; and the statement/setup
of 5.4.10 on p.144. In particular read the complete short proofs of 5.3.8
and 5.4.5, but not all their dependencies or the full proof of 5.4.10.
The geometric base change in 5.3.8 and 5.4.5, the adjacent Jordan-block
example, and the projectivity/ample-class condition in 5.4.10 support the
restrictions retained by EDC.7. They do not supply Hitchin-specific support
estimates. No integral-coefficient decomposition is inferred.

**Yakov Varshavsky, Lefschetz–Verdier trace formula and a generalization of
a theorem of Fujiwara, arXiv:math/0505564v2.**
[Public version](https://arxiv.org/pdf/math/0505564v2).
SHA-256: `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6`.
Read coefficient conventions §0.2, the trace-class construction §§1.2.1–1.2.4,
§2.1.1 and Theorem 2.1.3 with its proof, and §2.3.1/Theorem 2.3.2 with
its proof; visually checked the theorem on printed/PDF p.20. Its nonproper
application requires the specified properness/quasi-finiteness over the open,
locally invariant boundary, vanishing off the open and sufficiently large
Frobenius power. These are substantive conditions beyond having a trace class.
The two correspondence legs must be matched by their roles, not by assuming
every source uses the same c1/c2 convention. This supports keeping ET.5;
it does not certify every later Shin normalization or all the proof's imported
functoriality results.

## Pinned-library probes

The existing clean baselines were checked at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

- Read Mathlib `CategoryTheory/Triangulated/TStructure/Basic.lean`, lines
  30–125, including `CategoryTheory.Triangulated.TStructure` at line 55,
  and the complete `TStructure/Heart.lean`. These provide an abstract
  t-structure/heart interface given its categorical data and axioms, not the
  scheme perverse t-structure, geometric support conditions or IC construction.
  The heart file itself still lists abelianness as a TODO.
- Read Tau Ceti `CategoryTheory/InvolutiveDual.lean` completely, especially
  `Functor.IsInvolutiveDual` and `dualityEquivalence`. The latter requires
  the contravariant functor, biduality isomorphism and triangle condition.
  It does not construct scheme exceptional pullback or prove the geometric
  biduality theorem required by EDC.1.

No new absence claim for the entire libraries is made from these probes.

## Structural tests and reproducibility

Used the actual `check_restructure.check` and
`restructure.apply_restructurings` against the pinned atlas in memory.
The result passes; application adds four edges, skips none, marks exactly the
four declared drops hidden, and retains every original stage, description and
edge. Upstream Tau Ceti stage titles, owners, descriptions and restructuring
metadata are unchanged.

For the stricter test, physically remove the four dropped vertices and their
incident edges, then add the four proposal edges. Start at each retained
vertex entering a dropped vertex, follow only dropped internal vertices, and
collect the first retained endpoints. The complete boundary is:

| Retained input | First surviving consumer |
| --- | --- |
| EDC.5 | ET.5 |
| EDC.6 | ET.5 |
| LPV.6 | ET.5 |
| EDC.7 | ET.2b |

These are exactly the four proposed links. Thus every path through the retired
subgraph is replaced. Every new edge also expands to an old path; none has a
return path. The native graph has 3,508 distinct edges, and this projected
graph has 3,502. This is a proposal-relative test, not a claim that unrelated
parts of the atlas are globally acyclic.

Repeated the test with native edges, resolvable stage `requires`, 25 accepted
link files, 31 accepted research restructuring results and 27 promoted
restructuring files. Only endpoints present in the current atlas were included;
unresolved registry-only additions are not certified. The union has 7,108 edges
before projection and 7,098 afterward; it has the same boundary and no missing
path or proposal-edge return path. No accepted link touches a dropped vertex.
In particular the current RS-17 review records removal of its two historical
links to the early ET.2a prefix and retains forwarding to ET.5.

All nine suppliedBy-to-surviving-consumer reachability checks pass. All 69
native outside exports, to 34 stages in 11 roadmaps, survive. There is no
surviving stage whose parent is a dropped vertex. These tests do not mistake
the aggregate ET.2a for its two concrete consumers.

The two integrated EDC node IDs still have the retained parents EDC.6 and
EDC.2. The packet remains partial: its comparison index and curve-duality
statement are not promoted to completed proofs, and its existing source and
integration gaps remain recorded. Reading selected BBD pages here does not
silently complete that separate packet's source-extraction obligations.

Before publication, the relevant input paths were compared with refreshed
main; they were unchanged. Validation: `check_redteam.py`, restructuring
schema/application, independent path/identity checks and intake validation of
both deliverables. No Lean file is requested or changed; none was compiled.
Only this report and its result JSON are submitted.
