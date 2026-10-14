# REV-ClassicalArithmeticCompletion--CA.7

Independent review of `BP-ClassicalArithmeticCompletion--CA.7`, the CA.7 continuation packet written by Codex,
session `codex-ruGjB5` (issue #9671, pull request #9716). Done by Claude, session `claude-UDH4gC`, issue
[#9680](https://github.com/CBirkbeck/tauceti-explorer/issues/9680), on 2026-10-14. This session wrote no part of the
plan under review and did not review its parent.

**Verdict: accepted, with corrections made in place.** The packet, its reader and its suggested Lean file were
corrected. Most of the mathematics is right, and the boundaries the planning worker recorded are honest. The review
made four kinds of substantive correction.

- **Duplication with lower-tier accepted plans.** Five targets restated what GeometryOfNumbersAndQuadraticArithmetic
  GN.2 and IntegralHeckeAndGaloisDeterminants IHG.0 already plan. Three were removed and two now import those plans.
- **A closure gap in the general-group determinant theorems.** The Q_p-ℓ-elementary case of Chinburg–Pappas–Taylor
  was missing. It is now a new target with its own boundary.
- **Boundaries.** One boundary was closed from pinned Mathlib and one was resolved by a review decision. One was
  narrowed, one broadened, and one added.
- **Checks, API and locators.** Two copied API and check blocks and a non-discriminating check were fixed. Source
  locators were corrected in 26 targets, and three citations that pointed at the wrong passage were replaced.

The `review` object in the packet records a verdict and a note for each of the 69 targets, for the 3 removed targets
and for all 55 inherited contracts.

## What the packet contains

The accepted parent `ClassicalArithmeticCompletion.json` left CA.7 `partial`. It recorded three source-access gaps, a
K₀ obligation and a 49-target review frontier. The continuation has three parts.

- **New targets.** It added 71 targets for four areas: finite-projective K₀ interfaces, semisimple rank-one
  representatives with Eichler cancellation, and the determinant proof of the Fröhlich–Taylor theorem.
- **Inherited targets.** It retained the 55 inherited target IDs in `inheritedTargetContracts`.
- **The review frontier.** It answered every frontier obligation in a 49-entry `reviewFrontierAudit` ledger, with
  eight boundaries.

## Method

- **Sources.** All fourteen public sources were fetched afresh, and every checksum matches the packet. Ullom 1969 was
  fetched as well. Every locator of every target was read on the page:
  - Fröhlich 1975, Fröhlich 1976 and Taylor 1981 are image-only scans, read page by page (F75 pp.112–124; F76
    pp.384–399, 401–413 and 427–436; T81 pp.41–54, 57–66 and 75–79);
  - Platonov–Rapinchuk–Rapinchuk was read in place in the maintainer-cleared copy (§1.4.1, p.29; §1.4.3, p.33;
    Theorem 1.34, p.43; Proposition 2.37, p.101);
  - the other sources were read from their text layers, except Conrad’s Stickelberger paper, whose fonts do not
    extract and which was read as images.
- **Baseline.** All 25 declarations were read in the pinned trees (Mathlib 082e2d3, Tau Ceti f790474). Each exists and
  provides what its citing targets use. SplitK0 needs zero morphisms, binary biproducts and essential smallness;
  `finiteProjectiveModules` supplies all three in `CartanMap.lean`.
- **Supplier contracts.** The fifteen Tau Ceti layers the packet imports were read in the current roadmap checkout.
  A Sonnet helper produced a per-claim location table, and every doubtful claim was then read by the reviewer.
- **Duplication.** The sweep covered every TauCetiRoadmap README and every atlas packet, searching for the notions this
  continuation plans: reduced norm, Steinitz class, locally free class group, Jacobinski, Eichler, group logarithm,
  Stickelberger, Hasse–Davenport and Hom description.
- **Closure.** Every proof sketch was checked against its prerequisites. Each numerical claim was recomputed:
  - the K₀ examples, the Gaussian-integer and ℤ[√−5] checks, and the reduced-norm checks;
  - the Stickelberger base case;
  - the Hasse–Davenport product relation, numerically over F_q for q = 3, 4, 5, 7, 8, 9, 11, 13, 25 and 27, for every
    n dividing q−1 and every χ (relative error below 10⁻¹²).
- **Reader.** A renderer reproduces the committed reader byte for byte from the committed packet, for all 71 new and
  all 55 retained target sections. After the edits the affected sections were re-rendered from the corrected packet,
  and the renderer was run again with zero mismatches.
- **Checks.** `check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. The source issues
  pass `check_errata.py`. `lean-check` elaborates the suggested file before and after the edits, with admitted-proof
  warnings only (22 before, 20 after; 188 lines before, 181 after). `check_sorry_data.py` passes.

## Counts

| Item | Before | After | Notes |
| --- | ---: | ---: | --- |
| New targets | 71 | 69 | 34 verified, 34 corrected, 1 added; 3 removed as duplicates of GN.2 |
| Inherited contracts / ledger | 55 / 49 | 55 / 49 | 42 verified, 13 corrected (suppliers re-pointed, boundaries updated) |
| API items / checks | 94 / 88 | 89 / 84 | the removed Steinitz-class target carried 5 and 4 |
| Planets | 6 | 5 | “Steinitz decomposition” left with its target |
| Baseline declarations | 25 | 29 | all 25 confirmed; 4 added for the completion adapter |
| Boundaries (gaps) | 8 | 7 | G-COMPLETION and G-GENERALIDEAL removed; G-ELLELEMENTARY added |
| Requests (existing-roadmap contracts) | 15 | 15 | need texts rewritten to what each layer states |
| Source issues | 1 | 3 | E901 renumbered E1701 and confirmed; E1702, E1703 new |
| Sources | 15 | 16 | Ullom 1969 added |

Coverage stays **planned** and the packet status stays **complete**. Every target of CA.7 is a node of the parent or of
this packet. Every chain ends in the pins, an accepted lower-tier node (GN.2, IHG.0, AA.4), an imported Tau Ceti layer
or one of seven named boundaries.

## Substantive corrections

### Duplication with lower-tier plans (PROTOCOL §15)

GeometryOfNumbersAndQuadraticArithmetic and IntegralHeckeAndGaloisDeterminants are tier 3 in
`upstream/CaraianiNewton.md`; ClassicalArithmeticCompletion is tier 5. Their plans are accepted.

| Target | Correction | Reason |
| --- | --- | --- |
| `dedekind-projective-steinitz`, `finite-dedekind-torsionfree-projective`, `steinitz-class` | Removed. Consumers (`dedekind-k0-comparison`, `residue-trace-filtration`, `nonprincipal-ideal-witness`, the ledger entries for `trace-modulo-a-prime` and `projective-of-tame`) now cite `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-pseudobasis` and `…/lattice-steinitz-class`. | GN.2 plans the decomposition M≅R^{n−1}⊕𝔞, projectivity of lattices, and the Steinitz class with its classification and product API. |
| `steinitz-ideal-product` | Kept as a corollary of GN.2’s classification (both sides have rank two and class [IJ]); the direct construction is retained as an alternative. | GN.2 does not state the identity, but it follows at once. |
| `reduced-norm` | The component reduced norm is now IHG.0’s Azumaya reduced-norm determinant (`IntegralHeckeAndGaloisDeterminants:IHG.0/azumaya-determinant`). CA.7 keeps the semisimple product, the completions and the ideles. | IHG.0 plans the reduced norm of an Azumaya algebra of rank d², with the split, rank-one and quaternion checks. |
| `reduced-characteristic-polynomial` | Now IHG.0’s characteristic polynomial of a determinant law, applied to the reduced norm (`…/IHG.0/characteristic-polynomial`). | Same owner. |

The ownership audit gains a `lowerTierPlans` record, and the KTheoryLowDegrees rescope proposal now points at GN.2 for
the Steinitz class.

### Closure: the Q_p-ℓ-elementary case

The fixed-point theorem of Chinburg–Pappas–Taylor (Theorem 1.5, p.4) and their matrix-versus-unit theorem
(Theorem 1.2(b), p.3) for an arbitrary finite group are proved in two halves.

- **The p-elementary half.** Q_p-p-elementary subgroups are handled through crossed products (Theorems 6.2 and 6.4).
  The prime-to-p multiplier induction then gives only prime-to-p order for the fixed-point quotient (Theorem 6.5).
- **The ℓ-elementary half.** Q_p-ℓ-elementary subgroups with ℓ≠p are handled separately (Theorems 6.6–6.7, pp.34–35).
  This half rests on Fröhlich’s congruence (Proposition 6.9, citing Fröhlich’s book, Theorem 15A) and on the split
  maximal order Z_p[G/C] (Proposition 6.10, citing Reiner, Theorems 41.1 and 41.7).

The packet’s `determinant-fixed-point` and `general-group-determinant-stability` used only the first half. The review
made three changes.

- **New target.** It added `ell-elementary-determinant-descent` (CPT Theorem 6.6) as a prerequisite of both, with the
  new boundary G-ELLELEMENTARY for the two book inputs.
- **Rewritten proofs.** The proofs of both targets now follow CPT pp.33–36.
- **Taylor’s q-elementary step.** In the same spirit, `gauss-determinant` now includes Taylor’s ℚ-q-elementary step
  (T81 §6, Propositions 5.3 and 6.1). That step goes through his Propositions 3.7–3.8 and 3.10(v), so the target is
  added to G-FTCONGRUENCE and G-LOCALBRAUER.

### Boundaries

- **G-COMPLETION, removed.** Pinned Mathlib supplies everything the adapter needs:
  - the algebra structure of a Dedekind domain on `v.adicCompletionIntegers` (AdicValuation.lean:900) and its
    torsion-freeness (:965);
  - flatness of torsion-free modules over a Dedekind domain (`IsDedekindDomain.flat_iff_torsion_eq_bot` and the
    instance after it, Flat/TorsionFree.lean:138, 143);
  - `ValuationSubring.isLocalRing` and `Module.FaithfullyFlat.of_flat_of_isLocalHom`.

  The proof of `dedekind-completion-detection` is complete with these four new baseline declarations. The boundary
  named only the formalisation work that this target itself plans.
- **G-GENERALIDEAL, resolved by review decision.** The handoff asked the reviewer to decide whether the inherited
  rank-one contract may be restricted to arithmetic orders. **Approved.**
  - The contract covers `locally-free-class-represented-by-rank-one` and the `exists_classOf_eq` API item of
    `locally-free-class-group`.
  - It is restricted to O_F-orders in finite-dimensional semisimple F-algebras, F a number field.
  - Fröhlich 1975 (p.113) develops the idelic method only for rings of algebraic integers and says so. Johnston §15.1
    and Reiner work over global fields. Every consumer (ℤ[G], O_F[G]) is arithmetic.
  - The parent packet is not edited here. Assembly must apply the restriction to the accepted node’s statement and
    hypotheses (see the questions below).
- **G-DH, narrowed.** The ratio R of the two sides of the Hasse–Davenport product relation is unconditionally a root of
  unity, by Stickelberger valuations, absolute values and Kronecker’s theorem. For odd p, ζ_p↦ζ_p^b multiplies both
  sides by the same character value (`gaussSum_mulShift_eq`), so R lies in ℚ(ζ_(q−1)). The roots of unity there have
  order prime to p, so the leading-residue comparison forces R=1. Only the sign for p=2 remains open, since −1≡1
  modulo 2.
- **G-DH, off Taylor’s chain.** Taylor uses the relation only up to roots of unity (T81 p.64, inside a logarithm), so
  `gauss-log-image` now uses the weak form. G-DH no longer reaches the Fröhlich–Taylor equality or the three Taylor
  corollaries.
- **G-LOCALBRAUER, broadened.** Besides CPT’s prime-to-p multiplier form (Theorem 5.4, p.28, not p.29), the plan uses
  the integral Witt–Berman identity over K-elementary subgroups for K = Q_p (CPT p.35) and K = ℚ (T81 §5). It also
  uses Taylor’s multiplier form over ℚ-ℓ-elementary subgroups. InductionRestriction Layer 6 has Brauer induction over
  ℂ only.
- **G-FTCONGRUENCE, reworded.** Taylor’s Propositions 3.6–3.7 (p.47) cite Theorem 5(ii)–(iii) of Fröhlich–Taylor 1980.
  Branch Ia (p.66) argues as in its §5.1.
- **G-ELLELEMENTARY, added** (see above).

The ledger and the contracts were updated to match.

- **Completion targets.** G-COMPLETION was dropped from `locally-free-lattice`, `locally-free-lattice-is-projective`,
  `sublattice-eq-of-completions`, `locally-free-of-tame`, `noether-theorem` and
  `associated-order-eq-group-ring-iff-tame`.
- **Class-group targets.** G-GENERALIDEAL was dropped from `locally-free-class-group` and
  `locally-free-class-represented-by-rank-one`, whose responses record the review decision.
- **The three Taylor corollaries.** They lose G-DH and gain G-ELLELEMENTARY.

### Checks and API

| Target | Correction |
| --- | --- |
| `extension-k0-map`, `restriction-k0-map` | The composition and free API items and two checks were one text copied into both targets, each speaking of both maps. Each target now states its own map. The new extension non-example is the augmentation ℤ[C₂]→ℤ, where [ℤ[C₂]]↦[ℤ], not 2[ℤ]. |
| `reduced-norm` | Check 4 compared Nrd(i)=1 with the regular determinant of left multiplication by i, which is also 1. It now uses 1+i, where the values are 2 and 4. |
| `stable-equivalence` | API names now `StableEquivalent.*`, matching the suggested file. |
| `finite-gauss-product` | The proof is split into a weak form, needing no input, and an exact form; `gaussSum_mul_gaussSum_eq_card` is cited for the absolute values. |

### Sources

Locators were corrected in 26 targets. The main ones:

- F75: Theorem 1 has parts (i) and (ii), not (a) and (b); §5A–B is on p.120; §5C is stated on p.120.
- J68: Theorem 4.1 and Lemma 4.2 are on pp.15–16, not pp.17–19.
- CPT: there is no (5.2)–(5.6), no Theorem 5.5 and no §6c. The character action is Proposition 5.2 with formula (5.1),
  p.27; the fixed-point theorems are 6.4–6.7, pp.32–35.
- T81: Theorem 3 is stated on p.49 and proved in §§5–10; §11 has no Theorem 5; §3 starts on p.46; the Corollary has no
  part (c).
- F76: Theorem 6 is on pp.396–399; Theorem 8 is in §6, p.404; W′ is (9.1), p.412.
- Johnston: Theorem 10.7, not Proposition; Example 5.6, not Corollary; Proposition 6.1 starts on p.10.
- Weibel: 2.4, pp.10–11, for Hom descent; Proposition 2.6 and Corollary 2.6.3 are on p.11.

Three citations pointed at passages that do not contain the cited result, and were replaced.

- **Projective norm.** For `projective-group-norm-surjectivity`, Johnston §15.1 treats class groups and Martinet §I
  treats K₀. The target now cites Johnston Proposition 6.1 and Corollary 6.2, and Ullom Proposition 1.3 and
  Corollary 1.4 (p.156).
- **Reduced characteristic polynomial.** PRR §1.4.1 states the reduced norm only, so the target now cites Kneser §5.4,
  p.67.
- **Flat Hom descent.** Weibel I pp.6–8 contains no Hom descent, so `finite-order-flat-hom` now cites Weibel 2.4,
  pp.10–11.

Two citations were added. Taylor (3.4), p.46, pins the additive character of the local Gauss sum, which Fröhlich 1976
leaves unspecified. Jacobinski’s proof of Lemma 4.2 supports semilocal elimination.

### Source issues (PROTOCOL §18)

- **E901 → `ClassicalArithmeticCompletion/E1701`, confirmed.** CPT Corollary 3.3, p.13, concludes L(1+x)=1 where the
  additive value 0 is meant, as its proof shows. The finding’s ID collided with CA.3’s E901 (CA.3 uses E900–E903), so
  it follows the CA.n → E1n0x pattern.
- **`ClassicalArithmeticCompletion/E1702`, new and confirmed.** CPT p.19 sends the reader to an appendix in Section 6;
  the appendix is Section 7 (p.36).
- **`ClassicalArithmeticCompletion/E1703`, new and confirmed.** The last sentence of the proof of CPT Theorem 3.4(b)
  (p.14) concludes L(1+I²)⊆I², while the argument and the statement give pI².

All three affect nothing. arXiv lists only v1.

### Supplier contracts

The anchors of all fifteen imported Tau Ceti layers exist. Several `need` texts claimed more than the layer states, so
each was rewritten to say what the layer supplies and what CA.7 proves itself.

- **SemisimpleAlgebras Layer 6.** It has no étale-embedding criterion and no descent statement. The criterion is
  proved inside `prescribed-separable-polynomial`; its module-dimension argument is complete, while Kneser only
  sketches the corresponding Lemma b.
- **ClassFieldTheory Layers 5 and 7.** Layer 5 has no maximal-subfield embedding. Layer 7 has no Gauss-sum convention.
- **CharacterTheory Layers 3, 4 and 7.**
  - Layer 3 has no Adams operation or determinant evaluation.
  - Layer 4 covers only the action of Gal(ℚ(ζ_e)/ℚ).
  - Layer 7 has no odd-order exclusion and no real Wedderburn test.
- **NumberFieldArithmetic Layers 4 and 5.**
  - Layer 5 has no lattice patching and no integral bases. It does have the integral semilocal decomposition.
  - The index–discriminant square formula is in Layer 3, and only over ℤ.
- **ReductiveGroups Layer 6.** It does not state inner-form descent. Simple connectedness is geometric, so it passes to
  SL_1(C).
- **LocalFieldsRamification Layers 2 and 3.** Layer 2 has no residue normal basis and no Nakayama step. Layer 3’s
  Hensel step is Layer 1’s.

The accepted lower-tier node `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem` was read, and it matches the
use in `eichler-noncompact-adapter`.

### Points checked and found sound

- **Hom description and kernel group.**
  - The S-place presentation of the kernel group in `positive-unit-kernel` matches T81 (2.1), p.44. Its denominator is
    Hom⁺ into the units of the algebraic integers.
  - The positivity convention at complex places is F76 Appendix II, p.430.
  - The representative u = Det(A)·W′·τ⁻¹ of `froehlich-kernel-membership` is T81 p.45 and F76 (9.4), p.413.
  - The adjusted Gauss sum τ* equals −1 on unramified characters, by direct computation from T81 (3.4) and (3.9), as
    stated on p.49.
- **The node’s own replacements for unread inputs.**
  - Taylor’s §11 step (11.5), p.77, cites Fröhlich–Taylor 1980 Theorem 4. The node replaces it by F76 Theorems 4
    and 6, and the replacement is sound.
  - The Frobenius-lift hypothesis of CPT holds for the unramified coefficient rings to which the descent is applied.
    The tame inertia step uses the norm argument of T81 §12.
- **The order-ideles and cancellation chain.** Fröhlich’s Theorem 1(ii) needs no Eichler hypothesis. The rank-one
  representative via norm matching avoids the maximal-order step of F75 §5E. Jacobinski cancellation follows from the
  fibre description (F75 §3 V–VI) and strong approximation.

## Questions for the orchestrator

1. **Rank-one restriction at assembly.** The review decision restricts the inherited rank-one contract to arithmetic
   orders. The assembly job should restrict two statements in the parent packet’s CA.7 nodes:
   `locally-free-class-represented-by-rank-one`, and the `exists_classOf_eq` item of `locally-free-class-group`. Use
   O_F-orders in semisimple F-algebras with F a number field. This review could not edit the parent packet.
2. **Pointers for higher-tier roadmaps.** Three higher-tier atlas plans should import rather than plan:
   - NoncommutativeAndEquivariantIwasawa NE.3 constructs reduced norms, which belong to IHG.0;
   - its NE.6 plans the Oliver–Taylor integral logarithm, which CA.7’s `integral-group-log` now owns;
   - KTheoryLowDegrees Z.1 and Z.4 should cite GN.2 for the Steinitz class.
3. **Books to buy.** Three proof boundaries need books that are neither cleared nor freely available:
   - Fröhlich, *Galois Module Structure of Algebraic Integers* (Theorem 15A, for G-ELLELEMENTARY);
   - Reiner, *Maximal Orders* (Theorems 41.1 and 41.7);
   - Serre, *Linear Representations of Finite Groups* (§12.6, for G-LOCALBRAUER).

   Fröhlich–Taylor 1980 (Phil. Trans. A 295, DOI 10.1098/rsta.1980.0242) remains the source G-FTCONGRUENCE needs.
4. **The roadmap checkout.** `~/tauceti-roadmap-env/TauCetiRoadmap` is not on TauCetiRoadmap main; it is checked out on
   the branch `roadmap/integral-hecke-and-galois-determinants`. AdelicAlgebraicGroups and
   IntegralHeckeAndGaloisDeterminants are therefore open pull requests (#792, #789), not merged roadmaps. The packet
   cites them only as lower-tier atlas plans, which is correct either way.
5. **Planets.** The continuation now has five planets. The combined six-planet palette proposed in the packet’s
   restructure records still needs the manager’s decision at assembly.
