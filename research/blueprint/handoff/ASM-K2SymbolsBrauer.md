# ASM-K2SymbolsBrauer — assembly handoff

Issue #242; Codex session `codex-yzeiad`; branch `codex-yzeiad-asm-k2-symbols`.
The bot confirmed claim comment 6027494023. This is the completed assembly job,
not a claim that the mathematical plans are closed or accepted.

## Deliverables and review state

- [Unified reader](../readmes/K2SymbolsBrauer.md): purpose, scope and atlas boundaries;
  common conventions and source versions; a pinned declaration inventory; ten
  sub-stage/layer sections in dependency order; all 134 nodes, 227 API items,
  143 unit tests and 28 planets. The reader uses packet-current statements,
  hypotheses, proof steps, APIs, consumers, tests and source locators rather
  than the parts’ historical revision logs. It retains all 23 recorded gaps.
- [Unified suggested forms](../suggested/K2SymbolsBrauer.lean): one standard note,
  one deduplicated block of 52 individual imports, common universes/scopes,
  and both parts’ concrete prototypes and missing-carrier contracts.
- [T.1 packet](../packets/K2SymbolsBrauer--T.1.json) and
  [T.3 packet](../packets/K2SymbolsBrauer--T.3.json): limited reconciliations below.
  The parts’ standalone reader/suggested files were not deliverables of #242
  and were not edited. Use the unified files for the reconciled specification.

Both packets remain `partial`; every implementation status remains `unchecked`.
Their `review` and `reviewHistory` objects were preserved. T.1’s latest recorded
verdict is `needs_changes` by `independent-review-REV-FIX-RT-AREA-ktheory-1`
(2026-09-30); T.3’s is `needs_changes` by
`independent-review-REV-FIX-RT-BP-K2SymbolsBrauer--T.3` (2026-10-02).
The newer ~2 fixes in the input packets do not acquire acceptance from this assembly.

## Reconciliations requiring independent review

1. **Finite-rank universality.** T.1/finite-rank-splitting’s statement had retained
   the unconditional printed consequence even though its own acceptance and
   confirmed source issue T.1 `K2SymbolsBrauer/E2` require separate centrality.
   The statement now retains splitting for n≥5 and makes finite-rank universality
   conditional on centrality of St_n(R)→E_n(R). Its source match records the
   qualification; exact to-elementary, finite-perfectness and split-central-extension
   prerequisites and a conditional consequence step supply its deduction. The source excerpt, node id, proof gap and review verdicts
   are unchanged. This is a mathematical statement correction to re-review.
2. **Resolved internal word suppliers.** T.6/dennis-stein-symbol now directly
   requires `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words` and
   `K2SymbolsBrauer:T.2:symbols/diagonal-lift`. They already provide w_ij, h_ij
   and their elementary images, so T.3 request 1 no longer asks for their
   reconstruction under T.2/steinberg-symbol.
3. **Unresolved internal theorem.** T.3 request 1 is narrowed to Milnor §9’s
   finite-rank monomial-kernel/unit-symbol theorem, including stabilization
   compatibility. No exact owning node exists in T.1–T.2. A consuming gap,
   `G-monomial-kernel`, now records that failure at T.5/integer-kernel-upper-generation.
   The stage prerequisite is retained; the semilocal generation theorem cannot
   replace it over ℤ. This obligation propagates to K₂(ℤ) and K₂(ℚ). Record and
   review the added gap before treating those source decompositions as closed.
4. **Shared Lean names and models.** Keep `Steinberg.Gen n R` for finite indices,
   rename the incompatible natural-index presentation to `Steinberg.StableGen R`.
   There is one stable Steinberg presentation, one K2 kernel and one Milnor
   carrier. Align the older commented `classicalK2`/`MilnorK F` spelling with
   `K2`/`milnorK F`. Add honest `sorry` signatures for `finiteToStable` and its
   generator formula. The strengthened rank-two `IntegerSteinbergModel` remains
   an auxiliary presentation; `equivFinite` and its generator/stable-map
   formulas connect it to the common finite presentation only at n≥3. These
   are bridge obligations already demanded by the packets, not proved results.
   Add the finite-field and star-self examples missing from the inherited name
   checklist. The action map’s documentation distinguishes E(R) from the full
   permutation group, and the union-presentation/colimit bridge remains explicit.

The source-issue ids E1 and E2 are reused by the two input packets for different
observations. They were not renumbered because their existing reviews identify
them in context. The unified reader always scopes them by part. Likewise
`Kbook.III.chapter` and `Weibel.KBook.III` are citation aliases for the same
SHA-256 chapter bytes; they are preserved rather than changing source references.

## Validation

- `python3 scripts/check_blueprint.py` on both part packets: **0 errors,
  0 warnings** each. Counts: T.1 66 nodes/18 gaps/6 requests; T.3 68 nodes/
  5 gaps/32 requests. One source-decomposed sub-stage does not promote either packet.
- Combined graph: 134 unique node ids, acyclic. All **59 cross-part node edges**
  resolve. The sole same-roadmap stage prerequisite without an exact node is
  T.2:symbols → T.5/integer-kernel-upper-generation, explicitly recorded above.
- Reader parity: every current statement, hypothesis, proof step, API item,
  test and source locator is included; every internal anchor resolves and the
  section order respects all internal prerequisites. Planet limits remain the
  parts’ checked limits. No atlas data, upstream roadmap or review file changed.
- Lean structural checks: imports occur once and the finite/stable generator
  collision is removed. The complete file **did not compile**: `lean-check`
  stopped at missing prebuilt `TauCeti.FieldTheory.FunctionField.Divisor.Eval.olean`
  in the shared build. No library build, cache download or language server was run.
- A Mathlib-only projection of the unified core (finite Steinberg, universal
  central extensions, actual quotient-bar sequence, shared Milnor/stable carriers
  and finite-to-stable signatures) was temporarily checked at the same permitted
  suggested path with `lean-check`: **exit 0, only `sorry` warnings**. The complete
  file was restored. A second projection also included the auxiliary integer
  model and all three new finite/stable bridge signatures: **exit 0, 96 `sorry`
  warnings and no other diagnostics**. This validates the reconciled core and
  presentation bridges, not the omitted Tau Ceti
  consumers or the whole file. Memory was above 20 GB before each attempt.

Logs and assembly scripts were scratch artifacts and are not required to resume.
The commands, outcomes, contracts and remaining work are preserved here.

## Resume and ownership decisions

The next review should start with the three packet reconciliations above, then
check the newer ~2 source decompositions against the unchanged prior review
reports. This job supplies a full assembly, not a proof-closure checkpoint.
Mathematical completion remains with the part owners and supplier roadmaps.

The internal monomial-kernel theorem is the immediate missing T.2 declaration.
The other T.1 gaps include the Matsumoto normal form, general associative-ring
matrix and stabilization bridges, stable centrality, trivial-action extension
classification, finite lifted relations, natural plus/Hurewicz comparison,
universal negative-unit localization, and divisibility/arithmetic Milnor proofs.
T.3 still requires the general Dennis–Stein completeness proofs and the
Keune–Loday comparison, plus the stated coefficient and arithmetic supplies.
The full gap contracts are in the unified reader with `neededBy` nodes.

The maintainer must apply the stage-graph requests catalogued below, keeping
`T.3:symbols → T.4 → T.3:localization-comparison → T.5`, the proposed transfer-torsion
sub-stage after the elementary symbols, and the downstream arithmetic/scheme/curve
consumer directions. No automatic acceptance of these graph edits is claimed.
Decide the local all-m Hilbert-symbol owner between T.7 and CA.1 without making
CA.1 depend on the T.7 adapter that consumes its reciprocity law. Existing upstream
roadmaps are never re-planned here; stronger generic DVR scopes belong to their
owners or Part II.

## Complete request catalogue

The following preserves all 38 requests from the current packets. Incoming
supplies, the unresolved internal contract and outgoing consumer/compatibility
notes are separated so that a consumer note cannot become a backward prerequisite.
Entries carry their original part and ordinal; duplicated supplier names have
different scope contracts and are not silently deduplicated.

### Internal supply

#### T.3 request 1: `K2SymbolsBrauer:T.2:symbols`

Supply the monomial-kernel theorem of Milnor §9: for n≥3 and commutative A, C_n=ker(St(n,A)→E(n,A))∩W_n is central and generated by unit symbols {u,v} (Corollary 9.3, Theorem 9.11, pp. 71–78), with compatibility under stabilization. The proof contract is: diagonal lifts generate a normal subgroup H of W; modulo H, signed permutation relations eliminate a kernel word, so C_n⊆H. Modulo the central subgroup generated by unit symbols, diagonal lifts multiply and commute; write a kernel element as h₁₂(u₂)⋯h₁n(u_n). Its diagonal matrix forces every u_j=1, so the element is trivial in that quotient. T.2 owns this field-independent unit-symbol lemma; T.5 applies it only with A=ℤ. The existing nodes K2SymbolsBrauer:T.2:symbols/diagonal-lift-words and K2SymbolsBrauer:T.2:symbols/diagonal-lift already supply w_ij, h_ij and their elementary images; they are exact prerequisites of T.6/dennis-stein-symbol.

Needed by: `K2SymbolsBrauer:T.5/integer-kernel-upper-generation`.

### Incoming supplies

#### T.1 request 1: `KTheoryLowDegrees:U.1`

Finite/stable GL and elementary subgroups, stabilization embeddings, general associative-ring elementary units, E normal/perfect with trivial stable centre, and block diag(P,P^-1) elementary factorization. The existing document owns these; its current packet interfaces are still required.

#### T.1 request 2: `KTheoryLowDegrees:U.2`

Classical quotient K1=GL/E with quotient map and exactness, for the separate classical K2-K1 sequence; this does not depend on late K2 comparison.

#### T.1 request 3: `KTheoryLowDegrees:U.3`

For fields, the canonical unit/determinant K1 isomorphism and the unit-class map, used to specify degree one of the product comparison.

#### T.1 request 4: `GeneralAlgebraicKTheory:K.2:plus`

The early ring K-space zero component BGL(R)+ with basepoint and ring-map functoriality. Do not import K.2:low-degree-comparisons, which consumes this K2 model.

#### T.1 request 5: `GeneralAlgebraicKTheory:K.7`

Quillen K-theory products with degree-one Steinberg relation, equality of degree-two products with the classical symbol (IV.1.10-.1), graded functoriality, and filtered-colimit compatibility for restriction-kernel reduction.

#### T.1 request 6: `StableHomotopyKTheory:H.3`

Acyclic plus construction with the relative comparison identifying BE(R)+ as the simply connected cover of BGL(R)+. The covering and Hurewicz naturality bridge is explicitly missing; the H.3 document does not assert an existing implementation.

#### T.3 request 7: `MotivicEtaleKTheory:M.3`

M.3 is the single owner (RT-AREA-ktheory-1/8) of: (i) the Galois symbol h_F : K₂(F)/m → H²(F, μ_m^{⊗2}) for any field F with m invertible, with the symbol formula {a, b} ↦ κ(a) ∪ κ(b) and the cohomological Steinberg relation κ(a) ∪ κ(1 − a) = 0 (K-book Proposition III.6.10.3), exported for a general field as its own declaration before the arithmetic specialisation (the verifier of RT-AREA-ktheory-1/8; RT-AREA-ktheory-1/14 decides where in MotivicEtaleKTheory the general-field symbol sits); (ii) its norm-residue/Chern description, the degree-two étale Chern class c_{2,2} on π₂ K(F) with its value on a product of two K₁-classes and its sign; (iii) Tate's theorems, as separate declarations with their hypotheses: the local-field theorem, the global-field theorem, and the S-integer comparison K₂(O_{F,S})/ℓ^r ≅ H²_ét(O_{F,S}, μ_{ℓ^r}^{⊗2}) with the primes above ℓ in S, proved through the étale localisation sequence. T.7 constructs none of these and proves no Tate theorem; it keeps only the comparison with the Kummer map and cup product, the Hilbert/local-invariant normalisation, the change-of-root rule, the reciprocity adapter and the Chern compatibility. The 'global reciprocity' M.3's text uses must come from ClassFieldTheory Layer 10, not from K2SymbolsBrauer:T.7/global-reciprocity, which would close a cycle M.3 → T.7 → M.3. Exact normalization contract: c_{1,1}=Kummer and c_{2,2}(a·b)=−κ(a)∪κ(b) for prime-power coefficients (Soulé thesis 2.2.2.3, with (M) checked in the T.7 adapter), with coefficient-reduction naturality and the CRT decomposition for arbitrary invertible m. The Galois symbol h_F remains the positive ordered cup, so c_{2,2}=−h_F.

Needed by: `K2SymbolsBrauer:T.7/symbol-formula`, `K2SymbolsBrauer:T.7/chern-class-agreement`.

#### T.3 request 8: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

invMap on Br F with its arithmetic-Frobenius normalisation, h2MuEquivZMod_mixed, kummerCupPairing ζ and localSymbol, for the comparison of the norm residue symbol with the Kummer cup product followed by the local invariant. Layer 5 does not build μ_n ⊗ μ_n (its text: 'Two Kummer classes naturally cup into μ_n ⊗ μ_n, not μ_n … A primitive root supplies the additional pairing'), so the twisted module is requested from MotivicEtaleKTheory M.1 instead. This import is the promoted link CFT-L68 (ClassFieldTheory Layer 5 → T.7), which is kept; the node now lists the stage as a prerequisite.

Needed by: `K2SymbolsBrauer:T.7/local-comparison`.

#### T.3 request 9: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`

hilbertProductFormula in its additive cohomological form (the local ZMod 2 invariants of the quaternion symbol sum to zero) and its multiplicative form ∏_v (a, b)_v = 1, with quadratic reciprocity for ℚ: the m = 2 case of T.7's reciprocity adapter, read through QuadraticFormInvariants 6E's sign dictionary. Layer 14 owns only the quadratic law ('higher power reciprocity laws (Artin–Tate XII) are follow-on work using the same symbols'); the m-th power law is requested from ClassicalArithmeticCompletion CA.1.

Needed by: `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 10: `GeneralAlgebraicKTheory:K.3`

The ring case of K.3's abelian localization: for a Dedekind domain R with fraction field F (and for a DVR), the finitely generated S-torsion R-modules, S = R ∖ {0}, form a Serre subcategory of the finitely generated R-modules whose quotient is the category of finite-dimensional F-vector spaces (K-book V.6.1, citing II.6.4.1), so that K.3/abelian-localization-theorem applies to it. The two other ring contracts this packet needs are nodes of the GeneralAlgebraicKTheory K.1 packet and are cited directly: the degree-one boundary ∂₁[s]=[R/sR] for a non-zero-divisor s and its DVR case ∂₁[π]=1 (K.3/localization-degree-one-index, K.3/dvr-degree-one-boundary), and the base change of transfers along any field extension F′/F, with the local lengths of E⊗_F F′ as multiplicities (K.3/finite-field-transfer-base-change). No transfer or localization sequence is constructed in T.3.

Needed by: `K2SymbolsBrauer:T.3/dedekind-localization-boundary`.

#### T.3 request 11: `GeneralAlgebraicKTheory:K.7`

The unit-product contract: the product K₁(F) × K₁(F) → K₂(F) of unit classes, in the order (a,b), equals the Steinberg symbol {a,b} on Quillen K₂ through T.1/k2-pi2 (K-book V.6.6.1 for the calculation). The right K_*(R)-module structure of ring localization, ∂(x·j*(y))=∂(x)·i*(y), is GeneralAlgebraicKTheory:K.3/localization-product-boundary of the K.1 packet, built on K.7's biexact pairing, and is cited directly. The left module convention introduces the Koszul sign and is not silently substituted. No tame-symbol comparison is imported from K.7.

Needed by: `K2SymbolsBrauer:T.3/localization-boundary`, `K2SymbolsBrauer:T.7/chern-class-agreement`.

#### T.3 request 12: `KTheoryLowDegrees:U.4`

SK_1(O_{F,S}) = 0 for a number field F and a finite set S of nonzero primes (S = ∅ included, so SK_1(ℤ) = 0) — the Bass–Milnor–Serre theorem — in the form T.5 uses: the map K_1(O_{F,S}) → K_1(F) induced by the inclusion is injective (determinant identifications K_1(O_{F,S}) ≅ O_{F,S}^× ⊆ F^× ≅ K_1(F)). U.4's text: 'Prove the Bass–Milnor–Serre result needed for SK₁(O_{F,S})=0, with F a number field and S finite.' Through the exact segment ⊕_𝔭 k(𝔭)^× → K_1(O_{F,S}) → K_1(F) of T.3/dedekind-localization-boundary it is what makes the residue sums of T.5 onto (RT-AREA-ktheory-1/26). The KTheoryLowDegrees--U.1 blueprint, not yet accepted, plans these statements as U.4/bass-milnor-serre and U.4/K1-S-integers-into-field; the prerequisite can be narrowed to them once it is.

Needed by: `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

#### T.3 request 13: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`

The Layer 12 dictionary, imported explicitly rather than re-proved (RT-AREA-ktheory-1/32; the link AC-L40 already exists): 12A, ord_x : k(X)^× → ℤ at a regular closed point through the discrete valuation ring O_{X,x}, and closed points ↔ places with matching residue fields and degrees; 12B, the proper regular model as the normalisation of ℙ¹_F in K, projective, with k(X_F) ≃ₐ[F] K; 12D, Weil divisors on the regular model ≅ Divisor F K with principal divisors and degrees matching. Layer 12's 'regular, not smooth' convention is kept: over an imperfect F the model need not be smooth. Already pinned and reused: Mathlib's Ring.ordFrac_eq_valuation_inv (Mathlib/RingTheory/OrderOfVanishing/Noetherian.lean:183) and Tau Ceti's Place.heightOneSpectrumEquiv (TauCeti/FieldTheory/FunctionField/AffineModel/Prime.lean:140); no pinned declaration mentions both Scheme.ord and Place.

Needed by: `K2SymbolsBrauer:T.4/valuation-comparison`.

#### T.3 request 14: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`

localArtinEquiv with its normResidue form K^×/N L^× ≅ Gal(L/K) for a finite abelian extension of a nonarchimedean local field, the unramified case in which units are norms, and localArtinMap_quadratic_eq_hilbertSymbol as the m = 2 check.

Needed by: `K2SymbolsBrauer:T.7/classical-local-symbols`, `K2SymbolsBrauer:T.7/local-comparison`, `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 15: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map`

artinMap_groundNorm, the compatibility of the Artin map with the norm of a finite extension, used in the Steinberg identity of the norm residue symbol.

Needed by: `K2SymbolsBrauer:T.7/classical-local-symbols`.

#### T.3 request 16: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

sumLocalInv_eq_zero (exactness in the middle of Br K → ⊕_v Br K_v → ℚ/ℤ, with the real-place invariants) and the localisation maps Br K → Br K_v. This import is the promoted link CFT-L69 (ClassFieldTheory Layer 10 → T.7), which is kept; the node now lists the stage as a prerequisite.

Needed by: `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 17: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`

hilbertSymbol with symmetry and bimultiplicativity (6C's milestones), for the Steinberg symbol K₂(F) → {±1} of hilbert-symbol-steinberg. 6C freezes the comparison hilbertSymbol_eq_cohomological, which 6E proves and which is requested from 6E.

Needed by: `K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`.

#### T.3 request 18: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

hilbert90, the Kummer isomorphism kummerIso : Kˣ/(Kˣ)ⁿ ≅ H¹(G_K, μₙ), and h2KummerToUnits : H²(G_K, μₙ) ↪ H²(G_K, (Kˢ)ˣ) with image the n-torsion.

Needed by: `K2SymbolsBrauer:T.7/classical-local-symbols`, `K2SymbolsBrauer:T.7/brauer-valued-symbol`.

#### T.3 request 19: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups`

Restriction of continuous cohomology to the decomposition groups (the completions F_v), compatible with the Kummer map.

Needed by: `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 20: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-8-cup-products-in-low-degrees`

Compatibility of the (1,1) cup product with restriction.

Needed by: `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 21: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`

The power-class count #(K^×/K^×n) = n · #μ_n(K) · q^(natCastValuation K n) for a nonarchimedean local field, giving finiteness of F^×/F^×m.

Needed by: `K2SymbolsBrauer:T.7/classical-local-symbols`.

#### T.3 request 22: `MotivicEtaleKTheory:M.1`

The finite Tate twists μ_m^{⊗j} (j ∈ ℤ) of a field F with m invertible, as discrete G_F-modules built on Tau Ceti's KummerCoeff F m, with the equivariant tensor pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}, so that explicitCup11 of two Kummer classes lands in H²(F, μ_m^{⊗2}).

Needed by: `K2SymbolsBrauer:T.7/twisted-roots-of-unity`, `K2SymbolsBrauer:T.7/symbol-formula`, `K2SymbolsBrauer:T.7/brauer-valued-symbol`.

#### T.3 request 23: `GeneralAlgebraicKTheory:K.5`

Relative K-theory of a pair (A, I) as the homotopy fibre of K(A) → K(A/I), with its long exact sequence and π₂ K(A, I); and, if K.5 accepts it, the Keune–Loday identification of π₂ K(A, I) with the relative group of K-book III.5.7 (cited in K-book IV.1.11), against which the T.6 square-zero examples are tests.

Needed by: `K2SymbolsBrauer:T.6/relative-square-zero`, `K2SymbolsBrauer:T.6/relative-steinberg-group`.

#### T.3 request 24: `KTheoryLowDegrees:U.5`

The relative elementary group E(A, I), the congruence subgroup GL(I) and K₁(A, I), with the start of the relative exact sequence, used to define K₂(R, I) = ker(St(R, I) → E(R, I)).

Needed by: `K2SymbolsBrauer:T.6/relative-steinberg-group`.

#### T.3 request 26: `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

The milestone 'Weil reciprocity f(div g) = g(div f)' of Layer 2's divisor construction of the Weil pairing, with Layer 0's places, principal divisors and evaluation of a function on a divisor of disjoint support (Tau Ceti's Divisor.principal and Divisor.eval, whose local factors are residue-field norms). T.4/disjoint-support-reciprocity proves that T.4's symbol-form reciprocity specialises to this statement for W.FunctionField (RT-AREA-ktheory-1/32), so the elliptic milestone and T.4's theorem must be stated compatibly; T.4 keeps the general theorem. Needed stage edge: EllipticCurves Layer 2 → T.4 (acyclic: no EllipticCurves layer depends on T.4).

Needed by: `K2SymbolsBrauer:T.4/disjoint-support-reciprocity`.

#### T.3 request 27: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map`

hilbertSymbol_eq_cohomological, 6E's Milestone 2: (a, b)_K = hilbertSign(localSymbol (a) (b)) at ClassFieldTheory's arithmetic-Frobenius normalisation, with hilbertSign 0 ↦ +1, 1 ↦ −1, and ε([D]) = localHasse for the quaternion division algebra D — the exponent-2 comparison of T.7's norm residue symbol (m = 2, ζ = −1, where kummerCupPairing (−1) is canonical) with ClassFieldTheory's localSymbol and with the quaternion/norm-equation symbol (RT-AREA-ktheory-1/27).

Needed by: `K2SymbolsBrauer:T.7/local-comparison`, `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 28: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`

The comparison of the algebraic Brauer group with H²(G_K, (K^s)^×) (7B's crossed-product package, milestone 3) and the symbol as a cup product ι[(a, b)] = (a) ∪ (b) (milestone 6, brauerCohomologyEquiv_quaternionClass): T.7's Brauer-valued symbol β_ζ is built in the cohomological Brauer group, and exporting it as a class of central simple algebras, with β_{−1}{a, b} the quaternion class (a, b), uses this comparison (RT-AREA-ktheory-1/27; Layer 7 owns the comparison of the algebraic Brauer group with H²).

Needed by: `K2SymbolsBrauer:T.7/brauer-valued-symbol`.

#### T.3 request 29: `ClassicalArithmeticCompletion:CA.1`

The m-th power Hilbert reciprocity law for a number field F containing μ_m: for a, b ∈ F^×, (a, b)_v = 1 for almost all places v and ∏_v (a, b)_v = 1, including the places above m and the real places (m ≤ 2) — CA.1's 'source-scoped higher reciprocity through class field theory', which RS-03 keeps in CA.1 ('Higher reciprocity and power-residue/Hilbert-symbol extensions, including the place 2, infinite places and ramification conventions'). ClassFieldTheory Layer 14 owns only the quadratic law. T.7/global-reciprocity reads the law in the normalisation of T.7/classical-local-symbols (local reciprocity of ClassFieldTheory Layer 6 with the arithmetic Frobenius, variable order x ↦ (x, −)_v); CA.1 should state its local symbol by the same construction, or record the conversion. CA.1 cannot import T.7's symbol (T.7 now imports CA.1), so which of the two owns the local m-th power Hilbert symbol is left to the maintainer (RT-AREA-ktheory-1/27).

Needed by: `K2SymbolsBrauer:T.7/global-reciprocity`.

#### T.3 request 30: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`

Import Layer 2’s explicit finite-normalization milestone: for any field k, any finite K/k(t), the integral closure of k[t] in K is a finite k[t]-module, WITHOUT separability; localizations at all finite places and the t⁻¹ chart are finite as well. For finite K/k(t), embed K in a finite normal hull M/k(t). In characteristic p, the maximal purely inseparable subextension P/k(t) has M/P separable (Stacks 032N, Fields 9.27.3); this is the pure-FIRST tower in the normal hull, not the generally unhelpful separable-first tower inside K. The pinned purely inseparable polynomial theorem makes the integral closure A′ of k[t] in P finite. It is normal Noetherian, and the separable trace/dual-basis argument (Stacks 032L, pinned IsIntegralClosure.finite) makes its integral closure B in M finite over A′. Integrality transitivity makes B the k[t]-normalization in M. The normalization in K is a k[t]-submodule of B, hence finite by Noetherianity. In characteristic zero use the separable theorem directly. Repeat for t⁻¹ and localize. This uses no perfection, smoothness, or false finiteness conclusion from Krull–Akizuki.

Needed by: `K2SymbolsBrauer:T.4/weil-reciprocity`.

#### T.3 request 31: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

The existing norm-on-valuations milestone gives ord_F N(y)=f ord_E(y) for local fields. T.4 also needs its complete/henselian DISCRETE-VALUATION-field form without finite residue fields, and res N(u)=N_l/k(res u)^e for a unit u, including inseparable residue extensions. Determinant proof: the finite free valuation-ring lattice S has rank ef; the determinant of multiplication by y has valuation length_R(S/yS)=f ord_E(y) for integral nonzero y, and extend to fractions. For a unit u, filter S/π_F S by powers of π_E; there are e successive copies of l as k-vector spaces, and multiplication on each has determinant N_l/k(ū). Multiply the e determinants. GS Lemma 7.3.10, pp. 200–201 uses these identities. This extends the standing local-field scope and is flagged in upstreamNotes; no generic norm theory is rebuilt in T.4. Also supply the generic complete-DVR base-change length identity: For finite complete-DVR base change F′/F, put r=e(F′/F), k′ its residue field, e=e(E/F), and E⊗F F′=∏ E_i with residue l_i. Write l⊗k k′=∏ A_j with residue L_j and length t_j. Let e_i=e(E_i/F′), e′_i=e(E_i/E), with i assigned to its residue component j. Then Σ_(i over j) e′_i [l_i:L_j]=r t_j. Proof: B=S⊗R R′ and its finite normalization C=∏S_i are full R′-lattices in the same algebra, with torsion quotient D. Reduction modulo π′ has equal composition multiplicities for B and C, since the finite-length kernel and cokernel of multiplication by π′ on D have equal multiplicities by length additivity. This is an elementary module-length argument, not a new Quillen G-theory construction. The e-step filtration of S/πS gives e t_j on B, while C gives Σ e_i [l_i:L_j]. Thus Σ e_i [l_i:L_j]=e t_j. Multiply by r and use r e_i=e e′_i; cancel the positive integer e in the LENGTH identity, not in a Milnor K-group. This establishes the displayed multiplicities. Combined with restriction-transfer degree in the residue fields, it proves the r·residue-base-change square used in complete-norm-residue without assuming that composita of residue fields exhaust l_i.

Needed by: `K2SymbolsBrauer:T.4/kato-complete-residue`, `K2SymbolsBrauer:T.4/complete-norm-residue`.

#### T.3 request 32: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`

Finite normalization completion contract used by T.4: for a DVR R with fraction F, finite E/F and finite integral closure S/R, the semilocal completion is ∏_w completed S_w and E⊗_F F̂≅∏_w Ê_w, with identical residue fields and ramification index 1 for E→Ê_w. Prove via finite-module tensor completion, Chinese remaindering S/π^nS, and inverting π; source GS Appendix A.6.4 and Corollary 7.4.3. Request the generic DVR form from the normalization owner, rather than applying number-field-only completions to imperfect function fields.

Needed by: `K2SymbolsBrauer:T.3/transfer-and-norm-residue`.

### Consumer and compatibility notes

#### T.3 request 2: `ArithmeticKTheory:N.2`

Consumer note, not a supply (RT-AREA-ktheory-1/9 and /26): T.5 derives its degree-two rows itself — T.5/s-integer-tame-kernel-sequence (residues at the primes outside S), T.5/tame-kernel-sequence (S = ∅) and T.5/relative-s-integer-sequence (residues at the primes in S) — from GeneralAlgebraicKTheory K.3 through T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4, and imports nothing from N.2; the earlier request for N.2's localisation sequence is withdrawn. N.2 imports these rows (edge T.5 → N.2) and specialises its all-degree Dedekind sequence to them: in degrees at most two N.2/localisation-sequence-for-a-dedekind-domain should restrict to T.3/dedekind-localization-boundary, and N.2/the-three-classical-rows (b) should cite the T.5 nodes instead of being cited by them.

#### T.3 request 3: `ArithmeticKTheory:N.6`

Consumer note, not a supply (RT-AREA-ktheory-1/9): the certificate engine — the order-certificate format on Mathlib's Module.Relations and Module.Presentation with independent upper and lower bounds, and the rule that an upper bound with a surjective presentation is not an isomorphism — is N.6's. The former node T.5/certified-presentation is deleted from this packet and its statement, API and tests are for N.6 to own; N.6/certificate-driven-computation, which lists T.5/certified-presentation as a prerequisite, must cite N.6's own format instead. T.5 supplies N.6 (edge T.5 → N.6) with groups and sequences only: T.5/unramified-subgroup, T.5/tame-kernel-sequence, T.5/s-integer-tame-kernel-sequence, T.5/relative-s-integer-sequence and the lower-bound symbol T.5/real-sign-symbol. No T.5 node depends on N.6, and T.5 needs no finite-generation theorem.

#### T.3 request 4: `ArithmeticKTheory:N.8`

Consumer note, not a supply (RT-AREA-ktheory-1/9): N.8 imports rather than recomputes K_2(ℤ) ≅ ℤ/2 with generator {−1, −1} (T.5/k2-of-the-integers), K_2(ℚ) ≅ K_2(ℤ) ⊕ ⊕_{p odd} 𝔽_p^× with K_2(ℚ) infinite (T.5/k2-of-the-rationals), K_2(𝔽_q) = 0 (K2SymbolsBrauer:T.2/k2-finite-field, this roadmap's owner of that calculation) and, for its ℤ[1/p] example, 0 → K_2(ℤ) → K_2(ℤ[1/p]) → 𝔽_p^× → 0 (T.5/relative-s-integer-sequence, residues at p ∈ S) together with T.5/s-integer-tame-kernel-sequence (residues outside S). N.8's certificate for K_2(ℤ) instantiates N.6's format with the bounds of T.5/k2-of-the-integers; K_1(ℤ) and K_0(ℤ) are KTheoryLowDegrees U.6's and Z.6's.

#### T.3 request 5: `SpecialValuesBirchTate:B.7`

Consumer note, not a supply: B.7 derives #K_2(O_{F,S}) = #K_2(O_F)·∏_{v∈S}(Nv − 1) ('prove from localisation') from T.5/relative-s-integer-sequence, whose residues are at the primes in S (the tame-kernel sequence of O_{F,S}, with residues outside S, is T.5/s-integer-tame-kernel-sequence). B.7 lies downstream of T.5 (B.7 requires B.6, …, B.2, B.1, and B.1 requires K2SymbolsBrauer:T.5), so no T.5 node may list it as a prerequisite.

#### T.3 request 6: `KTheoryFiniteLocalFields:L.1`

Compatibility note: L.1's 'field-symbol calculation in degree two' must agree with K2SymbolsBrauer:T.2/k2-finite-field (Matsumoto's presentation) under the comparison of T.1:plus. No T.5 node needs L.1: K_2(𝔽_q) = 0 is K2SymbolsBrauer:T.2/k2-finite-field.

#### T.3 request 25: `MotivicEtaleKTheory:M.4`

Consumer note, not a supply (RT-AREA-ktheory-1/12): M.4's Nesterenko–Suslin/Totaro comparison of field Milnor K-theory with the diagonal higher Chow groups imports from T.4 the all-degree Milnor norms with Kato's independence of the chain of generators (T.4/milnor-transfer-transitivity) and Suslin's reciprocity law Σ_w N_{κ(w)/F} ∂_w(x) = 0 for x ∈ K^M_{n+1}(F(C)), C a proper curve over any field (T.4/weil-reciprocity), stated over the closed points of the regular proper model (the normalisation), with possibly inseparable residue extensions and without smoothness. M.4 owns the two inverse maps and the boundary calculation. The needed stage edge is T.4 → M.4; M.4 is downstream, so no T.4 node lists it.

## Complete restructuring catalogue

All 11 entries are retained. Some document ownership corrections already present in the packets; others request stage text or graph edits for the maintainer. None edits `content/` or `data/` in this job.

### T.1 restructuring 1: Separate the transfer corollary from elementary field symbols

Kind: `propose-split`.

Create T.2:symbols:transfer-torsion after T.2:symbols, GeneralAlgebraicKTheory K.3 and K.2:plus, and move extension-kernel-torsion there with its id unchanged. The elementary Matsumoto stage does not need Quillen transfer. The graded-map stage imports K.7:products rather than the late K.7 umbrella. Connective filtered continuity comes from the early ring model, not negative/nonunital K.7.

### T.3 restructuring 1: Two groups of nodes moved out of the companion T.1 part

Kind: `ownership`.

An earlier revision of the packet for the T.1 part of this roadmap placed the higher tame symbols with their rigidity corollary, and the Dennis-Stein symbols with their presentation theorem, under T.2:symbols. The roadmap assigns higher Milnor residues, specialisation with a uniformiser and their product signs to T.3:localization-comparison, and the Dennis-Stein symbols to T.6. Both groups are owned here instead, and the companion packet was corrected before review rather than left as a duplication. No restructuring of the atlas is proposed: the stage texts already say where these belong, and this entry records the correction so that a reviewer of either part can see it.

### T.3 restructuring 2: The localisation comparison is supplied to S.3 and E.3, not imported from them

Kind: `ownership`.

The accepted restructuring RS-18 makes K2SymbolsBrauer:T.3:localization-comparison the owner of 'Classical tame-symbol comparison with ring K-theory localization', narrows SchemeKTheoryOperations:S.3 to 'identify the scheme symbol boundary with the imported classical tame symbol/localization normalization' and EllipticKTheory:E.3 to its curve segment, and adds the links T.3:localization-comparison → S.3 and → E.3. The packet's localization-boundary listed S.3 and E.3 as prerequisites and requested the boundary identification from S.3: both closed two-stage cycles with RS-18's links (and E.3 → E.2 → T.4 → T.3:localization-comparison a longer one). The node now rests on GeneralAlgebraicKTheory K.3, which the layer's atlas entry already requires, and K.7; the requests to S.3 and E.3 are withdrawn.

### T.3 restructuring 3: Milnor residues in T.3:symbols, Milnor norms and their identities in T.4, the Quillen comparison in T.3:localization-comparison

Kind: `ownership`.

RT-AREA-ktheory-1/28 (confirmed) requires the elementary all-degree Milnor norm/residue identities inside T.4, before Kato's transitivity theorem, and the edge T.4 → T.3:localization-comparison, so that the localisation comparison imports Milnor norms from T.4 and K-theory transfers from GeneralAlgebraicKTheory K.3 instead of constructing a transfer. T.4's Bass–Tate sequence is built from the higher Milnor residues, which the stage text lists under T.3:localization-comparison; with that placement the new edge closes the cycle T.3:localization-comparison → T.4 → T.3:localization-comparison that an earlier revision of this packet avoided by proposing the opposite edge. Applied here: the residue theory (Serre's algebra and map, the higher residues and specialisations, the product formula, the change of uniformiser, the kernel of Serre's map, finite support and rigidity) is parented in T.3:symbols and still realises T.3:localization-comparison; the ramification formula for higher residues (Ex. III.7.8) joins Ex. III.7.7, III.7.9 and Corollary III.7.6.3 in T.4; the general Milnor norm–residue formula stays parented in T.4 (T.4/weil-reciprocity uses it); T.3:localization-comparison keeps the discrete-valuation-ring and Dedekind boundary comparisons, the Quillen norm–residue square and the comparison of the Milnor norm with Quillen's transfer. Stage changes: add T.4 → T.3:localization-comparison, withdraw the proposed T.3:localization-comparison → T.4, and move the sentences on higher Milnor residues and finite support to T.3:symbols' text. RS-28's owner line 'Higher algebraic residue maps and norm/residue projection comparisons → T.3:localization-comparison' is refined accordingly: residue maps in T.3:symbols' nodes, Milnor norm/residue identities in T.4, comparisons with Quillen K-theory in T.3:localization-comparison.

### T.3 restructuring 4: K_2 of a finite field is owned by T.2

Kind: `ownership`.

K2SymbolsBrauer:T.2/k2-finite-field (companion packet) plans K_2(𝔽_q) = 1 with the source's counting proof, and T.2/rational-function-field and T.2/milnor-examples build on it, so it cannot move to T.5 without a stage cycle. T.5's target 'K₂(F_q)=0' is realised by that node; T.5/k2-of-a-finite-field is removed as a duplicate, and its verbatim excerpts (Corollary III.6.1.1, PDF p. 239) should replace the companion node's one-line excerpt. KTheoryFiniteLocalFields L.1 recovers the same statement in its own model and is a compatibility check, not a second owner.

### T.3 restructuring 5: The degree-two tame-kernel rows, K_2(ℤ) and K_2(ℚ) are owned by T.5

Kind: `ownership`.

T.5's text asks to prove the tame-kernel sequence, its S-integer comparison, K₂(ℤ) ≅ ℤ/2 and the calculation of K₂(ℚ). RT-AREA-ktheory-1/9 and /26 (confirmed) make T.5 their single owner and require T.5 to derive the rows itself: T.5 imports T.3:localization-comparison's Dedekind boundary comparison and KTheoryLowDegrees U.4's SK_1(O_{F,S}) = 0, and no longer imports ArithmeticKTheory N.2's localisation sequence; N.2 imports T.5's rows (T.5 → N.2) and specialises its all-degree sequence to them, and N.8 imports K₂(ℤ), K₂(ℚ), K₂(𝔽_q) and the ℤ[1/p] sequence (T.5 → N.8). The verifier's indexing is applied: the tame-kernel sequence of O_{F,S} sums over the primes outside S (T.5/s-integer-tame-kernel-sequence), the relative sequence comparing O_F with O_{F,S} has its residues at the primes in S (T.5/relative-s-integer-sequence), and both are stated. SpecialValuesBirchTate B.7 consumes the relative sequence; B.7 lies downstream of T.5 (B.7 → B.6 → … → B.1 → T.5), so the packet's former import of the S-integer sequence from B.7 was a stage cycle. K₂(𝔽_q) = 0 stays with T.2/k2-finite-field (restructure entry above).

### T.3 restructuring 6: The certificate engine is ArithmeticKTheory N.6's

Kind: `ownership`.

RT-AREA-ktheory-1/9 (confirmed; the verifier: 'Keep the certificate engine and its independent upper/lower bounds in N.6, and remove the competing certificate-proof obligation from T.5'). The node T.5/certified-presentation, which an earlier revision planned on Mathlib's Module.Relations and Module.Presentation, is deleted; its statement, API and tests are for N.6 to own, and N.6/certificate-driven-computation must cite N.6's format instead of it. T.5 supplies N.6 with the groups and sequences (T.5 → N.6) and no longer needs the finite-generation theorem. T.5's stage text should lose its certified-presentation paragraph.

### T.3 restructuring 7: The curve–place dictionary is AlgebraicCurves Layer 12's

Kind: `ownership`.

T.4's text asks to 'compare the divisor valuation with the valuation already used in AlgebraicCurves'. Tau Ceti's AlgebraicCurves Layer 12 plans this dictionary — orders of vanishing at the regular closed points (12A), the regular proper model as the normalisation of ℙ¹ in F with closed points = places and matching residue fields (12A–12B), and Weil divisors = Divisor k F (12D) — and the link AC-L40 (Layer 12 → T.4) exists. RT-AREA-ktheory-1/32 (confirmed, narrowed by the verifier) asks that T.4 import it explicitly: T.4/valuation-comparison now lists Layer 12 as a prerequisite, proves no valuation comparison of its own and only transports the tame symbols and norms, keeping Layer 12's 'regular, not smooth' convention. The same finding adds T.4/disjoint-support-reciprocity, which proves that T.4's symbol-form reciprocity specialises to EllipticCurves Layer 2's milestone f(div g) = g(div f); that needs the stage edge EllipticCurves Layer 2 → T.4. T.4 keeps the general theorem.

### T.3 restructuring 8: The Galois symbol and Tate's theorems are MotivicEtaleKTheory M.3's

Kind: `ownership`.

RT-AREA-ktheory-1/8 (confirmed): M.3 is the single owner of the Galois symbol K₂(F)/m → H²(F, μ_m^{⊗2}), its symbol formula and cohomological Steinberg relation, and Tate's local, global and O_{F,S} theorems (the primes above m inverted), as separate declarations; by the verifier the general-field symbol is to be isolated before M.3's arithmetic specialisation. No T.7 node constructs these or proves a Tate theorem: symbol-formula imports the map and identifies its formula with the pinned Kummer map and cup product, and chern-class-agreement is only the compatibility of M.3's imported map and classes on Steinberg K₂. T.7 keeps the Hilbert/local-invariant comparison, the change-of-root rule and the reciprocity adapter. Consumers that cite T.7 for Tate's theorem (ArithmeticKTheory N.6, KTheoryFiniteLocalFields L.3, SpecialValuesBirchTate B.4) should cite M.3. The request to M.3 states the exports.

### T.3 restructuring 9: Global reciprocity for K₂-symbols is an adapter over ClassFieldTheory and ClassicalArithmeticCompletion

Kind: `ownership`.

RT-AREA-ktheory-1/27 (confirmed only for the remaining gaps): the promoted links ClassFieldTheory Layer 5 → T.7 (CFT-L68) and Layer 10 → T.7 (CFT-L69) exist and are kept, now as node prerequisites; the missing imports are added: ClassFieldTheory Layer 14 (hilbertProductFormula, the quadratic law only), QuadraticFormInvariants 6E (the exponent-2 comparison hilbertSymbol_eq_cohomological), QuadraticFormInvariants Layer 7B (the algebraic Brauer group against H², for the Brauer-valued export) and ClassicalArithmeticCompletion CA.1 (the m-th power Hilbert reciprocity law, owned there under RS-03). T.7/global-reciprocity no longer derives the reciprocity law: it states it for classes of K₂(F), imports the laws and proves their compatibility through local-comparison, with the primitive root and the Tate-twist pairing explicit. No L.3 → T.7 edge is added: L.3 consumes T.7. Whether CA.1 or T.7/classical-local-symbols owns the local m-th power Hilbert symbol is left to the maintainer; CA.1 cannot import T.7's.

### T.3 restructuring 10: Milnor norms and Suslin reciprocity are exported to MotivicEtaleKTheory M.4

Kind: `ownership`.

RT-AREA-ktheory-1/12 (confirmed, with a field-scope obligation): T.4 owns the all-degree Milnor norms with Kato's independence of the chain of generators and Suslin's reciprocity law for K^M_{n+1} of the function field of a proper curve over any field, which M.4's Nesterenko–Suslin/Totaro comparison imports (edge T.4 → M.4). T.4/weil-reciprocity is that law, stated over the places of the regular proper model (the normalisation) with Kato's norms for possibly inseparable residue extensions, never under a smoothness hypothesis; the finiteness it needs over an imperfect field is recorded as a gap.

## Consumer exports and upstream scope notes

### `K3BlochGroups:V.2`

The integral degree-three Milnor-to-Quillen map and its product convention; V.2 imports it for injectivity and the indecomposable cokernel.

### `HigherLocalFieldsAndHigherClassFieldTheory:HL.1`

All-degree Milnor K-theory is owned here by RS-28; HL.1 imports it, with residues imported from the separate T.3 owner.

### `K3BlochGroups:V.1`

The stable Steinberg group and its universal central extension St(A) → E(A) (steinberg-is-uce), and the theorem that the source of a universal central extension is superperfect (T.1:classical/uce-source-superperfect, with its lemmas central-extension-comp, uce-extensions-split, split-extensions-kill-h2 and h1-trivial-perfect, formerly planned in V.1). V.1 deduces H_1(St(A)) = H_2(St(A)) = 0 as a corollary and keeps only the plus construction, the connected-cover comparison, the Hurewicz step and the bar-cycle model.

### `StableHomotopyKTheory:H.3`

The Recognition Theorem (recognition-theorem; in particular (3) ⇒ (1) through superperfect-extensions-split and split-central-extension-universal), existence of universal central extensions of perfect groups (T.1:classical/perfect-uce-exists) and the kernel identification with H_2 (T.1:classical/uce-kernel-h2, with uce-kernel-h2-natural). H.3/plus-pi2-universal-central-extension should cite these instead of the unread K-book III.5.4; it keeps the topological acyclic-fibre argument.

### `EllipticKTheory:E.5`

Import T.2:symbols/milnor-global-positive-characteristic for all n≥3; the separate low-degree global tame kernel and reciprocity are requested from T.4.

### `K3BlochGroups:V.2`

Import T.2:symbols/milnor-number-field at degree three and T.2:graded-map for the product comparison; retain the indecomposable cokernel in V.2.

### `GeneralAlgebraicKTheory:K.3`

The degree-one ring cone/cokernel boundary is needed before this packet’s K₂ comparison. K.3 supplies it as K.3/localization-degree-one-index and K.3/dvr-degree-one-boundary of the GeneralAlgebraicKTheory K.1 packet; S.3 remains the downstream scheme adapter. The arbitrary-field transfer base-change contract uses G-theory of the potentially nonregular Artinian tensor algebra and dévissage, never K(B)=G(B).

### `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

The norm-on-valuations milestone is already in Layer 3. The residue norm and valuation formulas requested here must also cover complete discrete valuation fields with arbitrary residue field, and the finite henselian extensions used in descent; this is stronger than the roadmap’s standing local-field scope. Its owner should supply a generic DVR support lemma or Part II, rather than T.4 rebuilding local-field norm theory.

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`

Layer 2 explicitly owns finite normalization for every finite extension of k(t). A normal hull with a pure-first tower assembles the pinned pure and separable branches; a separable-first tower inside K does not let the polynomial pure theorem apply to the intermediate normal ring.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`

T.7/local-comparison needs the character-evaluation identity χ(Artin_{L/K}(a)) = inv_K(a ∪ δχ) for every χ ∈ Hom(Gal(L/K), ℚ/ℤ) and a ∈ K^×, at the arithmetic-Frobenius normalisation of Layers 5–6. Milne, CFT v4.03, III Proposition 3.6 states it with no proof ('See Serre 1962, "Annexe" to Chapter XI, and Serre 1967a, p. 140'), so the layer that defines the local Artin map through the fundamental class should export it with its proof. A quadratic check cannot fix the sign; the cubic test over ℚ₇ in T.7/local-comparison does. First recorded by FIX-RT-AREA-ktheory-1~2 (Codex codex-5ebb6f); re-read in Milne by claude-HJaFqR on 6 October 2026.
