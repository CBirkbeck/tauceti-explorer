# Review of AUDIT-11

**Job** REV-AUDIT-11 · **Date** 2026-09-17 · **Verdict `accepted`** · **7 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the four roadmaps of `research/blueprint/audit/AUDIT-11.json` — ShimuraVarieties,
SmallRamificationAndAbelianVarietyBaseCases, BelyiMaps and EllipticCurves. That is 43 layers,
290 targets, 461 declaration citations after correction (423 distinct declarations in 230 files)
and 70 duplicate claims.

This is an unusually accurate audit. Every layer verdict holds, every presence claim holds, every
duplicate holds, and not a single citation is wrong — no misplaced line, no private declaration, no
`sorry`. The corrections are all in one place: four absence notes claimed that something does not
exist which does, and three more entries were missing the citations a reader would want.

## What was checked

**Mechanical.**
- All 43 batch layers are present, with no extras.
- Every citation resolves in `declarations.tsv` at the stated library, file and line, and the
  declaration's short name occurs at that line in the pinned source. 442 citations before my
  corrections, 461 after; none failed.
- Nothing cited is `private`, an `axiom` or a bare structure field. `private` declarations do appear
  in the index with the modifier in their signature, so this is a real check, not a vacuous one.
- Every one of the 230 cited files was scanned for `sorry`. Three tokens occur, all in prose:
  two in `EllipticCurve/Affine/Point/FrobeniusFixed.lean` (a note that the *upstream* description of
  the result as a stub is stale) and one in `Isogeny/Frobenius/Basic.lean` (a note that the
  roadmap's `Suggested.lean` states the result with `sorry` while this file proves it). No cited
  proof contains one.

**Verdicts.** All 43 agree with their targets' statuses: 27 not built, 15 partly built, and the one
`process` layer. That verdict — BelyiMaps Layer 14, LMFDB assertion semantics — is confirmed by the
layer's own header: *"Owner: successor roadmap `BelyiArithmeticActions`. Retained here as a
dependency specification; no milestone of this layer is a declaration or a completion claim of this
PR."* The two status changes below do not move any verdict, both being within the missing column.

**Presence claims.** All 48 targets marked `tauceti`, `mathlib` or `both` were read at source, with
their `variable` lines and hypotheses. All hold. The ones most worth naming, because a reader would
doubt them:
- `WeierstrassCurve.Affine.fg_point_of_numberField` really is Mordell–Weil over a number field, with
  the class-number and Dirichlet inputs discharged, not assumed.
- `TauCeti.Isogeny.degree_oneSubFrobeniusIsogeny_eq_pointCount` really is deg(1 − π_q) = #E(𝔽_q),
  against `WeierstrassCurve.pointCount`.
- `MDifferentiable.exists_eq_const_of_compactSpace` is stated for any compact preconnected complex
  manifold and normed target, so the audit's "more general" fit is right.
- `IsCoveringMap.monodromyPerm` is the monodromy homomorphism with no `ᵐᵒᵖ`, as claimed.
- Tau Ceti's canonical height is `(1/2)·lim h(2ⁿP)/4ⁿ`, and its own docstring explains why: h is the
  height of x, which has a double pole at O. The audit's "half the roadmap's normalisation" is
  exactly right, and it is right to call that target partial rather than built.

**Absences.** Every absent or partial target (242) was searched again independently: by concept, by
Mathlib naming convention, over `declarations.tsv` and over both source trees, with a
keyword sweep of each target's own wording against the index to catch names the audit might have
missed. Hits were read at source before being used. Four searches overturned a note; the rest
confirmed it. Spot confirmations worth recording, because they are the ones a wrong audit would get
wrong: no Hermitian symmetric domains, no Satake topology, no GAGA or Chow theorem, no resolution of
singularities, no Weil restriction, no quotient of a scheme by a finite group, no Tate module, no
Weil pairing or Weil reciprocity as declarations, no modular curve as a scheme, no ẑ, no free pro-p
group, no `ChartedSpace ℂ` on `OnePoint ℂ`, no pullback of covering spaces, no Odlyzko-type
discriminant bound, and no Galois representation with a ramification condition.

**Borderline calls left standing.** The audit vocabulary makes `"partial"` mean "something close
exists; say exactly what is missing", so a result whose content is in the libraries but whose
statement is not is the one judgement that recurs. Two entries sit on that line and I left both as
the audit has them, because it states its reasoning in the note either way:
- EllipticCurves Layer 3 T3 is `tauceti`, and its Δ = 0 half is a one-term composition of
  `pointCount_eq_card_point_add_one_iff` with `exists_isSingular_of_Δ_eq_zero` (over a perfect field,
  so every finite field) rather than a stated theorem.
- EllipticCurves Layer 0 T6 is `partial` for the same reason — the principal-divisor characterisation
  "follows from the additive equivalence `pointEquivDegreeZeroDivisorClass` but is not stated as a
  theorem".

The two are not labelled alike, but Layer 1 T13 shows the audit is consistent with itself in treating
an immediate consequence of a cited theorem as present, and in both cases the note says exactly what
is and is not in the library, which is what a consumer needs. Neither call moves a layer verdict.

**Duplicates.** All 70 were checked against the named layer's own description in
`research/blueprint/atlas/areas/*.json`. Every id is a live atlas stage; none is retired or
self-referential; every content claim is supported by the target's text, down to specifics such as
ModularCurves 2F's `α̂ = [tr α] − α` and `(tr α)² ≤ 4 deg α`, and 7E's PD-2 (the ordinary/supersingular
dichotomy from the connected–étale sequence) and PD-3 (`V∘F = p = F∘V`). I looked for missing
duplicates in the obvious places and found none: where a roadmap consumes another's work it says so,
and the audit correctly declines to call that a duplicate — BelyiMaps 3.2 names CharacterTheory
Layers 1, 3 and 4 as prerequisites, and 0.5 names PolynomialGaloisGroups Layer 0 for `fullCycleType`.

## Corrections

| Layer | Target | Change |
|---|---|---|
| EllipticCurves Layer 1 | pushClass / `extendedRelNormHom` | absent → **partial** |
| ShimuraVarieties V4 | Artin normalization comparison | absent → **partial** |
| ShimuraVarieties V4 | reflex norm on ideles | note corrected, 4 citations |
| ShimuraVarieties V0 | neat congruence subgroups | 2 citations |
| BelyiMaps Layer 4 | `TriangleGroup a b c` | 3 citations + note |
| BelyiMaps Layer 5 | U = ℂ∖{0,1} and its instances | note corrected, 2 citations |
| EllipticCurves Layer 4.5b | Kraus local criterion | 2 citations |

**`ClassGroup.extendedRelNormHom` exists.** The EllipticCurves Layer 1 target names three
declarations — `pushClass`, `toPointHom` and `ClassGroup.extendedRelNormHom` — and the audit says
none was found. The third is in Tau Ceti under exactly that name, at
`TauCeti/RingTheory/ClassGroup/ExtendedRelNorm.lean:98`, with its computation rule
`extendedRelNormHom_mk0`. Its module docstring names this application: *"in the intended application
they do not [map to each other] — they are the coordinate rings of the source and target of an
isogeny, and `M` is the integral closure of the target's coordinate ring in the source's function
field."* The Dedekind hypothesis its norm side needs is supplied, without separability, by
`Isogeny.isDedekindDomain_intermediateRing`. `pushClass` and `toPointHom` are indeed absent.

**Tau Ceti has algebraic tori with cocharacters.** ShimuraVarieties V4 T1 said "There are no
algebraic tori over ℚ with cocharacters, special pairs or reflex norms". The first clause is false.
`TauCeti.TorusCommHopfAlgCat k` is the category of tori over an arbitrary field — objects that split
after base change to an algebraic closure — and it carries the cocharacter lattice X_*(T), free of
finite rank, its perfect pairing with X*(T)
(`instCharacterCocharacterPairingIsPerfPair`), and the contragredient absolute-Galois representation
`cocharacterLatticeRepresentation`. What is genuinely missing is the arithmetic layer on top: special
pairs (T, h), the reflex field and the reflex norm.

**Tau Ceti has a global Artin map.** ShimuraVarieties V4 T2 said "There is no global Artin reciprocity
map for number fields. Tau Ceti has only the abstract class-formation framework of Artin–Tate."
`TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean` builds the ideal-theoretic Artin map
`artinHomAway : idealsAway S →* Gal(L/K)` for a finite abelian extension unramified outside S, with
`artinHomAway_apply_prime` giving the Frobenius outside S and `isArithFrobAt_artinElement` pinning it
to the *arithmetic* Frobenius — which is one of the two conventions this target has to compare. The
file itself records what is not there: "Nothing about the kernel, the image, or a factorization
through ray class groups is proved here." So reciprocity is absent, and the idelic map is absent, but
the map and its normalization are not. Status moved to partial.

**Mathlib has the full triangle group.** BelyiMaps 4.1 asks for the oriented (von Dyck) group
⟨x, y, z | xᵃ, yᵇ, zᶜ, z·y·x⟩, and the audit cited only bare `PresentedGroup`. Its index-two
overgroup is in Mathlib: for a 3×3 Coxeter matrix, `CoxeterMatrix.Group` is
⟨s₀, s₁, s₂ | s_i², (s_i s_j)^{m_ij}⟩ as a `PresentedGroup`, with `PresentedGroup.toGroup` for the
universal property, `reindexGroupEquiv` for permutations of the three parameters — the target's
rotation isomorphisms — and `m_ij = 0` meaning no relation, the target's parameter 0. The status
stays absent, since the group asked for is the rotation subgroup and nothing connects them, but this
is where a formalisation would start.

**One missing instance, not a missing theory.** BelyiMaps 5.1 said "no instance covers open subsets of
ℂ" for semilocal simple connectivity. Literally true, but the route is otherwise complete: Tau Ceti
derives `SemilocallySimplyConnectedSpace` from `StronglyLocallyContractibleSpace` as an *instance*,
Mathlib's `IsOpen.stronglyLocallyContractibleSpace` passes that property to open subsets, and
`Metric.contractibleSpace_ball` gives the contractible basis. The single gap is
`StronglyLocallyContractibleSpace` on a normed space, which nobody has stated.

**Two citation completions.** ShimuraVarieties V0's neatness target had no citations at all; Tau Ceti's
elliptic-point analysis (`Subgroup.isCyclic_stabilizer`, and PSL(2,ℤ) acting freely off the orbits of
i and ρ) is the GL₂ ingredient a torsion-freeness proof for Γ(N) would start from, and the target now
says so while staying absent. EllipticCurves Layer 4.5b's Kraus target now cites Mathlib's
`WeierstrassCurve.IsIntegral` and `integralModel`, the vocabulary its headline
`krausLocalCondition_iff_exists_integralModel` is stated in.

The ShimuraVarieties and EllipticCurves summaries were brought in line with the corrected entries.

## Most important finding

**The audit's absence claims are reliable, and the exceptions cluster in one place: a named
declaration the target itself asks for.** Of the four corrected notes, two overturned a claim about
an object the target names outright — `ClassGroup.extendedRelNormHom` and the Artin map — and both
were in the library, findable by grepping the target's own text against the index. The other two were
about neighbouring objects (tori with cocharacters, the Coxeter presentation) that a formalisation
would build on.

Two method notes, both cheap and both productive here:
- **Grep the target's own wording against the index before writing "not found".** A mechanical sweep
  of every absent target's identifiers against `declarations.tsv` took minutes and produced the
  `extendedRelNormHom` finding on its own.
- **Read the owning module's docstring, not just the declaration.** `ExtendedRelNorm.lean` and
  `ArtinMap.lean` both state, in prose, exactly which part of the intended theorem they do and do not
  prove. That is what makes "partial" defensible rather than a guess, and what tells a later worker
  where to start.
