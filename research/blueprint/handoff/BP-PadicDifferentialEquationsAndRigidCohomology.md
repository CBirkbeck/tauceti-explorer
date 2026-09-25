# BP-PadicDifferentialEquationsAndRigidCohomology — handoff

Blueprint for **P-adic differential equations, rigid cohomology and p-adic weights**
(`PadicDifferentialEquationsAndRigidCohomology`), stages RD.0–RD.7.

The input was the reviewed decomposition `data/decompositions/PadicDifferentialEquationsAndRigidCohomology.json`:
two RD.2 nodes (Kedlaya's local monodromy theorem and the slope filtration), two links and four gaps.
Both node ids are kept, refined to declaration granularity, with their verified locators. The reviewed
library audit AUDIT-37 (accepted) finds every RD layer "not built". None of the supplier roadmaps has a
packet yet, so every cross-roadmap input is a `requests` entry.

- Packet: `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology.json` — **304 nodes**:
  | layer | nodes |
  | --- | --- |
  | RD.0 | 26 |
  | RD.1 | 42 |
  | RD.2 | 30 |
  | RD.3 | 30 |
  | RD.4 | 33 |
  | RD.5 | 65 |
  | RD.6 | 67 |
  | RD.7 | 11 |

  By kind: 50 definitions, 30 constructions, 111 lemmas, 97 theorems, 4 comparisons and 12 applications.
- Document: `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology.md`
- Suggested Lean: `research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology.lean`
  (3496 lines, namespace `TauCeti.RigidCohomology`)

Other counts:
- 545 API items and 345 unit tests;
- 45 planets (6 in each of RD.0–RD.6, 3 in RD.7);
- 79 baseline declarations;
- 28 gaps, 28 requests and 23 restructuring proposals;
- 67 source issues and 26 sources.

## Checks run

- `scripts/check_blueprint.py --index <baseline declarations index>`: **0 errors, 0 warnings**.
- `scripts/check_errata.py` on the source issues and versions: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- Own checks:
  - no dangling prerequisite;
  - no prerequisite on a later layer;
  - no dependency cycle;
  - nodes in dependency order;
  - excerpts at most 300 characters;
  - every test has a kind;
  - planets only on definitions, constructions and theorems.
- **Lean: compiled.** `lean` v4.34.0-rc2 against Mathlib 082e2d3, Mathlib imports only. Exit code 0; the
  only messages are 293 `declaration uses 'sorry'` warnings. No Mathlib or Tau Ceti build was run.
- Every definition, API item and unit test of the packet occurs in the Lean file under its packet name:
  as a declaration, an `example` with docstring "Test `name`", or a `-- name: not stated; needs …` comment.
  The nodes without a declaration of their own are listed at the end of the file.

## What the consumers get

- **ColemanIntegration L1.** Its four requests are served by nodes whose statements are exactly the
  request:

  | layer | node |
  | --- | --- |
  | RD.0 | `RD.0/frobenius-lift-on-dagger-algebra` |
  | RD.0 | `RD.0/frobenius-lifts-induce-homotopic-maps` |
  | RD.4 | `RD.4/mw-comparison-for-affine-curves` |
  | RD.5 | `RD.5/finiteness-for-affine-curves-constant-coefficients` |
  | RD.6 | `RD.6/weights-of-h1-of-affine-curve`, through the Gysin sequence and purity, so RD.6 does not depend on RD.7 |

  The dimension formula 2g + d − 1 is its own node, with one gap.
- **PadicHodgeTheory R06.3.** `RD.2/logarithmic-form-of-local-monodromy` and the comparison node
  `RD.2/berger-form-of-local-monodromy`. This settles the decomposition's third gap up to the
  identifications that P7 and PG.0 own, which are requested.
- **WeilConjectures WC.6.** `RD.7/weil-factor-export`: equality in Q[T], and integrality of each factor
  separately from the alternating product.

## Main findings (source issues)

The 67 issues are numbered `E1`–`E67`. The ones that matter most:

- **Kedlaya, Weil II, §4.3 (E13).** The Dwork isocrystal's Frobenius has the wrong sign: exp(πx − πx^q)
  is not horizontal for ∇e = πe dx. The correct Frobenius is exp(πx^q − πx), which PARI confirms to
  order 298.
- **Kedlaya, Weil II, other items.**
  - The functional equation §6.6(b) lacks q^{−n} and is false for P¹ as printed (E63).
  - The explicit formula for the Fourier automorphism ρ is misprinted (E58).
  - Two proof steps are only asserted (E61, E64).
- **Kedlaya, Finiteness.**
  - The v5 → v6 corrections (§§7.5, 8.3–8.5, 9.3), identified by diffing the two versions.
  - The author's errata-page items.
  - New items:
    - Proposition 9.1.2 needs pure dimension (E41);
    - the dimension remark after Proposition 6.2.10 needs geometric irreducibility (E40);
    - Remark 4.3.5 prints the forget-supports map as an isomorphism (E30).
- **Van der Put, (7.4).** The claim that the Frobenius eigenvalues lie in W(F_q) fails for supersingular
  curves: T² + 7 for y² = x³ − x over F_7 is irreducible over Q_7 (E54).
- **Kedlaya, Full faithfulness.** p appears where q is meant, and there are k/K slips. The Davis–Schneider
  erratum is recorded as known (E20).
- **Kedlaya, point counting.** Lemma 3 is known to be wrong; the correction is taken from Harvey's public
  paper. There are also new misprints in the reduction to a_1…a_g.
- **Berthelot, Mém. SMF 23, p. 19.** "propre sur K" should read "propre sur k" (E22). Three parts found this
  independently; it is recorded once.

## How the packet was produced

Four authoring passes ran in parallel:
- **A:** RD.0–1;
- **B:** RD.2–3;
- **C:** RD.4–5;
- **D:** RD.6–7.

They shared a fixed list of interface ids for the objects each consumes from another. I merged the four
parts and made these changes at the merge.

**Overlapping nodes merged.** Six overlapping nodes, each written by two parts, became three:
- **Finite étale pushforward.** B's RD.3 node and C's RD.4 node became `RD.3/finite-etale-pushforward-of-isocrystals`.
  Its API is the union in B's namespace, with the Lean comments renamed to match.
- **The Monsky–Washnitzer realisation.** B's RD.3 comparison and C's RD.4 theorem became
  `RD.3/affine-smooth-description-of-overconvergent-f-isocrystals`, with C's more precise statement. C's
  definition of (σ,∇)-modules over dagger algebras moved with it to RD.3, so that no RD.3 node depends on
  RD.4.
- **Étale covers of affine space.** B's RD.3 lemma and C's RD.5 theorem became
  `RD.3/etale-cover-of-affine-space`. C had read Kedlaya's arXiv:math/0303382, which closed B's gap.

**Duplicate dropped.** C's RD.5 copy of the finite étale form of local monodromy was dropped for
`RD.2/local-monodromy-finite-etale-form`.

**Three RD.6 slugs renamed** to avoid clashes with RD.4/RD.5 ids of other lemmas: tate-twist,
horizontal-sections-descend and robba-matrix-factorisation.

**Stage-level citations replaced.** D had cited the stages RD.5 and RD.2 where it did not know C's node
ids. These became C's node ids:
- the étale-cover lemma;
- the generic pushforward theorem;
- the Leray sequence;
- relative duality;
- Crew's curve duality;
- the relative Robba ring;
- the special-versus-generic Newton polygon.

**Interface statements tightened to what D consumes.**
- The excision sequence is Frobenius-equivariant in every map, the connecting maps included.
- Poincaré duality reads ⟨Φa, Φb⟩ = q^d⟨a, b⟩ into K(−d), compatible with the excision sequences.

**Errata and sources consolidated.**
- Duplicate source issues across parts were merged: the Dwork sign, the Berthelot misprint and one
  point-counting errata item.
- Two of A's issues are marked as known from Kedlaya's errata lists, which B had read.
- The two ids for Kedlaya's local-monodromy overview were unified.

**Gaps removed.**
- D's "consumed interfaces" gap was resolved by the merge.
- B's "published versions not accessible" is a sourcing note, not missing mathematics; it moved to
  coverage.

**Restructure merged.** A's and B's restructure entries on where the slope filtration theorem lives were
combined.

## What remains

Every stage is `partial`. The coverage entries list what remains for each layer; the main items are
below.

- **RD.0–RD.1.**
  - Arabia's proofs behind the Frobenius-lift nodes.
  - Katz's cyclic vector algorithm: the node rests on Magid's Picard–Vessiot argument.
  - A public proof of the overconvergence of Dwork's splitting function (numerical evidence only).
  - Kedlaya–Xiao's break decomposition, and Kedlaya's key calculation (Lemma 4.12) beyond its first step.
  - Christol–Mebkhout index theory and Irr = Swan, which are not planned.
- **RD.2.** Tsuzuki's unit-root theorem is imported with a gap. The algebraic closedness of the completed
  algebraic closure of k((t)) in characteristic p has no read source.
- **RD.3.** The following rest on Berthelot's unpublished preprints and Le Stum: the proofs of the weak and
  strong fibration theorems, the gluing for independence of the frame, the stack property, and Theorems
  A/B for j†O. Also missing are Tsuzuki's finite étale pushforward and Abe's counterexample.
- **RD.4–RD.5.** Missing inputs:
  - Berthelot's boundary study behind his Théorèmes 1 and 4, and the automatic convergence of the Taylor
    isomorphism;
  - Tsuzuki's Gysin (1999) and hypercovering descent (2003);
  - Berthelot's *Finitude* and *Dualité*;
  - the lattice-index step of dim H¹ = 2g + d − 1;
  - the functional analysis inside Crew and Schneider.
- **RD.6–RD.7.** Missing inputs:
  - the Étesse–Le Stum trace formula details;
  - nuclear operator theory, requested from LocallyAnalyticDistributions L4;
  - Tsuzuki's rank-one finiteness;
  - the Grothendieck–Ogg–Shafarevich inputs;
  - Tannakian reconstruction, requested from MotivesAndAlgebraicCycles MC.6;
  - Berthelot's crystalline comparison beyond its outline;
  - Katz–Messing.

**Requests (28).**

| supplier | count |
| --- | --- |
| AdicSpacesPartII F1 | 4 |
| AdicSpacesPartII R2 | 2 |
| AdicSpacesPartII R3 | 2 |
| PadicHodgeTheory P7 annulus foundations | 2 |
| CrystallineCohomology CR.3 | 2 |
| SchemeAndStackFoundations SF.0 | 1 |
| PhiGammaModulesAndIwasawaCohomology PG.0 | 1 |
| AdicCoefficientsAndComparisons L2 (Nagata) | 1 |
| AdicCoefficientsAndComparisons L5 (alterations) | 1 |
| WeilConjectures WC.1 | 1 |
| WeilConjectures WC.3 | 1 |
| DeligneWeightsAndPurity DWP.0 | 1 |
| DeligneWeightsAndPurity DWP.2 | 1 |
| DeligneWeightsAndPurity DWP.4 | 1 |
| DeligneWeightsAndPurity DWP.7 | 1 |
| CrystallineCohomology CR.2 | 1 |
| LocallyAnalyticDistributions L4 | 1 |
| MotivesAndAlgebraicCycles MC.6 | 1 |
| ArithmeticGaloisRepresentations R01.3 | 1 |
| Tau Ceti AlgebraicCurves layer 9 (Kähler versus Weil differentials) | 1 |
| Tau Ceti ReductiveGroups layer 2 (Lie algebras) | 1 |

Each request names the exact statement needed and the nodes that need it.

**Restructuring proposals (23).** The main ones:
- **Ownership:**
  - the Laurent-series rings go to P7, and RD.0 keeps their structure theory;
  - F1 owns dagger algebras and the overconvergent de Rham complex;
  - weights of numbers go to DWP.0;
  - the weight-separated identification of the factors P_i goes to WC.3.
- **Placement:**
  - the slope filtration theorem stays in RD.2, and the RD.1 stage text should be updated;
  - absolute local monodromy is RD.2 and relative local monodromy is RD.5.
- **Overlaps with other roadmaps:** VB0 (Dieudonné–Manin conventions), PG.2, CR.3 and R34.5/DWP.5.
- **Missing or unclear owners:**
  - nonarchimedean locally convex duality has no owner;
  - de Jong's alterations need an owner.
- **Sub-layers for the atlas:** RD.1 (differential modules / Frobenius modules), RD.5 and RD.6 (trace
  formula / Fourier transform / weights).
- **Residues and primitives on annuli (proposal 7).** Part B asked for a foundational owner. Since then
  the ColemanIntegration packet (merged in pull request 2914) has planned them at
  `ColemanIntegration:L0/annulus-residue` and `L0/annulus-log-primitive`. RD.2 could cite those nodes:
  Coleman L0 depends on no RD layer, so this creates no cycle. The reviewer should decide.

## Numerical checks

All were run in PARI/GP 2.17.4; the roadmap document lists them in full.
- **Exponentials:**
  - exp(πx) has radius 1;
  - Dwork's splitting function satisfies coefficient bounds consistent with overconvergence;
  - the Dwork module has generic radius ρ², highest break 1 and Swan conductor 1;
  - Dwork's θ₃(1) and the character sum;
  - the corrected Dwork Frobenius is horizontal.
- **Newton polygons:** the slopes {0, 1} and {1/2, 1/2}, generic versus special.
- **Convergent but not overconvergent:** the extension on A¹ satisfies σ*ω − ω = −dt through degree p⁶.
- **Curves:**
  - Monsky–Washnitzer characteristic polynomials of Legendre curves;
  - affine point counts for nine primes;
  - Künneth and trace bookkeeping;
  - the dual-twist products;
  - T² + 7 over Q_7;
  - ordinary and supersingular slopes over F_5, F_7, F_11, F_13 and F_49;
  - a genus-2 Frobenius polynomial recovered at precision N₁ = 3;
  - the Weyl-algebra normal ordering.

## Sources

All sources were read from public copies on 25 September 2026. The packet has the URLs, the full hashes
and the sections read.

| id | edition | SHA-256 |
| --- | --- | --- |
| kedlaya-monodromy-2003 | arXiv:math/0110124v4 (Ann. of Math. 160 (2004)) | `f38f45d4…` |
| kedlaya-monodromy-annals | Ann. of Math. 160 (2004), version of record | `983760b7…` |
| kedlaya-slope-filtrations | arXiv:math/0504204v4 (Doc. Math. 10 (2005)) | `da801016…` |
| kedlaya-slope-filtrations-errata | author's errata list | `732b023d…` |
| kedlaya-local-monodromy-overview | arXiv:math/0501361v2 (with the author's errata file) | `31d9e39e…` |
| kedlaya-isocrystals | arXiv:1606.01321v6 | `7fa7ab31…` |
| kedlaya-full-faithfulness | arXiv:math/0110125v4 | `cfda26e7…` |
| kedlaya-finiteness | arXiv:math/0208027v6 (v5 `f7a60e94…` compared) | `a4668e61…` |
| kedlaya-finiteness-errata | author's errata page | `0d7931c4…` |
| kedlaya-weil-ii | arXiv:math/0210149v3 | `b678f13c…` |
| kedlaya-mw-counting | arXiv:math/0105031v2 (errata `87b70cbc…`) | `88e18397…` |
| kedlaya-etale-covers | arXiv:math/0303382v3 | `23ac7240…` |
| kedlaya-swan-conductors-1 | arXiv:math/0611835v3 | `d0e2c76c…` |
| kedlaya-xiao-polyannuli | arXiv:0804.1495v4 | `18645e0d…` |
| harvey-kedlaya-larger-characteristic | arXiv:math/0610973v2 | `947c3a79…` |
| berthelot-msmf23 | Mém. SMF 23 (1986) 7–32, numdam | `dcbbfffe…` |
| vanderput-mw | Mém. SMF 23 (1986) 33–59, numdam | `a5195632…` |
| crew-finiteness-curves | Ann. Sci. ÉNS 31 (1998) 717–763, numdam | `52e2391a…` |
| chiarellotto-tsuzuki-descent | Rend. Sem. Mat. Univ. Padova 109 (2003), numdam | `f332fdec…` |
| christol-dwork-1994 | Ann. Inst. Fourier 44 (1994), Centre Mersenne | `3028f5d5…` |
| arabia-relevements | Comment. Math. Helv. 76 (2001), EMS Press | `ca1b510d…` |
| magid-cyclic-vector | arXiv:2212.04643v2 | `927410ca…` |
| andre-hasse-arf | arXiv:math/0203248v1 | `e1d5cd3a…` |
| berger-padic-differential-2002 | arXiv:math/0102179v3 | `142e7948…` |

**Not accessible, and never cited as read:**
- Berthelot's *Finitude et pureté* and his Rennes preprints (the author's page is gone and IRMAR is behind
  a bot wall);
- Le Stum's and Kedlaya's books;
- Tsuzuki's papers;
- Étesse–Le Stum;
- Katz–Messing;
- the published Documenta version of *Slope filtrations revisited* and its erratum.
