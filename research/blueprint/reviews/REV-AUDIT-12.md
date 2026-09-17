# Review of AUDIT-12

**Job** REV-AUDIT-12 · **Date** 2026-09-17 · **Verdict `accepted`** · **7 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the single roadmap of `research/blueprint/audit/AUDIT-12.json`, `tauceti:TauCetiRoadmap/ModularCurves`
(Katz–Mazur). That is 58 layers, 290 targets, 323 declaration citations naming 213 distinct
declarations, and 104 duplicate claims.

This is an accurate audit. Every claim I re-tested held, and the corrections below are refinements
rather than repairs: one target whose contract is only half proved, two notes that credited Mathlib
with a definition it does not have, and five duplicates the audit had not found. Nothing needed to be
re-searched from scratch, and no verdict changed.

## What was checked

**Mechanical.**
- All 58 batch layers appear in the result; no extras, no omissions.
- Every one of the 213 distinct citations resolves at its stated library, file and line in the pinned
  baseline. Nothing cited is `private`, an axiom, or a bare structure field.
- `grep -c sorry` is `0` in all 213 cited files.
- Nine citations name anonymous instances whose Lean-generated names `declarations.tsv` does not
  carry: the four in `Sites/Fpqc.lean`, plus `LocalFlatDescent`, `FlatDescent`, `Normalization` (the
  smooth-base-change instance), `ProjectiveSpectrum/Proper` and `AdjoinRoot.powerBasis'`. The source
  lines are exactly the declarations described, so the citations are sound; the audit already says it
  confirmed the generated names with Lean.
- The 104 duplicate ids are all live atlas stages. None belongs to the one retired roadmap
  (`FoundationsAndLibraryIntegration`), and none is self-referential.
- Layer verdicts agree with their targets, and with their sub-layers: 37 not built, 21 partly built.
  Every "partly built" layer has at least one present and one missing target; every "not built" layer
  has none present. No layer is bookkeeping rather than mathematics, so no `built` or `process`
  verdict arises.

**Presence claims (33).** Each was re-derived from the source, including the file's `variable` lines
and the declaration's instance hypotheses. Spot checks that mattered:
`exists_variableChange_of_j_eq` carries `[IsSepClosed F]` and `[IsElliptic]`, so it is genuinely more
general than the algebraically closed statement 9E asks for; `isLocallyConstant_finrank` inherits
`[Flat f] [IsFinite f]` from line 142 and adds `[LocallyOfFinitePresentation f]`, which a finite étale
morphism satisfies; `ext_of_isDominant_of_isSeparated` needs `[IsReduced X]`, which 2A's integral
scheme has; `Algebra.IsInvariant A B G` means every `G`-fixed point of `B` is in the image of `A`, so
`isIntegral` does cover `A = B^G`; the Weierstrass preparation and division theorems carry
`[IsLocalRing A] [IsAdicComplete (maximalIdeal A) A]`, matching 8C's complete local ring;
`emultiplicity_choose_prime_pow` gives `n − v_p(k)`, which is `1` at `k = p^{n−1}`, exactly 7G's
binomial fact. One of the 33 was downgraded (below).

**Absence and partial claims (176 + 81).** I re-searched every absent claim by concept and by Mathlib
naming convention, over `declarations.tsv` and both Lean trees, and read the hits in context: effective
Cartier divisors, relative ampleness, Weil restriction and Hom/Isom schemes, norms of line bundles,
the Picard functor, Poincaré bundles, biextensions and seesaw, the Weil pairing, dual isogenies,
Drinfeld and naive level structures, moduli problems over `Ell`, coarse moduli spaces, Tate normal
form and Legendre form, Tate curves, `p`-divisible groups, Serre–Tate theory, Verschiebung,
formal-group height and Lazard, supersingular and ordinary, strict henselisation, excellent rings,
Cohen–Macaulay theory and miracle flatness, regular schemes, Fitting ideals and flattening strata,
Hopf–Galois extensions and torsors, scheme quotients by finite groups, Hurwitz's genus formula and
Hilbert's different formula, GAGA and analytification, prorepresentable deformation functors.
Not one of them turned up.

Four searches that could plausibly have overturned a claim, and did not:
- `Verschiebung` has 35 hits in `declarations.tsv`; all 35 are `WittVector.*`, none is the
  group-scheme Verschiebung 7E asks for.
- Mathlib's Galois-category library has exactly one `PreGaloisCategory` instance,
  `Action FintypeCat G`. Finite étale `K`-algebras are not shown to form one and `Aut` of the fibre
  functor is not identified with `Gal(Kˢ/K)`, so 0D's equivalence really is only the separably closed
  case.
- `Mathlib/AlgebraicGeometry/Group/Abelian.lean` contains only commutativity of a proper
  geometrically integral group scheme. There is no rigidity statement "a pointed morphism is a
  homomorphism", so 2D's KM 2.5.1 is absent even over a field.
- `ProjectiveSpectrum/Functor.lean` is functoriality of `Proj` under graded ring maps, not a functor
  of points, so 1B's claim that Mathlib has no functor of points of `ℙⁿ` stands.

Three of the audit's own findings are worth repeating because they correct the roadmap rather than
the libraries, and I confirmed all three:
- **`deg [N] = N²` is already exported.** The roadmap pins `EllipticCurvesInterface.mulByIsogeny`
  and `degree_mulByIsogeny` as not yet supplied; at this pin Tau Ceti proves
  `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` for an elliptic Weierstrass curve over any field
  and any `n ≠ 0`, inseparable case included, with the kernel identified as the `n`-torsion.
- **`ker_baseChange_of_noZeroSMulDivisors_coker` does not exist.** The 9E text names it as if it
  were a known lemma; there is no such declaration in either library, and only the two ingredients
  the audit cites.
- **5C's "no roadmap owns these statements" is out of date.** `ModularCurvesPartII:R12.4` says
  "Discharge PR81 §5C as three named statements" and lists them; `ComplexComparisonPartII:C4` says it
  exports affine-curve algebraic-versus-analytic connectedness "as required by PR81 §5C".

## Corrections

1. **5C, contract (i) — `tauceti` → `partial`** (and the same target as listed under Layer 5).
   `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` proves that a connected
   algebra over an algebraically closed field stays connected after any field extension: the
   direction ℚ̄ ⇒ ℂ. The contract is an *insensitivity* statement, and the direction the roadmap
   uses is ℂ ⇒ ℚ̄, which neither library states. The audit's own note says so, then records the
   target as present. It follows in two steps from
   `PrimeSpectrum.comap_surjective_of_faithfullyFlat`, but an unstated two-step argument is what
   "partial" means everywhere else in this audit — 0C's module-finiteness of `A` over `A^G`, a
   three-step composition of Mathlib lemmas, is marked partial. Both layers stay "partly built"
   on their remaining Mathlib target.

2. **8A, "projective (hence proper) plus quasi-finite implies finite" — note corrected** (and the
   same target under Layer 8). The library value stays `mathlib`: `IsFinite.of_isProper_of_locallyQuasiFinite`
   is the substance and is more general. But the note said "projective morphisms are proper" as
   though Mathlib supplied it. There is no projective-morphism property in Mathlib at this pin —
   `AlgebraicGeometry/Morphisms/` has no `IsProjective` — and the only properness of a projective
   object is the instance for `Proj 𝒜 ⟶ Spec 𝒜₀` with `𝒜` of finite type. The projectivity carrier
   comes from 0G and Layer 6, both absent.

3. **Five duplicates added.**
   - `ModularCurvesPartII:R13.1` to Layer 1 and to 1A: "Prove descent and compatibility with the
     elliptic-scheme object of #81 on the smooth locus" — the same carrier from the
     generalised-elliptic side.
   - `ShimuraVarieties:V8` to 5B: it proves `Sh_{K(N)}(GL₂,ℌ^±) ≃ Y_full(N)_ℚ` for `N ≥ 3`,
     identifies the determinant morphism with the Weil-pairing morphism, identifies the fibre over a
     primitive `ζ` with `Y(N,ζ)`, and reconciles this roadmap's row-basis convention with the adelic
     one.
   - `ModularCurvesPartII:R12.2` to 5B: the analytic classification of full, Γ₁ and Γ₀ level
     structures with the ordered-basis determinant identified with the chosen root of unity.
   - `tauceti:TauCetiRoadmap/EllipticCurves` layer 4 to Layer 10: it owns the Tate curve with its
     coefficients as explicit `q`-series over `ℤ⟦q⟧` and the uniformisation `L^× / q^ℤ ≅ E_q(L)`,
     and says in terms that the scheme packaging belongs to a scheme-facing roadmap — the
     equation-level half of Layer 10's formal-cusp package.

## What I did not change

- The audit's habit of citing "related" declarations under an `absent` target (2F's degree and trace,
  0C's affine quotient, 8D's cyclicity locus) is consistent throughout and reads correctly: the cited
  declarations are distant inputs, not close analogues, and `partial` would overstate them.
- The parent layers (Layer 0, Layer 1, …) restate their sub-blocks' text in full. The audit
  summarises each in one target per sub-block and defers with "Details under 0A", which keeps the two
  levels consistent without duplicating the evidence. That is the right treatment and I left it.
- Target extraction is faithful. Checking 0E bullet by bullet, all nine of its listed effective-descent
  objects plus both spreading-out clauses appear among its seven targets.
