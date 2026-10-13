# PKG-LocalGaloisDeformationRings~2

Issue: #7910. Agent: Codex, session `codex-OMsS8y`. Date: 2026-10-13.

## Completion and scope

The package revision is complete and ready for an independent package review.
Changed only the package README, Suggested.lean and this handoff; metadata is
already exactly `topic = "math.NT"`. The accepted packet, its reader and suggested
file, the old review report and `review.json` remain unchanged.

The README retains all 157 target anchors, all 247 accepted API names and the
mathematical content of the original tests, with corrected or strengthened
negative controls. It now has 46 Checks blocks containing 173 bullets; every one
of the 43 accepted definition/construction targets has at least three. All 429
internal prerequisite links resolve. Each target has a source paragraph. Its
236,126-byte size follows the binding 2026-10-12 rule to keep the full content;
the older 200 KB instruction is superseded by that rule.

WORKERS, both protocols, UPSTREAM_GUIDE, PACKAGE_REVIEW and the independent
review's five revision groups were read. The current ReductiveGroups and
LocalGaloisGroups READMEs were read in full, with their Suggested files inspected
for the relevant carriers and ownership. The README follows their mathematical
form: Summary, scope, conventions, exact supplier contracts, build order, eight
layers, per-layer examples/dependencies, downstream consumers and references.

## Resolution of the five revision groups

1. **Whole-interface comments.** Replaced the old 4,451-line Suggested file with
   a 416-line file in `TauCetiRoadmap.LocalGaloisDeformationRings`, importing
   `Mathlib`. It has 15 real-bodied definitions, one real quotient abbreviation,
   ten theorem signatures and 34 examples. There are no sorry'd carriers, data
   instances, fabricated coefficient categories or final name catalogue. The
   full Hodge-type, lattice-functor, universal-ring, period and model-space
   specifications live in the README with their actual hypotheses and supplier
   contracts. The review's 2026-10-08 request to type every heavy interface is
   superseded by WORKERS/PROTOCOL/PACKAGE_REVIEW's binding 2026-10-12 shape: a
   carrier absent at the pins is a README target. The file records only light
   definitions and representative milestones that can be stated at the pins;
   it does not develop the missing theory or claim exhaustive typed coverage.
2. **Foundational hypotheses.** The standing category now requires the complete
   DVR, identified residue field, complete separated Noetherian local objects,
   continuous local residue-compatible morphisms and maximal-ideal topology.
   The group is G_K or an explicitly Φ_p profinite group. The countable product
   of C_p is the negative control. The wider finite/p-adic/local-characteristic-p
   coefficient alternatives specify their actual fields and natural topology.
   General-G lifting uses a smooth affine group scheme and its base-change
   functor. The old arbitrary residue map, topology tag and subgroup family are
   absent from Lean; they have not been perpetuated as weaker carriers.
3. **Actual comparisons.** README 1.5 states the framed/unframed power-series
   isomorphism and forgetting map; 1.12 states the coefficient/residue extension
   square and completed scalar-extension isomorphism; 1.18 identifies point
   completions with characteristic-zero lifting rings and uses H², rather than
   a cotangent inequality as a substitute. Targets 1.20 and 1.24 retain the
   central-quotient, universal determinant and twisting maps, including p|d;
   only the integral scalar split requires p∤d. Target 2.12 retains the inert
   CM extension, polarization, multiplier and distinguished Frobenius block.
   Its odd-parity mixed condition equals unramified, with the separate ramified
   relative dimension N²−1; the even-parity node has two components. Misnamed
   dimension-only Lean consequences were removed.
4. **Ordinary and KW data.** Targets 7.2–7.4 specify R̃□=R□⊗̂_ΛΛ̃, universal
   full Galois characters, the characteristic-polynomial and ordered-product
   ideal, the image ring and its structural map, descent through an injection
   R→S, and finiteness of the character algebra over the image. Lean retains
   only the actual matrix equations and ordered triangularization predicate;
   it does not fake their universal coefficient rings. Target 8.2 records ψ,
   the selected unramified character γ, weights, tame type and monodromy, and
   all finite-place and real-place point criteria. A Boolean cannot replace
   those branch data. Dyadic weight two and four remain distinct even when
   their residual cyclotomic characters coincide.
5. **Mathematical examples.** Layer examples now concern actual rings, flags,
   incidence images, representations and quotients. The p+1 comparison names
   the actual smooth ordinary ring; GSp₄ examples identify the lowering
   Lie-filtration subspaces; the completed tensor example is the actual
   seven-variable one-equation ring. Arithmetic flag-dimension calculations in
   Lean are explicitly only multiplicity-profile calculations. Its genuine
   controls include the Z/9 ordered-product obstruction, the actual GL₃
   identity partial Frobenius matrix and determinant coefficients, modified
   nilpotent exponential/logarithm with characteristic-three correction, and
   the formal node quotient with zero/unit constant-term controls.

## Ownership and current-library audit

Current TauCetiRoadmap checked read-only at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched across the current roadmaps,
including the newer and Completed directories, and current library by both
names and mathematical objects. Read relevant supplier scope and signatures.
No Lake command was run in either checkout.

- LocalGaloisGroups Layers 3 and 7 supplies finite generation over every finite
  local extension and the Φ_p input. This package consumes it, with no new
  absolute-local-Galois or finite-generation target.
- Current `NumberTheory/LocalField/Tame/PadicCharacter` supplies
  `inertiaPadicTameCharacter`, surjectivity, its kernel criterion and arithmetic
  Frobenius conjugation. Target 2.6 only constructs the coefficient-p quotient
  G_K/ker(I_K→ℤ_p) and its matrix-pair interface. It is distinct from the full
  tame quotient owned by LocalFieldsRamification.
- Current `LinearAlgebra/Matrix/SymplecticMultiplier` proves the rank-two
  multiplier/determinant identification; that identity is an input, not a new
  target. Rank-four deformation and flag conditions remain local work here.
- Current `FieldTheory/GaloisCohomology/Kummer` supplies `TauCeti.kummerIso`,
  `TauCeti.kummerIso_res` for separable embeddings, and `TauCeti.kummerIso_norm`
  for finite extensions. The extra interface for 8.9 is decomposition action
  over K^nr, valuation compatibility, inverse limits and twisted completed
  coefficients, requested from ProfiniteCohomology Layer 9. Basic Kummer theory
  has not been re-planned.
- IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1 owns determinant polynomial
  laws, pseudocharacters and generalized matrix algebras. Its algebraic
  universal ring does not supply continuous local pseudodeformation
  representability; that stays with GlobalGaloisDeformations R04.2.
- ReductiveGroups Layers 8–9 owns the relative Borel and integral reductive
  interface, including the still long-horizon coefficient-ring statements.
  Relative Borels are a supplier obligation, not supplied merely by the
  field-valued theorem. ReductiveGroups Part II's point topology/Weil
  restriction work is not this local deformation construction.

Two upward interfaces are restated precisely in the local package: the block
centre/full-WD pseudodeformation identification in 3.8, previously assigned to
PadicLocalLanglandsForGL2Qp R30.5, and the scoped GL₃ weak minimal patching functor
and existence/multiplicity theorem in 6.30. Higher roadmaps should import these
local interfaces. General global automorphy and patching remain with their
owners; 6.30 supplies only the LLHLM-scoped globalization, auxiliary smooth local
factors and exact functor properties needed here. Also corrected the polarized
group owner to ArithmeticGaloisRepresentations G7; GlobalGaloisDeformations G7
owns polarized deformation problems. No upward prerequisite, Foundations stage
id or UPSTREAM marker remains in the package.

## Source and adversarial checks

Statements are in our own words with numbered locators. Public papers were read
at the cited locations for the revised claims; this is not a new proof of every
research theorem or a fresh read of every inherited reference. A supplementary
15-target locator sample was checked (seed 7910), alongside the revision-specific
checks. In a multi-source target the table specifies exactly the source inspected.

| Target | Source inspected | Result |
| --- | --- | --- |
| 5.6 | KW II §3.2.6, p. 30 | Fixed γ and γ²χ_p=ψ; homothety exception and dimension retained. |
| 2.15 | Gee Proposition 3.37 and Theorem 3.38, p. 21 | Distinct inertia characters and unique generalization qualifications retained. |
| 2.16 | CG18 §8.5.1, arXiv v2 pp. 81–82 | Actual scalar-block tangent calculation is on p. 82; locator replaced. |
| 2.10 | Gee Lemma 3.33 and Example 3.34, p. 20 | Both matrices and arithmetic Frobenius relation checked. |
| 8.4 | KW II §3.2.4, p. 24 | Actual node, framing variables and ramified coefficient distinction checked. |
| 4.4 | KW II Lemma 3.8, p. 30 | Nonzero residue power series is necessary for preparation. |
| 6.30 | LLHLM Theorem 3.5.3 and Lemma 3.5.4, pp. 29–30 | Correct pages, genericity and local/global branches. |
| 8.2 | KW II §3, p. 18, and §3.2.2, pp. 22–24 | ψ, unramified choice and dyadic/monodromy branches checked. |
| 6.28 | LLHLM §3.6.1, items (1)–(4), diagram (3.9), pp. 36–39 | Actual chart matrices, corrected saturation equations and common smooth ring. |
| 4.14 | Caraiani–Newton Lemma 5.3.4, p. 77 | Both ordinary and nonordinary component cases and coefficient hypotheses. |
| 6.8 | BLGGT §1.3 p. 21 and §1.4 p. 26 | Common component retains the component itself; unique-component use checked. |
| 1.7 | Newton–Thorne Definition 2.5(2), p. 12; Caraiani–Newton Definition 3.3.1, pp. 50–51 | Ordered characters and reciprocal/sign dictionaries checked. |
| 1.17 | Paškūnas–Quast Lemma 3.2, printed p. 23 (PDF p. 29) | Actual coefficient topology and smooth group functor required. |
| 1.15 | BIP §3.5, Remark 3.32 p. 25 and Proposition 3.33 p. 26 | Field alternatives, topology and noncanonical Cohen isomorphism checked. |
| 8.9 | KW II Proposition 3.6, Lemma 3.7 and proof, pp. 24–30 | Kummer/coefficient choices and smoothness exceptions checked. |

Further corrections/checks:

- The accepted packet's CEGS generic-reducedness gap names the wrong paper:
  *Components of moduli stacks* (2207.05237) has no matching Theorem 1.3. The
  correct theorem is *The geometric Breuil–Mézard conjecture for two-dimensional
  potentially Barsotti–Tate Galois representations*, 2207.05235v2, Theorem 1.3,
  p. 4. README's supplier contract and bibliography now cite it, with p>2 and
  tame τ; the fixed-determinant specialization uses odd-prime rank-two scalar
  twisting. A future authorized packet edit should correct the inherited gap
  and request; the packet was not changed here.
- The Pappas–Rapoport contract now points to Theorem 5.4 p. 17 and Corollaries
  5.9–5.10 pp. 21–22 in math/0006222v2. Its naive=flat criterion retains the
  reduced-nilpotent-scheme hypothesis of Conjecture 5.8 and known cases.
- CDN Remark 1.15 p. 19, Theorem 1.16 p. 20 and Theorem 5.11 p. 66 distinguish
  p≥5 integral centre comparison, p=3 torsion quotient, p=2 cokernel killed by
  2, and the comparison for every p after inversion. The pseudodeterminant is
  δ_M ε, while δ_M is the central character.
- Dotto Example 3.8 is on published p. 230, not 233. Definition 5.2/Theorem 5.3
  pp. 239–240 and Theorem 5.5 p. 242 specify the transfer supplier precisely.
- Booher Corollary 6.16 p. 30 explicitly requires (A1)–(A4), p. 4, and absolute
  irreducibility of the relevant Λ_K representations. Target 2.28 now lists
  those assumptions, including square roots of q, −1 and 2 and the pure
  nilpotent lift with smooth centralizer.
- The maintainer-cleared Conrad author copy was read for Theorem 5.2.11 and
  Corollary 5.2.13 pp. 157–159; cleared ACC+ for §6.2.6, equations (6.2.7)–(6.2.8),
  Lemma 6.2.9 and Proposition 6.2.10 pp. 138–139; cleared published LTXZZ for
  Definition 6.3.3 p. 277. No cleared file or passage was copied anywhere.

| Mathematical control | Instance and consequence |
| --- | --- |
| Representability/coefficient category | ∏ C_p gives infinitely many first-order rank-one characters; residue kernel/topology conditions exclude arbitrary coefficient tags. |
| Scalar/determinant comparison | p|d retains the relative determinant presentation; p∤d is used only for the integral power-map split. |
| Height and FL signs | Height zero tests matrix invertibility; u versus u+3 has no finite height; ε^{−(p−1)} is outside the strict FL interval and repeated ε⁻¹ fails multiplicity-one. |
| Ordinary order | Rank-one equations give actual character equality; χ functions are distinct without requiring one element to separate all values. |
| Nonreduced ordinary equations | In Z/9, M=diag(4,7) and U=(1,1;0,1) each have charpoly (T−1)², but (M−1)(U−1)=(0,3;0,0)≠0. |
| Nilpotent formulas | N⁴=0 and 2 invertible are explicit; q*=((q−q³)/3) is integral before reduction, so q=2 in characteristic 3 retains a cubic term. |
| Tame and Steinberg direction | Φ=diag(2,1), σ=(1,1;0,1) gives Φσ=σ²Φ; identity Frobenius fails the q=2 Steinberg relation (8≠9). |
| Components | Projection points of Q×Q lie on different minimal primes; transitivity needs uniqueness at the middle point. |
| GL₃ determinant chart | Stars one and residual a=1 gives v³+v²; b=f=g=1 gives v³+v while coefficient v² vanishes; zero residual gives v³. |
| Integral node | XY−πu uses a nonzero nonunit π and a unit u; constant zero gives two zero-divisor branches, constant a unit gives the zero ring. |
| Dyadic/parity choices | Odd and even real lifts can have the same mod-2 reduction; N=0 and N≠0 separate the dyadic weight branches; odd/even inert parity selects different rings. |
| HT convention | μ_p has Tate module Z_p(1), weight +1 here; Newton–Thorne's weight-two type is {0,−1}, while its dual KW type is {0,1}. |
| Framing/export example | 2+4 is witnessed by the actual completed tensor product O[[x,y,z,u₁,…,u₄]]/(x²+2x+yz), not a standalone dimension sum. |

An English twelve-word phrase scan across the public texts and the three
cleared texts found no mathematical prose overlap. Bibliography/title matches
and sequences of mathematical variable symbols were excluded from the prose
check. Sources and extracted public texts stayed in scratch; all are discarded
at submission. No source excerpts are in the package or this handoff.

## Baseline and validation

The reviewed library audit and family ownership/link map were consulted. Read
all nine accepted baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: `MvPowerSeries`, `ProfiniteGrp`,
`Module.Finite`, `IsAdicComplete`, `IsLocalRing.ResidueField`,
`Matrix.symplecticGroup`, both named Weierstrass declarations and
`TauCeti.ContCohomology.H2`. The latter is an additive quotient; no finite
coefficient-linear duality result was inferred from its name. Current library
additions listed above are ownership inputs and are not used by the Lean file.

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRings.json`:
  exit 0, zero errors/warnings; 157 nodes, 247 API items, 162 accepted tests,
  43 planets, nine baselines, eight planned stages, zero closed stages.
- `lean-check research/blueprint/packages/LocalGaloisDeformationRings/Suggested.lean`:
  final exit 0, zero errors, 19 warnings, all exactly `declaration uses sorry`.
  The final file has SHA256
  `86a5d795aa8fc3ed6cc9ed49ef552ea85680a4b084456f029a2ae2911f8104c2`.
  Its only import is Mathlib at the exact pin. Checks were serial, with more
  than 20 GB available; no LSP, Lake build/update/cache or background Lean
  process was started. No Lean statement changed after that successful check.
- Programmatic target/API/source inventory, Checks counts, prerequisite links,
  all 26 named Lean declarations occurring in README, namespace/layer order,
  placeholder/process/path scans and TOML parsing pass.
- Intake `check-files` on the four deliverables and `git diff --check` pass.

No package work remains for this run. The ten inherited gaps and 22 requests
remain in the accepted packet; none is an implementation claim or has been
silently marked discharged. They concern local models, BT generic reducedness,
natural-topology cohomology, integral reductive/Lie theory, endpoint input,
division-algebra transfer, relative Borels, the old suggested-signature record,
Colmez–Fontaine and GL₃ patching. The new package gives exact contracts and local
ownership under the current shape, not proofs of those interfaces. The next
worker is the independent reviewer: repeat elaboration and assess these
contracts, examples and source corrections against the accepted plan. The old
review/signature-coverage note needs reconciliation only in an authorized
packet job. No scratch artifact is needed to resume.

## Public source fingerprints

The table records the actual public PDFs used for source checks, accessed
2026-10-13. Titles, authors and edition conventions are in README's bibliography;
links here specify the fetched version. Hashes identify the read bytes without
retaining a PDF in the repository. The unrelated CEGS Components and local-
geometry PDFs were inspected only to resolve the mistaken citation and are
not sources for the generic-reducedness claim.

| Source | Read PDF | SHA256 |
| --- | --- | --- |
| BIP | [PDF](https://arxiv.org/pdf/2110.01638v2) | `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4` |
| PQ | [PDF](https://arxiv.org/pdf/2404.14622v2) | `eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c` |
| LLHLM | [PDF](https://arxiv.org/pdf/1608.06570v4) | `cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd` |
| BCGP21 | [PDF](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| BCGP25 | [PDF](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| KWII | [PDF](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| KWI | [PDF](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| CHT | [PDF](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| Gee | [PDF](https://arxiv.org/pdf/2202.05818v2) | `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5` |
| Savitt | [PDF](https://arxiv.org/pdf/math/0404327v3) | `e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c` |
| CG20 | [PDF](https://arxiv.org/pdf/1907.08691v1) | `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059` |
| NT26 | [PDF](https://arxiv.org/pdf/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| FKP | [PDF](https://arxiv.org/pdf/2008.12593v5) | `6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2` |
| LTXZZrigid | [PDF](https://arxiv.org/pdf/2108.06998v1) | `fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a` |
| CDN | [PDF](https://arxiv.org/pdf/2204.11214) | `c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee` |
| Ding | [PDF](https://arxiv.org/pdf/2407.21237) | `a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8` |
| Shotton | [PDF](https://arxiv.org/pdf/1608.01784v2) | `54775e5adac83cdbb628ea5238aab8a7a04a3d9bb3dc2502b46da6bb21689992` |
| CG18 | [PDF](https://arxiv.org/pdf/1207.4224v2) | `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb` |
| PR | [PDF](https://euklid.mi.uni-koeln.de/mi/Forschung/Rapoport/localmodels1.pdf) | `43992aa5928c61e4e6f9ad6bc5194bdeac80903240e87162a0fc600649c8e0b6` |
| Dotto | [PDF](https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf) | `ee2f2ed14dfb86b8a90038b81e805aa2f1d6835c07f1eaf9f97b1e7a43105e98` |
| KisinNotes | [PDF](https://people.math.harvard.edu/~kisin/notes/notes.pdf) | `9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6` |
| CN | [PDF](https://arxiv.org/pdf/2301.10509v3) | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| Booher | [PDF](https://arxiv.org/pdf/1807.10743v1) | `fc424c66047c546ae25e5b0530e4bf10a5263a153db54e6b7cab84f364a38698` |
| BLGGT | [PDF](https://arxiv.org/pdf/1010.2561v4) | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| CEGSBM | [PDF](https://arxiv.org/pdf/2207.05235v2) | `f8593a6a27e6c8ce488b2c82632572b7d9a4a98ad1349f6ecdc807be2556dd58` |
