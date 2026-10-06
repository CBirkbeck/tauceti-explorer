# ASM-PadicHodgeRegulators — assembly handoff

Issue: #249. Agent: Codex, session `codex-OSr7mm`.
Assembly deliverables are complete. This is an assembly submission, not a claim
that the roadmap is mathematically closed or that the D.1 review has accepted
it. The D.1 packet remains `partial` with review `needs_changes`; L3 remains
`complete` at target level with review `accepted`. Their review objects are
unchanged, and D.5 remains partial.

## What was assembled

- [Unified reader](../readmes/PadicHodgeRegulators.md): one purpose/scope/owner
  introduction, reconciled Tate and matrix conventions, edition-aware
  bibliography, pinned baseline, layer overview, all 127 stable nodes, their
  hypotheses, prerequisites, proof routes, API, tests, uses, source locators,
  acceptance requirements and planets. L0–L2 and D.1–D.5 precede L3–L4, with
  shared local prerequisites linked directly. It includes all 258 API items
  and 177 test specifications, including theorem-level items outside the
  checker's definition/construction counters.
- [Unified suggested file](../suggested/PadicHodgeRegulators.lean): one standard
  note, 17 distinct imports, one noncomputable section and one
  `TauCeti.PadicHodgeRegulators` namespace. All inherited native declarations
  and examples, and every named unelaborated arithmetic contract, are retained.
  No new private carrier or Prop placeholder was introduced.
- Precise cross-part references in the L3 packet replace 17 nodes' whole-layer
  L0/L1/L2 prerequisites. One repeated D7 prerequisite in the D.1 packet was
  removed. The former internal L2 request is discharged by those node
  references, with three unmatched comparison requirements left as consuming
  gaps and the actual Iwasawa pairing requested from its external owner.

## Reviewed mathematics and reconciliation

No node ID, title, kind, declaration, statement, hypothesis, proof step, API
item, test, acceptance requirement, use, source locator, planet,
implementation status or review object was changed. Coverage, source issues,
source/version metadata and all seven restructuring proposals are retained.
The packet edits change prerequisites and request/gap bookkeeping only.

The part readers predate several in-place review corrections. The unified
reader therefore takes mathematical node content from the reviewed packets,
rather than preserving stale assertions in those readers. This carries through
the corrected semilocal logarithm hypothesis, propagated local conditions,
small-weight lattice, repaired product residue-spanning argument, early
log-syntomic ownership, conditional curve models, bounded-coefficient algebra,
row basis changes, unit determinant requirement and primitive-conductor
Rodrigues Jacinto formula. The original part readers and suggested files are
untouched.

Notation is reconciled without changing source formulas: v_r is the
representation vector ε^(⊗r) and d_r=t^(−r)⊗v_r is the canonical period.
Inherited L0/L1/D uses of e_r mean d_r; L2 module/cocycle uses and L3/L4's
t^(−r)e_r mean v_r. Arithmetic Frobenius, HT(Q_p(1))=+1,
inverse-character specialization, raw Col_0 versus Col=−Col_0, row
coordinates, analytic versus bounded coefficients, and integral versus rational
images are fixed in the introduction and Lean note. Editions sharing a title
are kept separate: D.1 `Berger2003` is arXiv, L3 `Berger2003` is Documenta;
D.1 `Berger2003DM` is the same Documenta file as the latter. Shared URLs retain
all source aliases and relevant locator lists.

## Cross-part reference repairs

The following list gives the replacements for bare L0/L1/L2 references.
Other prerequisites of each node are retained. All replacement IDs exist in
the D.1 packet; the resulting combined local node graph is checked for cycles.

- `PadicHodgeRegulators:L3/crystalline-regulator`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`.
- `PadicHodgeRegulators:L3/big-exponential-obstruction`: `PadicHodgeRegulators:L0` → `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`.
- `PadicHodgeRegulators:L3/big-exponential`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/fontaine-iwasawa-map`.
- `PadicHodgeRegulators:L3/meromorphic-twist-extension`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/local-iwasawa-twist`; `PadicHodgeRegulators:L2/twist-compatibility`.
- `PadicHodgeRegulators:L3/ramified-interpolation`: `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L1/bloch-kato-logarithm`; `PadicHodgeRegulators:L1/dual-exponential`; `PadicHodgeRegulators:L1/twist-and-change-of-field`; `PadicHodgeRegulators:L2/character-specialisation`.
- `PadicHodgeRegulators:L3/unramified-interpolation`: `PadicHodgeRegulators:L1` → `PadicHodgeRegulators:L1/bloch-kato-logarithm`; `PadicHodgeRegulators:L1/dual-exponential`.
- `PadicHodgeRegulators:L3/naturality-and-lattice`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`; `PadicHodgeRegulators:L2/generator-independence`; `PadicHodgeRegulators:L2/root-change`.
- `PadicHodgeRegulators:L3/explicit-reciprocity`: `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L1/dual-exponential`; `PadicHodgeRegulators:L1/local-duality-of-conditions`; `PadicHodgeRegulators:L1/twist-and-change-of-field`; `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/local-iwasawa-twist`; `PadicHodgeRegulators:L2/character-specialisation`.
- `PadicHodgeRegulators:L3/regulator-determinant`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.
- `PadicHodgeRegulators:L3/tate-coleman-comparison`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/kummer-coleman-comparison`; `PadicHodgeRegulators:L2/root-change`.
- `PadicHodgeRegulators:L3/rubin-coleman-map`: `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L1/bloch-kato-subgroups`; `PadicHodgeRegulators:L1/dual-exponential`; `PadicHodgeRegulators:L2/character-specialisation`.
- `PadicHodgeRegulators:L4/noncritical-refinement`: `PadicHodgeRegulators:L0` → `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`.
- `PadicHodgeRegulators:L4/specialization-subspaces`: `PadicHodgeRegulators:L0` → `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`.
- `PadicHodgeRegulators:L4/signed-local-condition`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`; `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.
- `PadicHodgeRegulators:L4/derham-regulator`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/fontaine-iwasawa-map`.
- `PadicHodgeRegulators:L4/derham-interpolation-growth`: `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L1/bloch-kato-exponential`; `PadicHodgeRegulators:L1/bloch-kato-logarithm`; `PadicHodgeRegulators:L1/dual-exponential`; `PadicHodgeRegulators:L2/character-specialisation`.
- `PadicHodgeRegulators:L4/crystalline-derham-comparison`: `PadicHodgeRegulators:L2` → `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/character-specialisation`.
- `PadicHodgeRegulators:L1/dimension-formulas`: remove the duplicate `ArithmeticGaloisDuality:D7/duality-after-localization` prerequisite.

## Consuming gaps found during assembly

1. **Tate Kummer sign.** L2's actual supplier statement contains s∈{±1};
   L3's source-normalized ell_0 Col_0 formula requires an identified Kummer
   convention. CC99 I.4.1/IV.2.1 and V.3.2, Berger II.5–II.6, and LZ
   §6.4.2/Appendix B were inspected for this crossing. CC's V.3.2 proof uses
   (1−τ), while the declared Selmer Kummer cocycle uses τ(α)/α. Assembly
   does not choose a sign or change either reviewed theorem. The L3 Tate
   comparison and its use in the Rubin comparison carry the gap explicitly.
2. **Normalized Iwasawa pairing.** L1 supplies finite-level dual exponential
   and local-duality contracts, and L2 supplies h_Iw and specialization. The
   read Selmer L3 cohomology/Shapiro/descent/twist nodes do not define the
   required Λ-valued local cup-product pairing or its normalized
   specialization. A precise Selmer L3 request now names the inverse-action
   involution and D7 local invariant/trace compatibility. L3 reciprocity and
   determinant nodes retain this gap, including the adjunction sign check;
   the source's −σ_{−1}ell_0 factor is preserved.
3. **General Robba modules.** L2/fontaine-iwasawa-map and
   L2/character-specialisation apply to étale modules attached to
   representations. They support only that branch of the general L4 de Rham
   construction. RJ's general D/N_rig(D) still needs the existing PG.5
   Nakamura comparison request and its differential/localization interface.
   The consuming L4 nodes explicitly retain that distinction; no general
   étaleness hypothesis has been added.

These are new consuming gap records, not revised mathematical statements.
An assembly review should check these crossings while retaining both original
part verdicts. Resolving a sign by changing a formula would require a further
mathematical review.

## Requests to suppliers

All external requests from both parts are reproduced below with their exact
contracts and consumers. The former internal request to
`PadicHodgeRegulators:L2` is replaced by the reference repairs above: it asked
for h_Iw, twists, roots, lattice/scalar-extension/generator squares and the
nonnegative no-trivial-quotient Wach ψ-one equality, now named directly.
PG integral carriers/comparisons remain external requests; named local nodes
do not prove those supplier contracts.

### D.1 request 1: MotivicEtaleKTheory:M.7

Soulé's étale Chern classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) for rings R with n invertible (fields, p-adic integer rings with p ∤ n replaced by their generic fibres, number rings), natural in R, compatible with the coefficient maps n | n', with products and with transfers (corestriction), and Soulé's product formula — planned in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory), as RT-AREA-ktheory-2/18 directs, so that HabiroNumberFields HB.1/HB.2 and PadicHodgeRegulators D.2 import one construction.

Consumers: `PadicHodgeRegulators:D.2/etale-regulator`.

### D.1 request 2: MotivicEtaleKTheory:M.1

The continuous realisation K_{2n−1}(F) → H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) obtained from the classes c_{n,1} with p-power coefficients, its agreement with the Kummer map for n = 1, and its compatibility with restriction and transfer.

Consumers: `PadicHodgeRegulators:D.2/etale-regulator`.

### D.1 request 3: Polylogarithms:P.4

De Jeu's complexes M̃^{(n)}(F) (n ≥ 2; in weight two M̃^{(2)}(F) → ∧²F^×_Q) of a field of characteristic 0 and its subcomplex M̃^{(2)}(O) for a discrete valuation ring O ⊂ F generated by special units (Besser–de Jeu §3), with the map H^1(M̃^{(2)}(F)) → K_3^{(2)}(F) and its comparison, up to the sign fixed by de Jeu, with Suslin's isomorphism B(F) ⊗ Q ≅ K_3^ind(F) ⊗ Q of K3BlochGroups V.4/V.6; in weight n, the map H^1(M̃^{(n)}(F)) → K^{(n)}_{2n−1}(F) for number fields (an isomorphism for n = 2, 3 and for cyclotomic fields) and the cyclotomic symbols [ζ]_n.

Consumers: `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`; `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`.

### D.1 request 4: CrystallineCohomology:CR.5

Absolute log-crystalline cohomology RΓ_cr(X, J^{[r]})_n of fs log-schemes X log-smooth over O_K^× (O_K a complete DVR of mixed characteristic with perfect residue field, any ramification), with its divided-power filtration, Frobenius, base change in n and the Cartier-type hypotheses needed for the Hyodo–Kato comparison.

Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`.

### D.1 request 5: CrystallineCohomology:CR.3

Frobenius on absolute crystalline cohomology of smooth O_K-schemes, compatible with the PD filtration, used in the non-log case of the syntomic complex.

Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`.

### D.1 request 6: CrystallineCohomology:CR.2

The crystalline (PD) Poincaré lemma for the relative period rings A_cr(R) of small semistable O_K-algebras (Tsuji, as used by Colmez–Nizioł §4.7), identifying Galois cochains in the PD de Rham complex of the envelope with Galois cochains in [F^r A_cr(R) → A_cr(R)].

Consumers: `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`.

### D.1 request 7: AInfCohomology:AI.4

The relative period rings A_cr(R) and their filtration and Frobenius for small (semistable, log) O_K-algebras R, with the Galois action of G_R, as used in the local construction of the Fontaine–Messing–Kato period map.

Consumers: `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`.

### D.1 request 8: DerivedDeRhamCohomology:DD.2

Algebraic de Rham cohomology of smooth K-schemes with its Hodge filtration, functorial in X, and the comparison of Fil^n RΓ_dR(X_K) with the de Rham term of rigid syntomic cohomology.

Consumers: `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`.

### D.1 request 9: PhiGammaModulesAndIwasawaCohomology:PG.5

For p odd, E/Q_p finite and T a free O_E-lattice with continuous G_{Q_p}-action: instantiate PG.5/psi-complex on D(T) over O_E ⊗ A_{Q_p} with the actual ψ of PG.4; construct the quasi-isomorphism to SelmerIwasawaCohomology:L3/iwasawa-cohomology; prove that D(T)^{ψ=1} → lim_cor H^1(Q_p(μ_{p^n}), T) is a Λ_{O_E}(G_∞)-linear bijection whose n-th component (n ≥ 1) is Cherbonnier–Colmez's ℓ(γ_n)ι_{φ,γ_n}(x_n, y) (their Proposition I.4.1 cocycle); H^2_Iw ≅ D(T)/(ψ − 1); compatibility with O_{E'} ⊗ − and with H^1_Iw(V) = H^1_Iw(T) ⊗ Q.

Consumers: `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.

### D.1 request 10: PhiGammaModulesAndIwasawaCohomology:PG.6

Wach modules: for an E-linear crystalline V of G_{Q_p} with Hodge–Tate weights in [a; b] (HT(E(1)) = +1) and a G-stable O_E-lattice T, N(T) is free of rank d over O_E ⊗ A^+_{Q_p}, Γ-trivial modulo π, N(T) = N(V) ∩ D(T), φ(π^b N) ⊆ π^b N with π^b N/φ^*(π^b N) killed by q^{b−a}; N(T(j)) = π^{−j}N(T) ⊗ e_j; N(T) ⊆ φ^*N(T) when a ≥ 0; the inclusion-preserving lattice bijection (Berger, Limites III.4.2); and the φ-module isomorphism N(V)/πN(V) ≅ D_cris(V).

Consumers: `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`; `PadicHodgeRegulators:L2/twist-compatibility`; `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.

### D.1 request 11: PhiGammaModulesAndIwasawaCohomology:PG.4

The actual ψ on O_E ⊗ A_{Q_p} and on D(T): ψφ = id, ψ(φ(λ)x) = λψ(x), Γ-equivariance and integrality; ψ(π^{−1}) = π^{−1} and ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) with Q_m ∈ Z_p[X] (Berger, Lemma A.4).

Consumers: `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`.

### D.1 request 12: PhiGammaModulesAndIwasawaCohomology:PG.1

The O_E-linear Fontaine equivalence with D(T(η)) = D(T) ⊗ e_η for continuous characters η of G_∞ (φ and ψ acting on the first factor, g acting by η(g)g), D(O_{E'} ⊗ T) = O_{E'} ⊗ D(T), D(T) free and D(T) ⊂ D(V).

Consumers: `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/twist-compatibility`; `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`.

### D.1 request 13: CohomologyComparisons:CP.4

The Hyodo–Kato (φ, N)-structure on H^1_dR of a curve with semistable reduction over O_K and its comparison with H^1_et(X_K̄, Q_p) (semistable comparison), used to state the bad-reduction regulator input. Separately, route the integral/open classical log-syntomic construction to an EARLY prefix of CohomologyComparisons Part II after CR.5/CR.6, as required by the accepted RT-AREA-iwasawa-2/3 verification. Name that producer rather than importing the late proper rational B_st comparison as its construction. Required contracts: CN’s undivided complex and its divided counterpart, a directed integral period morphism into the modified twist, the exact small-range comparison and the formal semistable exponential with its distinct i≤r−1/i=r ranges.

Consumers: `PadicHodgeRegulators:D.5/semistable-input-boundary`; `PadicHodgeRegulators:D.2/log-syntomic-complex`; `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`; `PadicHodgeRegulators:D.2/small-twist-comparison`; `PadicHodgeRegulators:D.2/syntomic-exponential`.

### D.1 request 14: tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places

The named semilocal equivalence F ⊗_Q Q_p ≅ ∏_{v|p} F_v (and O_F ⊗ Z_p ≅ ∏ O_v) with its characteristic property, as planned in that layer; this roadmap uses it as given.

Consumers: `PadicHodgeRegulators:D.1/combined-dilogarithm`; `PadicHodgeRegulators:D.1/unit-logarithm-kernel`; `PadicHodgeRegulators:D.3/unramified-etale-algebra`; `PadicHodgeRegulators:D.4/global-p-adic-regulator`; `PadicHodgeRegulators:L1/semilocal-bloch-kato`.

### D.1 request 15: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

Import the local unit filtration, canonical Teichmüller splitting and p-adic log/exp isomorphism on sufficiently deep units from upstream Layer 1. For finite L/Q_p, kernel(log on O_L^×)=μ(L); for unramified L and odd p, log:1+pO_L≅pO_L. Check agreement with the pinned TauCeti.teichmuller section and Coleman’s Iwasawa branch, without rebuilding the upstream carrier.

Consumers: `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`; `PadicHodgeRegulators:D.1/unit-logarithm-kernel`; `PadicHodgeRegulators:L1/integral-logarithm-unramified`.

### D.1 request 16: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

Import finite unramified extension classification, existence/uniqueness of arithmetic Frobenius and the integer-ring identification O_L≅W(F_q), natural under embeddings and finite products, including the agreement of Frobenius with WittVector.frobenius. IsArithFrobAt only states a residue congruence; FormallyUnramified on the generic characteristic-zero field only states separability. Supply the specialized product interface retained at D.3/unramified-etale-algebra.

Consumers: `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`; `PadicHodgeRegulators:D.3/unramified-etale-algebra`.

### D.1 request 17: ArithmeticGaloisDuality:R02.4

For K/Q_p finite and finite-dimensional continuous Q_p-representation V, provide the perfect cup-product pairings H^i(K,V)×H^{2−i}(K,V*(1))→Q_p, the invariant identification H²(K,Q_p(1))≅Q_p, finite-dimensional H^i(K,V), vanishing above 2 and the local Euler characteristic dim H⁰−dim H¹+dim H²=−[K:Q_p]dim V, obtained by finite coefficients, a stable lattice, inverse limits and rationalization. It must agree with the read D7/local-invariant-trivialization and D7/duality-after-localization pairings; a discrete class-formation Ext theorem alone is not this statement. The result must apply to every finite K/Q_p, without assuming that K is already presented as a completion of a chosen global field.

Consumers: `PadicHodgeRegulators:L1/bloch-kato-logarithm`; `PadicHodgeRegulators:L1/dimension-formulas`; `PadicHodgeRegulators:L1/local-duality-of-conditions`; `PadicHodgeRegulators:L1/tate-twist-examples`; `PadicHodgeRegulators:L1/dual-exponential`.

### L3 request 1: PadicMeasuresIwasawaAlgebras:L2

Bounded Lambda_E=O_E[[G]][1/varpi], character-chart evaluation, bounded division by X-x, nonzero factors and integral augmentation; the existing unit-measure Amice equivalence is reused exactly and is not the unbounded Mellin theorem.

Consumers: `PadicHodgeRegulators:L4/good-wach-basis`; `PadicHodgeRegulators:L4/split-multiplicative-augmentation`.

### L3 request 2: PhiGammaModulesAndIwasawaCohomology:PG.6

Actual integral Wach modules, gamma-trivial reduction, phi* inclusion, D_cris comparison and t/pi comparison elementary divisors of LLZ2.3; regulator-specific good-basis consequence is owned and planned here.

Consumers: `PadicHodgeRegulators:L3/crystalline-regulator`; `PadicHodgeRegulators:L3/growth`; `PadicHodgeRegulators:L4/good-wach-basis`; `PadicHodgeRegulators:L4/refinement-saturated-flag`; `PadicHodgeRegulators:L4/integral-image-index`.

### L3 request 3: PhiGammaModulesAndIwasawaCohomology:PG.4

Authentic continuous phi/psi on the coefficient/Wach/differential modules, psi phi=id and decompositions/localization; instantiate the existing PG.4/psi-one-to-zero algebra node rather than redefine it.

Consumers: `PadicHodgeRegulators:L3/big-exponential-obstruction`; `PadicHodgeRegulators:L4/analytic-differential-powers`.

### L3 request 4: LocallyAnalyticDistributions:L3

Full unbounded analytic Mellin module equivalence and integral/bounded inclusion, group-action/convolution linearity, Tate logarithm differentiation and change of roots; L3/finite-character-component-mellin currently treats only bounded finite-component charts.

Consumers: `PadicHodgeRegulators:L3/logarithmic-factors`; `PadicHodgeRegulators:L3/crystalline-regulator`; `PadicHodgeRegulators:L3/naturality-and-lattice`; `PadicHodgeRegulators:L4/good-wach-basis`; `PadicHodgeRegulators:L4/refinement-saturated-flag`; `PadicHodgeRegulators:L4/crystalline-derham-comparison`.

### L3 request 5: PadicMeasuresIwasawaAlgebras:L4

Finite O_E-length and pseudo-null module criteria over O_E[[X]], distinguished polynomial quotients, determinant/lattice comparison and bounded descent required by LLZ4.12.

Consumers: `PadicHodgeRegulators:L4/actual-coleman-image`; `PadicHodgeRegulators:L4/integral-image-index`.

### L3 request 6: LocallyAnalyticDistributions:L1

Open-disc analytic logarithm/division with removable values, analytic weight affinoids, constant-term restriction and locally analytic topology for actual period/distribution spaces.

Consumers: `PadicHodgeRegulators:L3/logarithmic-factors`; `PadicHodgeRegulators:L3/big-exponential-obstruction`; `PadicHodgeRegulators:L4/derham-character-domain`; `PadicHodgeRegulators:L4/derham-interpolation-growth`.

### L3 request 7: LocallyAnalyticDistributions:L2

Order-h distributions and seminorm transfer under Mellin; analytic uniqueness on each proved dense character set; elementary-divisor/Bézout theory for actual H_E analytic algebra, including closed finite submodules and the needed Frechet–Stein input.

Consumers: `PadicHodgeRegulators:L3/growth`; `PadicHodgeRegulators:L4/logarithmic-elementary-divisors`; `PadicHodgeRegulators:L4/actual-coleman-image`; `PadicHodgeRegulators:L4/regulator-elementary-divisors`.

### L3 request 8: PhiGammaModulesAndIwasawaCohomology:PG.5

Actual psi complex to derived corestriction Iwasawa-cohomology comparison and specialization, including integral and finite coefficient-extension hypotheses. Generic Herr algebra is insufficient. For RJ, also supply Nakamura’s Iwasawa cohomology and exponential comparison for general de Rham Robba modules; no etaleness assumption is imposed by RJ I.15/I.27. The representation-level Iwasawa specialization retains its separate etale comparison.

Consumers: `PadicHodgeRegulators:L3/crystalline-regulator`; `PadicHodgeRegulators:L4/derham-regulator`.

### L3 request 9: PadicMeasuresIwasawaAlgebras:L5

Determinant lines and duality comparison for the genuine rank-d Iwasawa complex used in delta(V); identify component ideals with the correct H_E scalar extension.

Consumers: `PadicHodgeRegulators:L3/regulator-determinant`.

### L3 request 10: SelmerIwasawaCohomology:L3

Actual inverse-corestriction singular local quotients, source topology and finite-level maps for RubinIII.5.14; integral H_f is the preimage of rational H_f, not a freely selected lattice.

Consumers: `PadicHodgeRegulators:L3/rubin-coleman-map`.

### L3 request 11: PadicHodgeTheory:R06.2

Authentic D_cris/D_dR filtered, tensor, dual, Tate and finite-coefficient-extension comparisons; induced filtered subspaces and weak admissibility for the refinement input.

Consumers: `PadicHodgeRegulators:L4/noncritical-refinement`.

### L3 request 12: AutomorphicGaloisRepresentations:R19.5

Proved local geometric crystalline/de Rham comparison for the modular representation at the stated prime, identification of the ordered differential/Frobenius basis and periods. Resolve the legacy R11 reference through an actual source-specific supplier; do not treat NeronModels as modular-curve comparison.

Consumers: `PadicHodgeRegulators:L4/modular-specialization`.

### L3 request 13: PhiGammaModulesAndIwasawaCohomology:PG.2

Actual general de Rham differential module N_rig(D), its phi/psi/partial identities, overconvergence threshold and localization, including inclusion t^-a D subset N_rig(D) subset t^-b D. Add this in the supplier direction, as PartII if outside its current contract.

Consumers: `PadicHodgeRegulators:L4/derham-character-domain`; `PadicHodgeRegulators:L4/analytic-differential-powers`; `PadicHodgeRegulators:L4/derham-regulator`.

### L3 request 14: PadicHodgeTheory:P7

Robba annulus norms, differential bounds, de Rham localization embeddings/constant terms and N_rig differential-module interface supporting RJ I.3/I.9/I.13/I.17. Extend the supplier as PartII where its foundational annulus scope needs extension.

Consumers: `PadicHodgeRegulators:L4/derham-character-domain`; `PadicHodgeRegulators:L4/analytic-differential-powers`; `PadicHodgeRegulators:L4/derham-regulator`; `PadicHodgeRegulators:L4/derham-interpolation-growth`.

### L3 request 15: PadicMeasuresIwasawaAlgebras:L0a

Actual locally analytic character weight space with torsion components, q coordinate, finite conductor indexing and analytic binomial functions; admitted open balls and restriction/gluing interfaces.

Consumers: `PadicHodgeRegulators:L4/derham-character-domain`; `PadicHodgeRegulators:L4/analytic-differential-powers`.

### L3 request 16: SelmerIwasawaCohomology:L3

The actual local Iwasawa cup-product pairing on inverse-corestriction H^1(Q_p(mu_{p^n}),T) and its Tate dual, with values in Lambda, coefficient extension and finite-level specialization. Specify the inverse-action involution in the second variable and the local invariant/trace normalization, using ArithmeticGaloisDuality D7 local pairings. The read L3 cohomology, Shapiro, descent and twist nodes do not by themselves supply this pairing or its normalized specialization identity (LZ Section 2.6 and Appendix B.6).

Consumers: `PadicHodgeRegulators:L3/explicit-reciprocity`; `PadicHodgeRegulators:L3/regulator-determinant`.

## Restructuring proposals for the maintainer

The seven input proposals are collected here without applying them or changing atlas data. The maintainer must resolve ownership and supplier scope; no additional job was claimed.

### D.1 proposal 1

Action: **extend**. Roadmaps: `CohomologyComparisons`, `PadicHodgeRegulators`, `CrystallineCohomology`.

Name and plan an early classical integral/open log-syntomic prefix in CohomologyComparisons Part II after CR.5/CR.6. It owns the undivided/divided complexes, integral Fontaine–Messing–Kato map with modified twists, exact small-range comparison and the formal semistable exponential. The four retained D.2 IDs are required imported contracts, not new carriers. Generic semistable D.5 imports this prefix when available. Keep the rigid good-reduction regulator path independent of the full log package; do not use the late CP.4 B_st theorem as a substitute or accept rejected paper routes.

Reason: RT-AREA-iwasawa-2/3 is confirmed, but its verifier explicitly rejects generic D.2 ownership: PAPER-COLMEZ-NIZIOL-17 route 5 and the analogous CDN20 route 7 remain rejected; RS-26 retains smooth/unramified regulator D.2. The previous packet contradicted this boundary.

### D.1 proposal 2

Action: **rescope**. Roadmaps: `PadicHodgeRegulators`.

Merge L0 into L1 as its opening section 'Conventions and imported period-ring interface', keeping the three node ids; L3/L4's L0 prerequisites then point at L1.

Reason: The library audit classes L0 as a process layer: it introduces no carrier. Its three nodes are convention and interface comparisons (Hodge–Tate sign, twists, the fundamental sequences and the integral small-weight interface) consumed by L1–L4 and D.2.

### D.1 proposal 3

Action: **rescope**. Roadmaps: `PadicHodgeRegulators`, `SelmerIwasawaCohomology`.

Delete the edge PadicHodgeRegulators:L1 → SelmerIwasawaCohomology:L2 and keep PadicHodgeRegulators:L1 → SelmerIwasawaCohomology:L4.

Reason: RT-AREA-iwasawa-1/19: the stage edge PadicHodgeRegulators:L1 → SelmerIwasawaCohomology:L2 makes the generic Selmer layer depend on p-adic Hodge theory, although L2's unramified, strict, relaxed and Greenberg conditions do not use Bloch–Kato maps. The consumer in this packet's supply list is SelmerIwasawaCohomology:L4/bloch-kato-condition.

### D.1 proposal 4

Action: **split**. Roadmaps: `MotivicEtaleKTheory`, `HabiroNumberFields`, `PadicHodgeRegulators`.

Plan Soulé's classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) and the product formula once, in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory); HB.1, HB.2 and D.2/etale-regulator import it (request recorded on MotivicEtaleKTheory:M.7). HB.1 keeps the K_3 specialisation c_ζ and the χ^{−1}-identification.

Reason: RT-AREA-ktheory-2/18: Soulé's étale Chern classes with finite coefficients and their product formula are planned in MotivicEtaleKTheory M.8, HabiroNumberFields HB.1/HB.2 and needed by D.2; M.8 itself requires D.2, so D.2 cannot import M.8.

### D.1 proposal 5

Action: **extend**. Roadmaps: `ColemanIntegration`, `PadicHodgeRegulators`.

ColemanIntegration, Part II: Vologodsky integration on curves with semistable reduction (its comparison with glued Coleman integrals and harmonic cochains), imported by PadicHodgeRegulators D.5/semistable-input-boundary and by EllipticRegulators for bad reduction.

Reason: The bad-reduction symbol formula for curves needs Vologodsky integration (Besser–Zerbes, Besser–Raskind, Besser 2021), which no roadmap plans.

### L3 proposal 1

Qualify L3’s normalized regulator codomain by the weight range

Reason: The read LZ equation(10) uses Frac(H_E) for general crystalline twists. Preserve intrinsic H_E output in the no-trivial-quotient nonnegative Wach range, and state meromorphic extension plus any proved cancellation range explicitly. No source here proves the unqualified stage sentence.

### L3 proposal 2

PhiGammaModulesAndIwasawaCohomology, Part II: differential de Rham module and Nakamura comparison

Reason: Import N_rig(D), its localization/differential API and exponential comparison once from the phi/Gamma owner. L4 plans the regulator analytic powers and character-domain construction only; PHT owns annulus foundations. The supplier must assess whether PG.2 already covers this or a PartII is required.

## Remaining work and where to resume

No assembly step remains. The mathematical blueprint still has the following obligations; resolve them in their owning jobs rather than treating this assembly as full closure.

### D.1 layer coverage

- `PadicHodgeRegulators:D.1` — **planned**: At lemma level, split D.1/etale-algebra-dilogarithm's API (functoriality, five-term, roots of unity) into lemma nodes. The field-general projective five-term and Bloch descent inherit ColemanIntegration's recorded supplier gap.
- `PadicHodgeRegulators:D.2` — **planned**: Besser–de Jeu Conjecture 1.14 for non-special presentations (gap). Check the upper end of the Kato–Kurihara–Tsuji range at the original sources (gap). Name/plan the early shared classical log-syntomic supplier; specify the actual integral period map and divided/undivided normalization before asserting the exact integral comparison.
- `PadicHodgeRegulators:D.3` — **planned**: Lemma-level decomposition of the Taylor-expansion step of D.3/dilogarithm-integrality. Exact 5-adic recomputation of GSWZ Example 4.3 as an executable acceptance test.
- `PadicHodgeRegulators:D.4` — **planned**: The p-adic K_3 regulator injectivity proposition is stated, not proved; no layer proves it.
- `PadicHodgeRegulators:D.5` — **partial**: Pushforward compatibility of the curve regulator (gap). Coleman integration with colliding supports and genus ≥ 1 inherited gaps. K_2 integrality for genus ≥ 2 (gap). Specialisation in families (gap). Owner for Vologodsky integration (restructure). Add a sourced target node for specialization in smooth families, including its relative syntomic construction; a gap mention is not a target node. State and source the full semistable symbol formula, its monodromy restrictions and target quotient; this packet establishes only NN factorization and BZ integration comparison. Supply the modified-versus-rigid model comparison and transported K-structure used by the two curve identifications.
- `PadicHodgeRegulators:L0` — **planned**: Restructure proposal: merge into L1 (audit verdict 'process').
- `PadicHodgeRegulators:L1` — **planned**: Cross-check the sign of the dual-exponential adjunction against L3/explicit-reciprocity. Close the noncircular de Rham local-duality descent and rational Euler-characteristic request.
- `PadicHodgeRegulators:L2` — **planned**: Requests to PhiGammaModulesAndIwasawaCohomology PG.1, PG.4, PG.5, PG.6 (their packet has nodes only in PG.3–PG.5). Fix the sign of Cherbonnier–Colmez's δ_n (gap).

### D.1 gaps

- **The dilogarithm formula for arbitrary Bloch elements (Besser–de Jeu Conjecture 1.14, n = 2)**: That the p-adic regulator of the class of Σ n_i[z_i] ∈ B(F) ⊗ Q equals ±Σ n_i D(σ z_i) is proved only when every z_i is a special unit of the valuation ring at p (BdJ Theorems 1.6(2), 1.10) or a root of unity (Theorem 1.12). For general presentations it is BdJ's Conjecture 1.14, open even for n = 2 in every source read. GSWZ (19) asserts the general identity (sourceIssues E101). The packet defines D_p on completed K_3 as the regulator, so Theorem 9 and the Habiro export do not depend on the conjecture; only the explicit evaluation of D_p by dilogarithms of non-special symbols does.
  Consumers: `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`; `PadicHodgeRegulators:D.4/special-unit-formula`.
- **Upper end of the Kato–Kurihara–Tsuji range**: Colmez–Nizioł quote the exact comparison for i ≤ r ≤ p − 1; Nekovář–Nizioł use r ≤ p − 2. The original statements of Kato, Kurihara and Tsuji were not read. The packet relies only on r ≤ p − 2 (weight two for p ≥ 5).
  Consumers: `PadicHodgeRegulators:D.2/small-twist-comparison`.
- **Sign of Cherbonnier–Colmez's δ_n against the Kummer cocycle**: With τ[u_n] = [ε]^{c(τ)}[u_n], (1 − τ)(log[u_n]·t^{−1} ⊗ e_1) = −c(τ)e_1, so Cherbonnier–Colmez's δ_n appears to be minus the Kummer map τ ↦ τ(α)/α unless they use α/τ(α). The sign s of L2/kummer-coleman-comparison, and through it L3/tate-coleman-comparison's Col = −Col_0, must be fixed by a careful reading of CC99 §V.3; the computation in this job is not a confirmed source error.
  Consumers: `PadicHodgeRegulators:L2/kummer-coleman-comparison`.
- **Pushforward compatibility of the curve regulator**: No source read proves that the rigid syntomic regulator on K_2 of curves commutes with finite pushforward. The node gives a route through the étale comparison (D.5/curve-etale-comparison) and corestriction compatibility of the étale regulator; Asakura and Besser–Loeffler–Zerbes use the compatibility without proof in the sources read.
  Consumers: `PadicHodgeRegulators:D.5/curve-regulator-functoriality`.
- **Coleman integration with colliding supports and in genus at least one**: ColemanIntegration L1 integrates only on Y = 𝒳 ∖ D with D finite étale (one point of D per residue disc); symbols whose divisors collide modulo p need Coleman integration on general wide opens, which no layer owns. ColemanIntegration's recorded gaps 'Independence of the Frobenius lift and functoriality when Ω+ is not free' and 'Algebraic de Rham comparison for good-reduction affine curves' are inherited for genus ≥ 1.
  Consumers: `PadicHodgeRegulators:D.5/coleman-symbol-formula`; `PadicHodgeRegulators:D.5/curve-syntomic-regulator`.
- **K_2 integrality for curves of genus at least two**: The identification K_2(𝒳)_Q → K_2(X)_Q ∩ ker(tame symbols) used to feed symbols into the regulator needs Harder-type finiteness; EllipticKTheory supplies it only for elliptic curves (E.5/harder-finiteness).
  Consumers: `PadicHodgeRegulators:D.5/curve-syntomic-regulator`.
- **Vologodsky integration has no owner**: ColemanIntegration Part II is the proposed owner of the missing semistable Vologodsky integration interface. BZ Theorem 1.1 was read, but it does not give the weight-two regulator formula or a ker N restriction. Source and state the full formula and monodromy/convenient-quotient hypotheses before claiming that target.
  Consumers: `PadicHodgeRegulators:D.5/semistable-input-boundary`.
- **Specialisation of curve regulators in families**: Specialisation of the syntomic regulator to fibres of a smooth family (Asakura, Theorem 4.9, via Asakura–Miyatani arXiv:2007.14255) was not read; only base change along finite unramified extensions is planned.
  Consumers: `PadicHodgeRegulators:D.5/curve-regulator-functoriality`.
- **Early shared classical log-syntomic producer**: Name and plan the early CohomologyComparisons Part II producer required by the accepted RT-AREA-iwasawa-2/3 review. Its current CP.4 rational proper B_st theorem is not the integral/open producer. The four D.2 comparison nodes preserve the required interfaces without claiming ownership or completion.
  Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`; `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`; `PadicHodgeRegulators:D.2/small-twist-comparison`; `PadicHodgeRegulators:D.2/syntomic-exponential`; `PadicHodgeRegulators:D.5/semistable-input-boundary`.
- **Integral period morphism and divided-Frobenius normalization**: CN §5.1.1 defines the undivided p^r−φ complex; classical divided-Frobenius complexes and period-map normalizations must be compared by directed integral maps. A p^r-exact fundamental sequence is not an invertible quasi-isomorphism in D(Z/p^n). Supply the genuine integral morphism and the exact classical small-range convention before using an integral isomorphism; the rational comparison alone does not close this gap.
  Consumers: `PadicHodgeRegulators:D.2/log-syntomic-complex`; `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`; `PadicHodgeRegulators:D.2/small-twist-comparison`.
- **Noncircular de Rham local-duality descent**: FO Theorem 9.27 is semistable. Import potential semistability and prove descent of H_f under finite Galois extension with exact rational invariants/res-cor; alternatively give a freely readable direct de Rham source for all three exact annihilator statements. The ℓ≠p clause has been narrowed to the finite unramified p-primary modules of the read supplier; an extension to other torsion modules would require a stronger statement.
  Consumers: `PadicHodgeRegulators:L1/local-duality-of-conditions`.
- **Curve modified-versus-rigid comparison maps**: Specify the rigid-to-fixed-q-Frobenius modified-model map of Besser 8.6(2),(3), identify the raw boundary ι, and prove Θ=(1−φ/q²)^{-1}ι^{-1} is the map whose composition with the étale edge equals exp_BK. Track the K-module structure transported from the modified model and the σ-semilinear versus q-linear Frobenius. AC footnote 4 checks only the Q_p case, not a substitution of one Frobenius for the other.
  Consumers: `PadicHodgeRegulators:D.5/curve-weight-two-target`; `PadicHodgeRegulators:D.5/curve-etale-comparison`.
- **Missing Lean signatures for supplier-dependent carriers**: Most period-ring, p-adic representation, cohomology and K-theory carriers are absent at the pinned baseline. The suggested file gives explicitly UNELABORATED mathematical contracts, not Lean theorem/API signatures or executable examples for these objects. Its successful elaboration checks only the native polynomial, finite-field, product-field and linear-algebra signatures. Do not treat comment-name coverage as compliance with PROTOCOL §13 or formalization; turn each contract into typed signatures as its suppliers become available.
  Consumers: `PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions`; `PadicHodgeRegulators:L0/fundamental-exact-sequences`; `PadicHodgeRegulators:L0/integral-period-interface`; `PadicHodgeRegulators:L1/bloch-kato-subgroups`; `PadicHodgeRegulators:L1/bloch-kato-exponential`; `PadicHodgeRegulators:L1/bloch-kato-logarithm`; `PadicHodgeRegulators:L1/dual-exponential`; `PadicHodgeRegulators:L1/dimension-formulas`; `PadicHodgeRegulators:L1/local-duality-of-conditions`; `PadicHodgeRegulators:L1/twist-and-change-of-field`; `PadicHodgeRegulators:L1/tate-twist-examples`; `PadicHodgeRegulators:L1/abelian-variety-logarithm`; `PadicHodgeRegulators:L1/integral-logarithm-unramified`; `PadicHodgeRegulators:L1/semilocal-bloch-kato`; `PadicHodgeRegulators:L2/fontaine-iwasawa-map`; `PadicHodgeRegulators:L2/generator-independence`; `PadicHodgeRegulators:L2/root-change`; `PadicHodgeRegulators:L2/local-iwasawa-twist`; `PadicHodgeRegulators:L2/twist-compatibility`; `PadicHodgeRegulators:L2/wach-psi-fixed-vectors`; `PadicHodgeRegulators:L2/character-specialisation`; `PadicHodgeRegulators:L2/lattice-and-coefficient-squares`; `PadicHodgeRegulators:L2/kummer-coleman-comparison`; `PadicHodgeRegulators:D.1/teichmuller-unit-decomposition`; `PadicHodgeRegulators:D.1/unramified-frobenius-on-roots`; `PadicHodgeRegulators:D.1/etale-algebra-dilogarithm`; `PadicHodgeRegulators:D.1/dilogarithm-scalar-extension`; `PadicHodgeRegulators:D.1/combined-dilogarithm`; `PadicHodgeRegulators:D.1/regulator-normalisation-dictionary`; `PadicHodgeRegulators:D.1/unit-logarithm-kernel`; `PadicHodgeRegulators:D.1/logarithm-norm-trace`; `PadicHodgeRegulators:D.2/etale-regulator`; `PadicHodgeRegulators:D.2/rigid-syntomic-cohomology`; `PadicHodgeRegulators:D.2/syntomic-regulator`; `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`; `PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison`; `PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison`; `PadicHodgeRegulators:D.2/gros-normalisation`; `PadicHodgeRegulators:D.2/log-syntomic-complex`; `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`; `PadicHodgeRegulators:D.2/small-twist-comparison`; `PadicHodgeRegulators:D.2/syntomic-exponential`; `PadicHodgeRegulators:D.3/unramified-etale-algebra`; `PadicHodgeRegulators:D.3/completed-k3-unramified`; `PadicHodgeRegulators:D.3/completed-k3-bloch-description`; `PadicHodgeRegulators:D.3/finite-polylogarithm`; `PadicHodgeRegulators:D.3/finite-polylogarithm-reduction`; `PadicHodgeRegulators:D.3/dilogarithm-integrality`; `PadicHodgeRegulators:D.3/residue-spanning`; `PadicHodgeRegulators:D.3/root-of-unity-classes`; `PadicHodgeRegulators:D.3/local-regulator`; `PadicHodgeRegulators:D.3/unramified-regulator-theorem`; `PadicHodgeRegulators:D.3/roots-of-unity-generate`; `PadicHodgeRegulators:D.4/global-p-adic-regulator`; `PadicHodgeRegulators:D.4/special-unit-formula`; `PadicHodgeRegulators:D.4/norm-trace-compatibility`; `PadicHodgeRegulators:D.4/frobenius-compatibility`; `PadicHodgeRegulators:D.4/torsion-and-denominators`; `PadicHodgeRegulators:D.4/habiro-regulator-export`; `PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity`; `PadicHodgeRegulators:D.4/example-cubic-field-five-two`; `PadicHodgeRegulators:D.5/curve-weight-two-target`; `PadicHodgeRegulators:D.5/open-curve-splitting`; `PadicHodgeRegulators:D.5/curve-syntomic-regulator`; `PadicHodgeRegulators:D.5/coleman-symbol-formula`; `PadicHodgeRegulators:D.5/curve-etale-comparison`; `PadicHodgeRegulators:D.5/curve-regulator-functoriality`; `PadicHodgeRegulators:D.5/semistable-input-boundary`.

The D.1 review specifically leaves the following seven node contracts unverifiable:

- `PadicHodgeRegulators:L1/local-duality-of-conditions`: Removed the hidden dimension-formula proof cycle and the finite/discrete class-formation citation; imported the read D7 rational pairing interface. FO proves the semistable case, while de Rham descent of H_f is left as a precise supplier gap. Remaining: The de Rham descent of the finite local condition, and the ramified torsion variant of the ℓ≠p clause, have not been justified by the read semistable/finite-unramified supplier statements. Narrowed the ℓ≠p torsion clause to finite unramified p-primary modules, matching the actual R02.4 supplier.
- `PadicHodgeRegulators:D.2/log-syntomic-complex`: Rehomed the generic construction to a required early CohomologyComparisons Part II contract, following the accepted red-team verification rather than its rejected D.2 ownership proposal. The source result is an imported contract, but the early CohomologyComparisons Part II producer has not been named or planned. No current CP.4 node supplies it; the full package must not become a prerequisite of every good-reduction regulator.
- `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`: Rehomed the generic construction to a required early CohomologyComparisons Part II contract, following the accepted red-team verification rather than its rejected D.2 ownership proposal. The source result is an imported contract, but the early CohomologyComparisons Part II producer has not been named or planned. No current CP.4 node supplies it; the full package must not become a prerequisite of every good-reduction regulator.
- `PadicHodgeRegulators:D.2/small-twist-comparison`: Rehomed the generic construction to a required early CohomologyComparisons Part II contract, following the accepted red-team verification rather than its rejected D.2 ownership proposal. The source result is an imported contract, but the early CohomologyComparisons Part II producer has not been named or planned. No current CP.4 node supplies it; the full package must not become a prerequisite of every good-reduction regulator.
- `PadicHodgeRegulators:D.2/syntomic-exponential`: Rehomed the generic construction to a required early CohomologyComparisons Part II contract, following the accepted red-team verification rather than its rejected D.2 ownership proposal. The source result is an imported contract, but the early CohomologyComparisons Part II producer has not been named or planned. No current CP.4 node supplies it; the full package must not become a prerequisite of every good-reduction regulator.
- `PadicHodgeRegulators:D.5/curve-weight-two-target`: Corrected the impossible cokernel proof using the full fibre sequence, read Besser 8.6/8.7/10.1 directly, and distinguished the modified q-Frobenius boundary from the normalized exponential identification. A fully specified comparison between these models remains required. Remaining: The fixed q-Frobenius modified-model comparison and its K-linear transport are described but not supplied as a carrier/map contract. Besser’s normalized 8.6(3) map cannot be silently identified with an arbitrary raw cone projection.
- `PadicHodgeRegulators:D.5/curve-etale-comparison`: Checked NN’s boundary/exponential statement, Besser 9.11 and AC footnote 4. Recorded the necessary modified-versus-rigid map identification; the q-power/raw-boundary convention cannot be justified by the point comparison alone. Remaining: The claimed general unramified K=q^{1/f} normalization still requires the explicit modified-to-rigid comparison of curve-weight-two-target; AC footnote 4 only gives K=Q_p.

### L3 layer coverage

- `PadicHodgeRegulators:L3` — **planned**: Discharge derivative-obstruction exactness, determinant normalization and cyclotomic growth gaps; elaborate the genuine supplier arithmetic signatures. Resolve the general-weight fractional/H_E codomain qualification and prove the Rubin construction input with its actual singular source.
- `PadicHodgeRegulators:L4` — **planned**: Discharge bounded image descent, the integral lower inclusion and analytic elementary-divisor supplier contracts. Supply N_rig/Nakamura comparisons and prove the exact crystalline/de Rham normalization square; elaborate arithmetic signatures.

### L3 gaps

- **Bounded evaluation, division and image descent**: The authentic O_E[[X]][1/varpi] instance needs bounded division, evaluation kernels and nonzero X-x. The LLZ4.12 determinant argument additionally needs a bounded-to-analytic image equality/descent theorem; equal H_E determinants do not prove equality of arbitrary bounded submodules.
  Consumers: `PadicHodgeRegulators:L4/constraint-basis`; `PadicHodgeRegulators:L4/actual-coleman-image`.
- **Actual arithmetic carrier signatures**: Pinned libraries have no native Wach, D_cris/D_dR, H_Iw, full analytic-distribution or differential Robba-module carrier. Supplier PG/PHT/Regulator L0-L2/LAD interfaces must first be elaborated. Suggested arithmetic contracts are comments; only genuine algebraic carrier signatures are compiled.
  Consumers: `PadicHodgeRegulators:L3/crystalline-regulator`; `PadicHodgeRegulators:L4/coleman-coordinates`; `PadicHodgeRegulators:L4/derham-regulator`.
- **Derivative obstruction exactness**: Berger p.120 cites Perrin–Riou1994 Section2.2 for exactness of the derivative-obstruction sequence. That proof was not independently acquired/read here; prove solvability and kernel on authentic period modules, including the top t^h eigenvectors and invariant quotient.
  Consumers: `PadicHodgeRegulators:L3/big-exponential-obstruction`; `PadicHodgeRegulators:L3/big-exponential`.
- **Determinant normalization**: LLZ4.7 imports Perrin–Riou delta(V), Proposition3.6.7 and Colmez1998 IX.4.5. Berger/LZ supply the read reciprocity route, but the exact determinant-line normalization and rank-d Iwasawa comparison are still required. Pairing equality alone is not the determinant theorem.
  Consumers: `PadicHodgeRegulators:L3/regulator-determinant`; `PadicHodgeRegulators:L4/actual-coleman-image`.
- **Cyclotomic growth estimate**: LZ4.8 reduces its quotient-slope bound to a one-variable statement called well known. Supply the actual Wach coefficient/annulus seminorm estimate and identify its Mellin image with LAD order-h distributions; order-zero boundedness is not automatic.
  Consumers: `PadicHodgeRegulators:L3/growth`.
- **Integral lower inclusion**: Supply phi(pi)^(k-1)(phi*N(T))^psi0 subset (1-phi)N(T)^psi1 over O_E for the actual modular lattice. LLZ2011 cites the proof of LLZ2010 Prop4.11; the latter’s printed (C),(D) hypotheses and rational one-coordinate proof do not by themselves establish the wider integral assertion. Retain those restrictions until integral convergence and coefficient descent are proved.
  Consumers: `PadicHodgeRegulators:L4/integral-image-index`.
- **N_rig and exponential comparison**: PHT/PG must supply the authentic N_rig(D), partial, localization, annulus norms, nabla_h Delta subset D and the Nakamura2014 cohomological exponential comparison cited by RJ I.10/I.22. RJ’s downstream formulas were read; Nakamura’s proof was not acquired/read in this run.
  Consumers: `PadicHodgeRegulators:L4/analytic-differential-powers`; `PadicHodgeRegulators:L4/derham-interpolation-growth`.
- **Crystalline/de Rham normalization square**: Prove the map-level conversion of RJ Amice lambda_i, inverse finite-character convention, alpha_i^-n and Gauss dual bases to LLZ/LZ Mellin. Also prove the general crystalline extension asserted by RJ I.15/I.29: the displayed IC9 calculation starts in a strict-negative-slope eigenbasis subcase. A finite coefficient extension alone does not diagonalize a nonsemisimple phi. No global extension is inferred for general de Rham D.
  Consumers: `PadicHodgeRegulators:L4/crystalline-derham-comparison`.
- **Rubin ordinary/multiplicative construction**: The supplied public Rubin book states PropositionIII.5.14 and refers to the appendix of Rubin1998, Euler systems and modular elliptic curves, LMS Lecture Notes254, pp.351–367, for the construction. That appendix was not acquired/read. Supply its integral singular-quotient descent and injectivity, including the ordinary/multiplicative differential normalization.
  Consumers: `PadicHodgeRegulators:L3/rubin-coleman-map`; `PadicHodgeRegulators:L4/split-multiplicative-augmentation`.
- **Unrestricted crystalline codomain**: StageL3 prints H_E-valued output for all crystalline V. LZ Section4.4 equation(10) constructs the normalized map for arbitrary weights into Frac(H_E) via logarithmic-factor division. Extra H_E-valued cancellation is not proved here and must not be asserted for every V. The packet proposes an explicit scope qualification and retains this target gap.
  Consumers: `PadicHodgeRegulators:L3/meromorphic-twist-extension`.
- **Cross-part Kummer sign in the Tate–Coleman comparison**: L2/kummer-coleman-comparison supplies h_Iw(Delta(f_u) tensor e_1)=s kappa(u) with s in {+1,-1}, not the normalized equality used by the L3 Tate comparison. CC99 Proposition V.3.2 proof writes its Kummer representative with (1-tau), whereas the declared Selmer Kummer map uses tau(alpha)/alpha. Compare the actual period lift, Tate basis and h_Iw cocycle of I.4.1/IV.2.1 with LZ Section 6.4.2 before transporting the ell_0 Col_0=-ell_0 Col formula to this kappa. Its source-normalized target is retained; no sign is selected by assembly. Rubin’s separate source theorem is retained, but comparison through this Tate node inherits the gap.
  Consumers: `PadicHodgeRegulators:L3/tate-coleman-comparison`; `PadicHodgeRegulators:L3/rubin-coleman-map`.
- **Normalized local Iwasawa pairing and dual-exponential adjunction**: The L1 nodes provide the finite-level dual exponential and local-duality contract; the L2 nodes provide h_Iw, twists and character specialization. None defines the Lambda-valued Iwasawa pairing asserted in L3/explicit-reciprocity. Supply the inverse-action pairing and its normalized specialization, and check the order/sign of the L1 adjunction against Berger II.5–II.6 and LZ Appendix B.6. LZ’s source formula retains -sigma_-1 ell_0 and antilinearity in the second variable. A stage reference or finite-level perfectness alone cannot discharge this comparison.
  Consumers: `PadicHodgeRegulators:L3/explicit-reciprocity`; `PadicHodgeRegulators:L3/regulator-determinant`.
- **Representation-level L2 comparison versus general de Rham Robba modules**: The new precise dependency L2/fontaine-iwasawa-map applies to etale D(T) attached to a representation. L2/character-specialisation likewise specializes representation Iwasawa classes. These nodes support only that specialization of the L4 construction. RJ’s general de Rham D and N_rig(D) need the separately requested PG.5 Nakamura comparison and its localization/exponential interface; no etaleness or representation realization is inferred from the new node reference. Retain the existing N_rig/exponential and crystalline normalization gaps.
  Consumers: `PadicHodgeRegulators:L4/derham-regulator`; `PadicHodgeRegulators:L4/derham-interpolation-growth`; `PadicHodgeRegulators:L4/crystalline-derham-comparison`.

For the next mathematical revision, begin with the D.1 review's seven
unverifiable contracts and the early classical log-syntomic producer boundary.
The curve model comparison and missing D.5 target nodes are separate tasks.
For the Iwasawa strand, start with the three consuming gaps above, then the
original derivative, analytic descent, determinant, growth, integral lower
inclusion, Rubin construction and N_rig/normalization obligations. Keep all
sourceIssue verdicts: a rejected proposed correction must not become a theorem.

## Validation and limits

- Both `python3 scripts/check_blueprint.py` packet checks: **0 errors,
  0 warnings**. D.1: 68 nodes, 163 definition/construction API items,
  92 definition/construction tests, 19 planets, 13 gaps and 17 requests.
  L3: 59 nodes, 78 API items, 73 tests, 12 planets, 13 gaps and 16 requests.
- `lean-check research/blueprint/suggested/PadicHodgeRegulators.lean`:
  **exit 0**, 125 `declaration uses sorry` warnings and no other warnings or
  errors, at the pinned Mathlib commit. Memory was checked before elaboration.
  This is a Mathlib-only check; the pinned Tau Ceti declarations were read
  directly at their commit and are not compiled imports in this prototype.
- Structural audit: every node, declaration name, API name and test name is
  present in the unified reader and suggested file; reader node content matches
  the packets, internal anchors resolve, the local combined prerequisite graph
  has no cycles, review objects and mathematical fields are unchanged, and
  all original native signatures/examples are preserved. Comment-name coverage
  is explicitly **not** typed-signature/executable-test coverage.
- No native arithmetic regulator is implemented. Actual period, Wach, Robba,
  Iwasawa, syntomic and K-theory carriers must arrive before their commented
  contracts can be elaborated. All `implementationStatus` values remain
  `unchecked`; no stage has been promoted to closed.
- Pinned baseline: Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Upstream density/boundary references
  were AdicSpaces and LocalFieldsRamification, with ProfiniteCohomology and
  the original roadmap used for the shared cohomological boundary.

All enduring information is in the two part packets, unified reader, suggested
file and this note. Scratch source texts, scripts and logs are disposable; no
future worker needs a local path or a scratch artifact to resume.
