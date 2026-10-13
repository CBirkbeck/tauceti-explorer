# Handoff: BP-ModularCurvesPartII--R12.1

Agent: Codex, session **codex-DB7w56**, 2026-10-13. Refs #773.
Claim comment 6143160815; bot confirmation 6143163814.

The target-level pass is complete. All ten checkpoint node ids are preserved,
with corrected statements and dependencies. The packet has 48 targets:
6 definitions, 7 constructions, 33 theorems and 2 applications. It records
107 named declarations/API items, including 73 items on definitions and
constructions; 52 unit tests; 39 planets; 12 pinned native declarations;
38 supplier contracts; and one explicit analytic-carrier integration gap.
All implementation statuses remain unchecked. This is a complete blueprint
submission; another planning pass is not required to fill an omitted target.

## Coverage

| Stage | Targets | Status | Completed planning scope |
| --- | ---: | --- | --- |
| R12.1 | 5 | planned | Native lattice cubic, pointed uniformization, isogenies, periods and the scheme Weil-pairing comparison |
| R12.2 | 5 | planned | Holomorphic marked family, full/point/cyclic quotient comparison, row/diamond conventions, stabilizers and scalar-frame application |
| R12.3 | 4 | planned | Tate/analytic cusp parameter, compact comparison, boundary fields and level-map ramification |
| R12.4 | 4 | planned | Field-extension application, fixed-pairing connectedness, paired-twist analytic comparison and geometric irreducibility |
| R12.5 | 6 | planned | Hodge line, weight-two differentials, characteristic-zero correspondences, trace normalization and full rational Hecke pairing |
| R12.6 | 5 | planned | Generic models and coefficient descent, Q(j,j′), component/Galois actions and compatibility |
| R13.1 | 11 | planned | Generalized elliptic curves, polygon calculations, schematic boundary, quotients/contractions, structure criterion, formal existence, torsion/cyclic levels and contraction tower |
| R13.2 | 8 | planned | Integral full/point/mixed/naive levels, coherent cyclic refinement, stack properties, pairing components, fine/DM ranges, ordinary agreement and level maps |

None is marked closed: the planned chains include requested supplier outputs
and the explicitly unintegrated shared carrier. No target is omitted from
these eight stages. Independent mathematical review and packaging are next,
with supplier integration applied by the owning jobs or maintainer.

## Ownership and dependency direction

The accepted RS-06 review, including its 2026-09-30 repair, determines the title,
base and keeps. This is tier 11 in the Caraiani–Newton order, without a new
bundle. Other-roadmap suppliers are existing upstream or lower tier.
Current TauCetiRoadmap was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. FuchsianOrbifolds and
ConformalMapping were read in full, ModularCurves/ModularForms supplier
layers were inspected, and the nine post-snapshot roadmaps were searched.
Individual elliptic uniformization here does not duplicate ConformalMapping's
Riemann mapping theorem. Current Tau Ceti's scheme Weil pairing and Tate
equation/q-expansion constructions remain imports.

Preserve **R13.4a → R12.3 → R12.6 → R13.4b**. R12.4 uses open comparison
without R12.3. Tate/analytic punctured-disc comparison precedes compact
comparison. R13.1/R13.2 do not depend on full Tate theory. Ordinary R13.2
agreement does not consume R13.4a, avoiding the reverse coarse-construction
cycle. R14.1 consumes R12.5's characteristic-zero normalization.

The 38 contracts comprise 23 explicitly labelled existing upstream interfaces
and 15 exact stage requests: SF.2/SF.3/SF.4;
AlgebraicModuliForArithmeticGeometry R09.1–R09.6; AdicSpacesPartII F0;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1;
AbelianSchemesAndArithmeticModuli A5; ComplexComparisonPartII C2;
and this roadmap's R13.3 and R13.4a. Accepted C0/C4/C5 repair nodes are direct
prerequisites where their exact statements apply. Requested outputs and
consumers are stated in the packet and reader.

### Analytic carrier: RT-AREA-algebraicgeometry/3

Neither pin supplies complex analytic spaces. C0's repaired analytification
node presupposes unintegrated PR196 Layers 0–2, and SF.2 has no explicit
analytic targets. The packet uses the finding's permitted SF.2 integration
option, requesting locally C-ringed holomorphic-ideal models retaining
nilpotents, morphisms, open/closed subspaces, gluing through PresheafedSpace,
fibre products, and finite-type scheme analytification with its universal
property, immersion/product compatibility, étale local-isomorphism and
smooth-manifold interfaces.

Apply the proposed SF.2 rescope and add five outgoing stage edges:
ComplexComparisonPartII:C0, ShimuraVarieties:V2, ShimuraCompactifications:C2,
PELModuli:M3 and ModularCurvesPartII:R12.3. On the PR196 external record,
encode its stage dependency and list these consumers, preserving the actual
PR merge state. Concrete `restructure` and `externalContractUpdates`
proposals and direct SF.2 prerequisites are in the packet. The external
record, other packets and atlas data were not edited because this issue
permits four deliverables. The manager/supplier applies the cross-file
changes before claiming implementation closure.

## Mathematical corrections to preserve

- The split one-gon is **y²z+xyz=x³** over Z, including characteristic two;
  u=t/(t+1) has identity at t=∞. Polygon automorphisms are **μ_m × Z/2**,
  a direct product, and N-torsion has rank N gcd(N,m).
- Finite subgroup quotients have flat target curves; the total quotient map
  need not be flat at a node. A contraction identifies the preimage of the
  target's smooth locus with that smooth group. Source smooth points on
  discarded components map to nodes.
- Preserve the schematic Fitting boundary, arbitrary base change and formal
  nonreduced bases. Formal algebraization uses proper marked curves and the
  structure criterion, rather than GAGA for the nonproper smooth group.
- DR's automorphism conclusion needs trivial action on Pic⁰.
  μ_p × Z/p in characteristic p is cyclic in the Drinfeld sense.
  The old handoff's claim that Γ₁(p) is non-DM has been removed.
- Mixed Γ₁(N;n) data are unrestricted with gcd torsion and ampleness
  conditions. Preserve the valuation-based DM range; N=n=p² is DM.
- Naive Γ₀(N) and refined X₀(N) differ at nonsquarefree level even over C.
  Keep labelled m-decontractions with g=gcd(m,N/m), d=m/g and coherent
  generators. The naive-to-refined map has μ_g relative inertia. Refined
  X₀ retains generic inversion and is not called fine.
- Open full level is fine for N≥3 and open Γ₁ for N≥4. Compact fine/DM
  ranges are separate, including level one and the Γ₁(4) cusp exception.
  Ell_nm→Ell_n is nonrepresentable; the stated finite flat full/point
  level maps are representable.
- Scalar-equivalence full frames retain inversion. Specify μ₂-rigidification
  where used. The effective (2,3,p) orbifold is the indicated deck quotient;
  the rigidified full-level component itself is smooth.
- Use the Silverman pairing, algebraic row action and Hodge frame
  2πi dz=du/u. Effective and strict cusp widths may differ. Distinguish
  ψ(4)=6 cyclic kernels from σ₁(4)=7 all subgroups. Hodge pullback–trace
  is divided by n; weight two agrees with curve differentials. The rational
  first-coefficient pairing uses the full Hecke image, including bad blocks.

## Sources and findings

The reader and packet contain section/theorem/page locators, public URLs,
versions and SHA-256 hashes. Statements and source findings are in our own
words; no passage or section-by-section source digest is reproduced.
The required passages were read: Conrad's generalized-elliptic author copy
§§2–4 as specified in the catalog; relevant DR II/III/IV/VII passages;
Česnavičius §§1–5.13 and published fine/DM criteria; Conrad's analytic/classical
handouts and complete q-expansion handout; DDT §§1.1/1.2/1.5/1.6;
Milne §§3/5/6–8; routed Bakker–Tsimerman §2 passages and the complete
five-page erratum; and Gross–Zagier I §1 p.226 and V §1 p.306, read visually.

There are **14 source findings**, with corrections, reasons and correction
searches, awaiting independent review. No self-review verdict is recorded.
Conrad's publisher served abstract/access controls only, so findings against
his paper are scoped to the author copy. Milne's errata endpoint returned
HTTP 406; the revision page and targeted searches were checked, without
claiming inspection of the unavailable errata list. The earlier checkpoint's
unread DR proof gap is resolved by reading the public scan. No unread primary
passage needed for an in-scope target remains. Ordinary Katz–Mazur local
theory remains with MC7B rather than duplicating its private-book development.

The routed Bakker–Tsimerman/Gross–Zagier items in this part are covered.
Full Tate theory belongs to R13.3; integral coarse curves/Φ_N to R13.4a;
arithmetic cycle-degree export to R13.4b; corrected regular models to R13.5;
integral correspondences/Atkin–Lehner to R14.1; Jacobian faithfulness to R14.2.
Other routed Masser–Zannier, Chabauty and Calegari–Geraghty/
Calegari–Dimitrov–Tang items remain with the owners identified in the reader.

## Lean and validation

The 94-line suggested file follows WORKERS's 2026-10-12 streamlined shape,
which supersedes the older exhaustive prototype instruction. It has two
light real-bodied definitions on native carriers, native lattice milestones
and selected examples. Heavy definitions, their complete API and all tests
are reader targets. It introduces no invented carrier or auxiliary theory.

`lean-check research/blueprint/suggested/ModularCurvesPartII--R12.1.lean`
elaborated at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, exit 0, with only three intended
proof-placeholder warnings. Polynomial examples and the native
connected-to-irreducible example are proved. No build/update/cache command or
language server was run.

Validation passed:

- `scripts/check_blueprint.py` with the pinned declaration index:
  zero errors and zero warnings; all eight stages planned.
- `research/blueprint/intake.py check-files` on the four deliverables:
  zero problems.
- `scripts/check_sorry_data.py`: no data placeholders.
- Source-version validation through `check_errata.versions_checked`:
  no errors.
- Atlas graph with promoted restructurings, latest accepted RS-06, packet
  dependencies and five SF.2 proposals: 1,968 stages, 6,858 edges, no cycle,
  no unresolved nonnative prerequisite; 105 packet cross-stage pairs and
  70 packet/integration pairs new to that graph.
- Packet/reader consistency, preserved checkpoint ids, native Lean shape
  and `git diff --check` were checked before submission.

Resume from the complete packet and reader for independent review. Apply
SF.2/external-record proposals in the owning jobs, reconcile exact supplier
contracts, then package in upstream form. Scratch files are discardable;
continuation information is here or in the three companion deliverables.
