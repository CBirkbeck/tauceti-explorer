# Independent package review: q-Hodge filtrations and Habiro cohomology

Verdict: **needs_changes**. Issue #7931, job
`REV-PKG-HabiroCohomologyFoundations~2`; reviewer
`independent-review-REV-PKG-HabiroCohomologyFoundations~2`;
Codex, session `codex-dPRVDj`; 2026-10-10. I wrote neither package revision.
This is a completed independent review, not a checkpoint.

The revision repairs the three findings in the preceding review. The reader
preserves the accepted plan, and the suggested file elaborates. Acceptance is
withheld because other supplier records still permit data for which their
unconditional assertions are false, and ordinary categorical cokernels and
kernels replace derived cofibres and fibres. Four standalone countermodel
files elaborate without admitted proofs. These findings concern statements,
not the proofs that the prototype intentionally leaves as `sorry`.

## The six required checks

| Requirement | Result | Evidence |
| --- | --- | --- |
| Upstream form and size | Pass | Mathematical introduction, supplier boundaries, conventions, sources, layers, targets, API and examples. Compared with the current AlgebraicVectorBundles and AnalyticToricGeometry readers and the ClassFieldTheory form. README is 166,142 UTF-8 bytes, below 200 KB. |
| Reader fidelity | Pass | All 151 input targets, their hypotheses and prerequisites are represented. API and test inventories contain 266 and 153 entries respectively. The scope distinctions below are retained. |
| Own words and source locators | Pass after editorial correction | Statements are organized around constructions and comparisons, with theorem/paragraph, section and printed page locators. Fixed public versions were inspected at the relevant results. A twelve-word text comparison found only a bibliography author/title match. Removed a short quoted source phrase from a Lean comment. |
| Reader contains no process | Pass after correction | Replaced two sentences about prerequisites, acceptance and planning obligations by mathematical statements. No packet names, job identifiers, checkpoints or review/coverage statuses remain in README. Removed references to the preceding review from Lean example comments. |
| Suggested Lean | **Fail on mathematical fidelity; pass on elaboration** | Final `lean-check` exits 0: 452 warnings, all `declaration uses sorry`; no errors or other warnings. R4–R8 below remain. |
| Metadata | Pass | The file is exactly `topic = "math.AG"` followed by a newline. Algebraic geometry fits these cohomology constructions. |

## Inputs, coverage and mathematical boundaries

The accepted inputs are the four files under `research/blueprint/packets/`:

| Packet | Targets | API items | Tests |
| --- | ---: | ---: | ---: |
| HabiroCohomologyFoundations--HQ.1.json | 122 | 212 | 129 |
| HabiroCohomologyFoundations--HQ.1-2.json | 7 | 21 | 11 |
| HabiroCohomologyFoundations--HQ.3.json | 3 | 16 | 7 |
| HabiroCohomologyFoundations--HQ.8.json | 19 | 17 | 6 |
| Total | 151 | 266 | 153 |

The 151 reader target headings split as follows: HQ.1 28, HQ.2 11, HQ.3 27,
HQ.4 31, HQ.5 25, HQ.5-trace 5, HQ.6 3, HQ.7 2 and HQ.8 19. I read every
input statement, hypothesis list and prerequisite list, the whole reader and
the whole suggested file. Renamed headings were matched by their statements;
the target correspondence is bijective. API/test names were checked against
the inventories, including declarations inside namespaces and the precise
omission inventories. Presence of a name does not establish signature fidelity,
which is why item 5 fails despite this coverage.

The reader correctly distinguishes the following:

- The global complex needs torsion-freeness at every prime; perfect coverage
  enters the chosen-filtration theory. Only the base carries Adams operations
  in global smooth/étale descent.
- Derived q-de Rham differs from the underived complex on global smooth
  inputs. Rationalisation, p-completion, inversion and parameter completion
  occur in the stated order. Filtered quotients place the parameter in
  filtration degree one.
- The framed complex completed at q−1 and the uncompleted framed complex over
  the relative Habiro ring are distinct constructions. The comparison of the
  latter with cohomological descent remains a named gap.
- Chosen-filtration base change is in the finite-projective range. Twisted
  base change retains the missing relative-Frobenius/Nygaard and filtered
  décalage exchange interfaces. The factorial-tower construction is
  conditional on those interfaces; it is not reported as proved.
- Smooth existence inverts primes up to the relative dimension. The truncated
  construction itself has no dimension bound. Multiplication and higher arity
  coherence require the separate arity bounds; the smooth domain is not
  declared symmetric monoidal. The partial simplicial construction and its
  failure of composition are retained.
- Quasi-regular existence retains p-torsion-freeness, the precise cotangent
  amplitude and relative semiperfectness. Higher powers and the spherical
  E₁-lift case remain separate, including the restrictions at p=2. A ku lift
  alone is not substituted for a spherical lift.
- Algebraic scheme cohomology is over ℤ with small primes inverted. Smooth
  proper perfectness uses the Habiro completion of the localised coefficient
  ring and keeps its unproved source status.
- The analytic comparison is an open problem. The eight comparison squares
  use the intersections of their input classes. Canonical θ/de Rham and
  Witt/crystalline map equalities remain separate unproved targets. No
  inverse of the ordinary-to-q-de-Rham-Witt map is manufactured.

The supplier boundaries agree with the reviewed library audit and RS-10's
interim ownership: HR.4 supplies degree-zero q-Witt rings, HQ.4 retains
positive-degree constructions until their transfer, and HQ.3 owns the framed
descent application. Trace comparisons do not define the prismatic Nygaard
filtration. The finite-étale export has late arithmetic consumers rather than
late arithmetic prerequisites. Precise omissions for enhanced étale descent,
derived modified connections, perfectoid calculations and canonical
specialisation compatibility are appropriate under PROTOCOL §13.

I checked the current upstream Suggested files in all nine newer areas named
by WORKERS.md and the four Completed Suggested files (ContourIntegration,
EffectiveBounds, OrthogonalL2Bases and RestrictedProducts), and searched the
current Tau Ceti library for the relevant constructions. No existing Habiro/q-Hodge/q-de-Rham-Witt implementation was
found to duplicate. The library's naive cotangent and ordinary Witt/adic
interfaces do not supply the full derived constructions required here.
Current read-only upstream commit:
`37769f03c170a7bc3e1082df70522a0ad59c5ffd`; current Tau Ceti library:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Earlier findings: repaired

R1's false no-go statement about arbitrary module families has been replaced
by a precise omission recording one common derived complete object, all its
derived reductions, and the projection-induced unrescaled Frobenii. This
matches QW Theorem 5.1 (§5, p.78).

R2's arbitrary perfectoid generators and arbitrary Frobenius have been
removed. The omission inventory fixes the actual perfectoid quotient,
q-divided-power generators and relative Frobenius. The ordinary principal-ideal
preimage helper is a valid separate statement. See QH Paragraph 3.20 and the
proof of Proposition 3.22 (§3.4, pp.32–38).

R3's static model now uses the power-series comparison target, the
coefficient-defined combined filtration, q↦1+h, the constant-coefficient
square, and the reduction/filtration laws. The earlier q=2/vanishing-Hodge
countermodel is excluded. Unavailable geometric examples and base change are
precisely omitted. Free δ-ring records now include evaluation, δ-compatibility
and uniqueness; the generator nonvanishing proof and evaluation examples
exercise this property. Cotangent Tor uses named full-cotangent and derived
tensor constructions with the native derived homology functor, rather than an
arbitrary module-valued family. No implementation of that missing full
cotangent construction is claimed. See QH §4.2, especially Construction 4.21
and Lemmas 4.26–4.27 (pp.62–65).

## Required signature revisions

### R4: the envelope and no-go witness records do not specify their inputs

Locations: `Suggested.lean`, `QPDEnvelope` at line 504,
`envelopeComparison`/`envelopeComparison_q` at lines 586/592, and
`WitnessData`/`witness_no_qHodgeFiltration` at lines 4064/4079.

The envelope record stores four arbitrary commutative rings, maps from P, a
PD structure, a parameter, a δ-structure and invertibility/regularity data.
It does not specify the smooth presentation, universal PD/q-PD envelopes,
flat parameter algebra or the actual rationalisation and completion.
Docstrings mentioning these relationships do not impose them.

A valid record has p=2; P=D=qD=qDQ=ℚ; J and the PD ideal zero; all maps
identities; q=1; and δ(x)=(x−x²)/2. The divided powers are the native trivial
PD structure. Multiplication by 2 is injective, the δ-operation remains in
qD, and 2=[2]₁ is a unit. This even has prime p and δ(q)=0.

For this record, `envelopeComparison_q` would make a unital ring map send
1 to 1+X. Taking the coefficient of X gives 0=1 in ℚ[1/2]. The standalone
countermodel constructs the complete record and proves that no such ring map
exists, without using `envelopeComparison` or an admitted theorem.

The same record exposes the no-go witness defect: take x=0, the identity
reduction and y=0. Its divided power is zero, so the reduction hypothesis
holds; zero belongs to `(x,q−1)^p`, contrary to the first conjunct of
`witness_no_qHodgeFiltration`. `WitnessData` contains neither the free perfect
δ-ring quotient nor a relation identifying its R with the stored envelope.

Required repair: use the actual PR.6/CR.0 universal envelope constructions,
the presentation and their completed realisations, or record the exact
omitted signatures. The witness must be the specified free perfect δ-ring
quotient with its distinguished generator and its identified q-de Rham/PD
models. Do not repair this by adding only primality, δ(q)=0 or an unexplained
field asserting the desired comparison or obstruction. The same supplier
audit should cover `PCompleteFramedComplex`: p-adic completeness and arbitrary
chosen operators alone do not identify completion of the framed operators.

Sources: QH Lemma A.4 and its envelope construction (§A.1, p.70), Lemmas A.5–A.6
and Remark A.7 (§A.1, pp.71–73); Lemma 3.3 (§3.1, p.22) and Example 4.24
(§4.2, pp.63–64). The envelope comparison uses the universal-property and base-change
input of BS Lemma 16.10, not just the elementary δ-ring laws.

### R5: arbitrary categories erase concrete distinctions

Locations: `QDeRhamContext`, lines 745–810;
`qOmega_ne_prod_pCompletions`, line 1053; the analogous concrete/nonconservative
claims using `HodgeContext`, `QWittContext`, `CohomologyData`,
`HabiroSheafData` and `AnalyticHabiroData`.

All four ambient categories of `QDeRhamContext` may be `Discrete PUnit`.
Take every endofunctor to be the identity, every other functor to be the
unique functor, every object to be the sole object, and every transformation
or comparison to be the unique one. The animation fields also hold:
the identity preserves sifted colimits and any two functors into this
category are naturally isomorphic. Thus the universal extension law currently
written in the record does not exclude this model.

The model has an isomorphism between `K.one` and the product of its local
values. This directly contradicts the second conjunct of
`qOmega_ne_prod_pCompletions`. Its intended assertion distinguishes
ℤ[[h]] from the product of ℤ_p[[h]]; neither is specified by the current
abstract data. The complete constructor and the product isomorphism compiled
without `sorry`.

Related consumer problems have the same cause. For example,
`AnalyticHabiroData.bcAn` may be the identity, while
`analyticComparisonProblem.lossy` asserts it does not reflect isomorphisms.
Arbitrary stored analytic objects do not justify an unconditional small-prime
non-isomorphism, either. An arbitrary homology functor is not automatically
cohomology of the named underlying complex.

Required repair: bind concrete examples, negative assertions and homology
calculations to the actual named animated/derived module categories and
constructions. Generic conditional transport/composition lemmas may remain
generic when their hypotheses contain the necessary imported identifications;
they must not be used to assert numerical, torsion or non-isomorphism facts
about arbitrary models. If the actual categories cannot yet be expressed,
preserve these exact targets as omissions. Supplying more positive comparison
isomorphisms in a terminal category cannot restore the missing distinction.

Sources: QH Construction A.12 and Theorem A.1 (§A.2, pp.75–76; Appendix A,
pp.69–70), Remark 3.6 (§3.1, p.22), Paragraph 1.17 (§1.3, p.8).

### R6: categorical cokernels and kernels are not derived cofibres and fibres

Locations: `FilZ.gr` (line 1474), `FilN.gr` (1489),
`FilN.cofibTower_obj` (1495), `quotBy` (1506),
`filQuotient.piece` and `filQuotient.eq_mod_beta` (1739/1751),
`qWittDR_nygaard_cofibre` and `twistedQOmega_nygaard_fibre` (3630/3662).

The comments specify derived cofibres, but the definitions and conclusion
types use ordinary `cokernel` or `kernel` under finite-limit/colimit
hypotheses. These hypotheses hold in an ordinary module category, where the
substitution loses precisely the derived torsion correction required by the
reader. Adding shifts to later expressions does not restore a missing fibre.

Take M=ℤ/2 in `ModuleCat ℤ`. Multiplication by 2 is zero, and the current
`quotBy 2 M` is its ordinary cokernel, isomorphic to M. Placed in degree zero,
it has zero homology in degree −1. The standalone Lean check proves these
claims using the exact `quotBy` definition and native cokernel/single-complex
lemmas. The actual derived quotient is the cone of the zero map M→M: its
two nonzero terms have zero differential, so H⁻¹=H⁰=M. This last cone
calculation is the mathematical comparison; the standalone check formalises
the ordinary output and its vanishing H⁻¹, not a full derived-cone comparison.

The existing `derivedQuotient_zmod` test proves only that p acts by zero
and that ℤ/p is nontrivial. It never inspects the output of `quotBy` or either
homology degree, so it does not detect this error.

Required repair: use genuine mapping cones/fibres and their derived-category
or enhanced realisations, including the coherent constructions needed for
functorial filtered objects. Mathlib already has cochain-complex mapping cones
and derived homology; these can support appropriate native portions. Where
the enhanced functor is unavailable, use exact omissions rather than ordinary
categorical cokernels. Audit the dependent graded pieces, completion towers,
filtered quotients, conjugate filtration and Nygaard sequences together.
Ordinary ideal preimages in the explicitly static quasi-regular construction
are legitimate and are not the subject of this finding.

Sources: QH Convention 1.22(a)–(b) (§1.4, pp.10–11), Convention 3.1 (§3.1,
p.20), Corollary 3.25 and Lemma 3.27 (§3.4, pp.34–36). These require stable
cofibres/fibres and the filtered degree-one quotient.

### R7: the degree-zero q-Witt supplier admits the zero ring

Locations: `QWittRings`, lines 2251–2285, and `qWittOmega.ofBase`, line 2834.

Set A=R=ℤ, take every `W m` and every ghost target to be `ZMod 1`, use
the polynomial algebra structure induced by evaluation at 1, use identity
Frobenius/ghost maps, zero Verschiebung and the constant-one multiplicative
Teichmüller map. Every algebraic law in the record holds by subsingleton
elimination, including joint ghost injectivity. This is allowed for a genuine
Λ-structure on ℤ, not just for a malformed base.

At m=1 the base test asserts an algebra equivalence between this zero ring
and ℤ[X]/(X−1). Evaluation at 1 maps the latter to ℤ, hence its zero and one
are distinct. The standalone check constructs all fields of the exact record
and proves the asserted equivalence cannot exist, without admitted proofs.

The ghost targets' names do not identify them with
`R ⊗_{A,ψ^d} A[X]/Φ_d(X)`. Likewise the F/V laws do not identify the family
with HR.4's relative q-Witt rings. Initiality of the positive-degree system
over an arbitrary supplied family cannot repair its degree-zero input.

Required repair: import the actual relative q-Witt construction and its
universal property from HR.4, with actual ghost targets and compatible maps.
Alternatively precisely omit statements whose degree-zero supplier is not
available. A separate assumption `Nontrivial (W m)` only excludes this one
countermodel and does not specify the construction or its relationship to R.

Sources: QW Lemma 2.41 and Definition 2.42 (§2.5, p.30), Paragraph 2.44
(§2.5, p.31); the smooth-case identification in Proposition 4.2 (§4, p.54).

### R8: the framed equivalence accepts an arbitrary comparison map

Location: `framed_equiv`, lines 5149–5160; reader target
“Framed and fixed-point descriptions of the canonical filtration”.

Its argument φ is any map from the truncated canonical filtration to the
restriction of the coordinate filtration. Its only further map condition is
that completion of the target is an isomorphism. It concludes that the
adjoint/completed lift of φ is an isomorphism, without requiring φ to be the
canonical pullback comparison or to reduce to the identity on the Hodge
filtration. This is stronger than the reader and the source. In the intended
linear category one can choose φ=0; its lift is zero, which is not an
isomorphism for the nonzero framed base object.

Required repair: define the canonical truncated comparison from the common
pullback square and lift that map, or explicitly require its defining
compatibility (in particular the stated identity after reduction) and the
completeness needed for detection. If those data cannot be typed, precisely
omit this target. This item is a direct signature/source comparison and the
zero-map argument in the intended linear model; no standalone full
`HodgeContext`/`TruncationModules` countermodel was compiled for it.

Source: QH Remark 4.4 (§4.1, p.55), using Construction 4.3 and Lemma 4.6
(§4.1, pp.54–56). The common pullback determines the map; its reduction is
the identity, which is the reason that this map is invertible.

## Corrections and validation

I made only clear editorial corrections: two process sentences in README,
two short source-wording comments, and references to the previous review in
Lean example comments. Mathematical target statements and the previous
revision's repairs are retained. R4–R8 need actual supplier constructions or
precise omissions, with downstream signatures reviewed together; adding the
conclusions as arbitrary fields would hide the same defects.

Validation performed:

- `python3 scripts/check_blueprint.py <packet> --json` on each of the four
  inputs: exit 0, zero errors and zero warnings in all four.
- Full `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`
  at the pins: exit 0, 452 `sorry` warnings only.
- Four standalone countermodel checks, each with exit 0 and no errors,
  warnings or `sorry`. They copy the supplier record definitions exactly
  and do not call an admitted package theorem. Reproduction material follows.
- Checked the exact metadata bytes, reader size, target/API/test inventories,
  supplier ownership, reader process text and public-source text overlap.

Pinned elaboration baseline: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The package imports Mathlib only.
No Lake project, cache download, build or language server was started.

## Public source versions

Accessed 2026-10-10. Page references above are printed pages, not viewer offsets.
These are the fetched source files; inspection concerned the relevant named
results, not a claim to have read every source cover to cover. No source files
or passages are included in the repository.

| Key | Public version | SHA-256 |
| --- | --- | --- |
| QH | [Wagner, q-Hodge complexes over the Habiro ring, v2](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| QW | [Wagner, q-Witt vectors and q-Hodge complexes, v5](https://arxiv.org/pdf/2410.23078v5) | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| KU | [Meyer–Wagner, ku source, v1](https://arxiv.org/pdf/2510.06057v1) | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| TC | [Meyer–Wagner, trace source, v4](https://arxiv.org/pdf/2410.23115v4) | `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4` |
| BS | [Bhatt–Scholze, Prisms and prismatic cohomology, v4](https://arxiv.org/pdf/1905.08229v4) | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| BMS1 | [Bhatt–Morrow–Scholze, Integral p-adic Hodge theory, v3](https://arxiv.org/pdf/1602.03148v3) | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| BMS2 | [Bhatt–Morrow–Scholze, Integral p-adic Hodge theory and topological Hochschild homology, v2](https://arxiv.org/pdf/1802.03261v2) | `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038` |
| Sch | [Scholze, Canonical q-deformations in arithmetic geometry, v1](https://arxiv.org/pdf/1606.01796v1) | `ce060b41e28fef16c011d3d3455c53a8bdc11cd8c98dc4dc6c2be178e1567273` |
| DAG8 | [Lurie, Derived Algebraic Geometry VIII](https://www.math.ias.edu/~lurie/papers/DAG-VIII.pdf) | `c9f1b4bb3fab1624c2c5d97e0c1701352912fc0ffda752e8345ab11bb70e0523` |

## Countermodel reproduction

The code below is original review evidence. For an isolated check, use the
package's Mathlib imports, `Mathlib.Tactic` where tactics occur, a
`noncomputable section`, and the indicated exact definitions extracted from
Suggested.lean into the same namespace as the snippets. Do not include the
package's admitted comparison declarations. Open `CategoryTheory`,
`CategoryTheory.Limits` and `Polynomial` as needed. The four resulting files
were checked with `lean-check`; each has no admitted declaration.

### R4: rational envelope

Extract `DeltaStructure`, `DeltaStructure.frob`, `qInt`, `QPDEnvelope` and its instance attributes. The final two examples also check the zero-element obstruction used by `WitnessData`.

```lean
def rationalDelta : DeltaStructure 2 ℚ where
  δ x := (x - x^2) / 2
  δ_zero := by norm_num
  δ_one := by norm_num
  δ_add x y := by
    have hI : Finset.Ioo 0 2 = {1} := by decide
    rw [hI]
    norm_num
    ring
  δ_mul x y := by ring

def rationalEnvelope : QPDEnvelope.{0} 2 where
  P := ℚ
  J := ⊥
  D := ℚ
  toD := RingHom.id ℚ
  pdIdeal := ⊥
  dividedPowers := dividedPowersBot ℚ
  map_J_le := by simp
  qD := ℚ
  toqD := RingHom.id ℚ
  q := 1
  pTorsionFree := by
    intro x y h
    change (2 : ℚ) * x = 2 * y at h
    linarith
  qDQ := ℚ
  ofqD := RingHom.id ℚ
  ofqD_injective := Function.injective_id
  delta := rationalDelta
  delta_ofqD x := ⟨rationalDelta.δ x, rfl⟩
  p_isUnit := isUnit_iff_ne_zero.mpr (by norm_num)
  qInt_isUnit := isUnit_iff_ne_zero.mpr (by norm_num [qInt])

-- The record admits p=2 prime and even δ(q)=0.
example : Nat.Prime 2 := by decide
example : rationalEnvelope.delta.δ (rationalEnvelope.ofqD rationalEnvelope.q) = 0 := by
  change rationalDelta.δ (1 : ℚ) = 0
  exact rationalDelta.δ_one

-- No ring homomorphism can satisfy envelopeComparison_q for this record.
theorem envelopeComparison_q_impossible
    (f : rationalEnvelope.qDQ →+* PowerSeries (Localization.Away (2 : rationalEnvelope.D))) :
    f (rationalEnvelope.ofqD rationalEnvelope.q) ≠ 1 + PowerSeries.X := by
  intro h
  change f 1 = 1 + PowerSeries.X at h
  rw [map_one] at h
  have h1 := congrArg (PowerSeries.coeff 1) h
  let g : Localization.Away (2 : rationalEnvelope.D) →+* ℚ :=
    IsLocalization.Away.lift (2 : rationalEnvelope.D)
      (g := RingHom.id ℚ) (by change IsUnit (2 : ℚ); norm_num)
  have h01 : g 0 = g 1 := congrArg g (by simpa using h1)
  norm_num at h01

-- The algebraic obstruction in WitnessData also fails at its permitted x=0.
example : rationalEnvelope.dividedPowers.dpow 2 (rationalEnvelope.toD 0) = 0 := by
  simp [rationalEnvelope, dividedPowersBot]
  rfl

example : rationalEnvelope.ofqD (0 : rationalEnvelope.qD) ∈
    Ideal.span {rationalEnvelope.ofqD (rationalEnvelope.toqD (0 : rationalEnvelope.P)),
      rationalEnvelope.ofqD rationalEnvelope.q - 1} ^ (2 : ℕ) := by
  exact Ideal.zero_mem _
```

### R5: terminal ambient categories

Extract `LambdaRing`, the `SmoothAlg`/`PolyAlg` definitions and helpers through `PolyAlg.of`, and `QDeRhamContext`. Also import `Mathlib.CategoryTheory.PUnit` and `Mathlib.CategoryTheory.Limits.Unit`.

```lean
abbrev T := Discrete PUnit

def terminalContext (Λ : LambdaRing ℤ) : QDeRhamContext ℤ Λ T T T T where
  ofStatic := Functor.star _
  animate _ := 𝟭 T
  animate_restrict _ := Functor.punitExt _ _
  animate_sifted _ _ := inferInstance
  animate_unique _ _ _ _ := ⟨Functor.punitExt _ _⟩
  one := default
  oneE := default
  staticE := Functor.star _
  pComplete _ := 𝟭 T
  pCompleteUnit _ := 𝟙 _
  rat := 𝟭 T
  ratUnit := 𝟙 _
  pRat _ := 𝟭 T
  ratToPRat _ := 𝟙 _
  modQ := 𝟭 T
  powerSeries := 𝟭 T
  powerSeries_modQ := Functor.punitExt _ _
  ratE := 𝟭 T
  ratEUnit := 𝟙 _
  rat_modQ := Functor.punitExt _ _
  pCompleteE _ := 𝟭 T
  pCompleteEUnit _ := 𝟙 _
  pRatE _ := 𝟭 T
  ratEToPRatE _ := 𝟙 _
  pRat_modQ _ := Functor.punitExt _ _
  underlying := 𝟭 T
  pCompleteMod _ := 𝟭 T
  koszul _ := default
  dR := 𝟭 T
  deRham := Functor.star _
  dR_poly := Functor.punitExt _ _
  toDeRham := (Functor.punitExt _ _).hom
  pDeRham_smooth _ := Functor.punitExt _ _
  localQOmega _ := Functor.star _
  prismaticTwist _ := Functor.star _
  prismaticComparison _ := Functor.punitExt _ _
  localQOmega_modQ _ := Functor.punitExt _ _

-- Contradicts exactly the second conjunct of qOmega_ne_prod_pCompletions.
theorem terminal_has_product_iso (Λ : LambdaRing ℤ) :
    Nonempty ((terminalContext Λ).one ≅
      ∏ᶜ fun p : Nat.Primes => ((terminalContext Λ).localQOmega p).obj (SmoothAlg.of ℤ)) :=
  ⟨eqToIso (Subsingleton.elim _ _)⟩
```

### R6: ordinary quotient loses a degree

This is a complete standalone file. Its `quotBy` is exactly the package definition.

```lean
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Data.ZMod.Basic
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.Algebra.Homology.SingleHomology
import Mathlib.Tactic
open CategoryTheory CategoryTheory.Limits
noncomputable section

def quotBy {𝒞 : Type*} [Category 𝒞] [Preadditive 𝒞] [HasFiniteColimits 𝒞]
    {R : Type*} [Semiring R] [Linear R 𝒞] (f : R) (M : 𝒞) : 𝒞 :=
  cokernel (f • 𝟙 M)

abbrev M := ModuleCat.of ℤ (ZMod 2)

theorem p_mul_zero (p : ℕ) [Fact p.Prime] :
    (p : ℤ) • (𝟙 (ModuleCat.of ℤ (ZMod p))) = 0 := by
  apply ModuleCat.hom_ext
  change ((p : ℤ) • LinearMap.id : ZMod p →ₗ[ℤ] ZMod p) = 0
  ext x
  simp

theorem ordinary_quotient_one_degree : Nonempty (quotBy (2 : ℤ) M ≅ M) := by
  unfold quotBy
  have := cokernel.π_of_zero (p_mul_zero 2)
  exact ⟨(asIso (cokernel.π ((2 : ℤ) • 𝟙 M))).symm⟩

-- Placing the returned module in degree zero has zero homology in degree -1.
theorem shadow_negative_homology :
    IsZero (((HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 0).obj
      (quotBy (2 : ℤ) M)).homology (-1)) :=
  HomologicalComplex.isZero_single_obj_homology _ _ _ _ (by decide)
```

### R7: zero degree-zero and ghost rings

Extract `LambdaRing`, `qInt`, `QWittRings` and its instance attributes. The constructor works for any supplied Λ-structure on ℤ.

```lean
instance zeroRingPolyAlgebra : Algebra ℤ[X] (ZMod 1) :=
  (Polynomial.eval₂RingHom (Int.castRingHom (ZMod 1)) 1).toAlgebra

def zeroQW (Λ : LambdaRing ℤ) : QWittRings ℤ Λ ℤ where
  W _ := ZMod 1
  qPow_sub_one _ := Subsingleton.elim _ _
  frobenius _ := AlgHom.id _ _
  verschiebung _ := 0
  teichmuller _ := 1
  frobenius_verschiebung _ _ := Subsingleton.elim _ _
  verschiebung_frobenius _ _ := Subsingleton.elim _ _
  verschiebung_mul_frobenius _ _ _ := Subsingleton.elim _ _
  frobenius_teichmuller _ _ := Subsingleton.elim _ _
  ghostTarget _ := ZMod 1
  ghost _ := AlgHom.id _ _
  ghost_injective _ _ _ _ _ := Subsingleton.elim _ _

theorem zeroQW_not_base (Λ : LambdaRing ℤ) :
    ¬ Nonempty ((zeroQW Λ).W 1 ≃ₐ[ℤ[X]]
      (ℤ[X] ⧸ Ideal.span { (X : ℤ[X]) ^ (1 : ℕ) - 1 })) := by
  rintro ⟨e⟩
  let g : (ℤ[X] ⧸ Ideal.span { (X : ℤ[X]) ^ (1 : ℕ) - 1 }) →+* ℤ :=
    Ideal.Quotient.lift _ (Polynomial.evalRingHom 1) (by
      change Ideal.span { (X : ℤ[X]) ^ (1 : ℕ) - 1 } ≤ RingHom.ker (Polynomial.evalRingHom 1)
      rw [Ideal.span_le]
      intro x hx
      rcases Set.mem_singleton_iff.mp hx with rfl
      simp)
  have h01 : (0 : ℤ[X] ⧸ Ideal.span { (X : ℤ[X]) ^ (1 : ℕ) - 1 }) = 1 :=
    e.symm.injective (by change (_ : ZMod 1) = _; exact Subsingleton.elim _ _)
  have h := congrArg g h01
  norm_num at h
```
