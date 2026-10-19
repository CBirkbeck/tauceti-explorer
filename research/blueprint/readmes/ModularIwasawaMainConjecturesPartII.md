# Main conjectures for modular forms and their families, Part II

This is a completed ownership index for issue #3338. It routes the issue’s three continuations to [CMAllPrimeMainConjectures](../packets/CMAllPrimeMainConjectures.json) and [InertAnticyclotomicCMMainConjecture](../packets/InertAnticyclotomicCMMainConjecture.json). Those owners already plan every requested target. PROTOCOL.md §15 requires retaining their identifiers rather than designing the mathematics again. The index adds no definition, theorem, API, definition test or planet.

The source-to-owner inventory covers the 47 targets quoted in the issue and the later BKO route-6 Rubin addendum, for 48 targets. It imports all 90 owner nodes, including supporting targets needed along the way: 7 definitions, 12 constructions, 55 theorems, 5 lemmas, 9 comparisons and 2 applications. Their 19 definition/construction contracts contain 119 API items and 73 tests; their 51 planets remain under their original stages.

**Coverage is an accounting statement.** All fourteen alias stages are `source_decomposed`, with no remaining routing work. None is mathematically closed. The all-prime packet is `partial`, with independent review `needs_changes`; four of its nodes remain unverifiable. The inert packet is `complete`, with independent review `accepted`, and still has four gaps. Together the owners retain 17 gaps and 34 supplier requests. Empty local `nodes`, `gaps` and `requests` record zero new ownership. They do not certify a gap-free proof. Implementation is unchecked throughout.

The corrected packets and [all-prime review](../reviews/REV-DESIGN-CMAllPrimeMainConjectures.md) / [inert review](../reviews/REV-DESIGN-InertAnticyclotomicCMMainConjecture.md) control these imports. Some standalone owner readers predate those corrections. Exact statements, hypotheses, source matches, proof routes, uses, API signatures and tests are addressed by canonical node ID in this packet; node and file hashes make the snapshot checkable. A mathematical change belongs on the corresponding owner.

## Endpoint and normalization contracts

For the cyclotomic endpoint let f be a normalized CM newform of weight k≥2, λ a place of its Hecke field above any rational prime p, and V(f) Kato’s cohomological realization, dual to the covariant modular representation. Use the full G∞=Gal(Q(μ_p∞)/Q), including its finite torsion, and Kato’s j_* convention for the étale coefficients. With Λ=O_λ[[G∞]], the target is

$$\xi(H^2_{\mathrm{Iw}}(V(f)))=\xi(H^1_{\mathrm{Iw}}(V(f))/Z(f))\quad\text{over }\Lambda[1/p].$$

Here Z(f) is the span of the actual Beilinson–Kato classes. The coefficient ring is the localization of the integral completed group algebra; replacing it by unrestricted Q_p[[T]] loses the intended arithmetic object. Burungale–Tian Theorem 2.6, author v2 p.5, is the endpoint. Kato §15, pp.250–267, supplies the comparison and descent route, while Proposition 15.17, p.265, supplies only an inequality. The equality uses the additional descent argument in CZ.6.

For K imaginary quadratic and G=Gal(K(p^∞f)/K), put R=Z_p[[G]]. The unit module h¹ is the inverse norm limit of p-completed p-units, h² the inverse norm limit of p-primary class groups, and z the span of all admissible auxiliary elliptic-unit systems at the fixed conductor. At every prime l|f with l∤p let E_l=Z_p[[G/D_l]]. The corrected equivariant target is

$$\xi((h^1/z)[1/p])=\xi(h^2[1/p])\prod_{\mathfrak l\mid\mathfrak f,\,\mathfrak l\nmid p}\xi(E_{\mathfrak l}[1/p]).$$

These modules express the difference between H² over the p-open and the pf-open. They have codimension one and cannot be discarded as pseudo-null. Their factors become units on the relevant conductor-ramified components used for the CM modular theorem. This is the correction retained in the BT extraction and CZ.4. The p-inverted equality does not establish the integral equivariant Ω-form at singular primes. JLK Theorem 5.2 and Corollary 5.3, author v2 pp.24–25, must be distinguished from Theorem 5.7, p.26, with its μ-hypothesis.

For the inert endpoint assume p≥5 is inert in K, p∤h_K, and E/H is the maximal-CM Gross Q-curve in BKO §6, pp.960–962, with good reduction above p and Hecke character φ of infinity type (1,0). Put Φ=K_p, O its integers, π=−p, R the integers of a finite extension L/Φ containing the avatar, T=R(φ_p), W=(T⊗_R L)/T, Γ⁻=Gal(K∞/K) and Λ_R=R[[Γ⁻]]. Set ε=W(φ). Theorem 6.1, p.962, targets

$$X_{-\varepsilon}\text{ finitely generated torsion},\qquad\operatorname{char}_{\Lambda_R}(X_{-\varepsilon})=(L_p).$$

This equality is integral, including the prime above p. Its L-function is Rubin’s signed anticyclotomic coordinate, not the ordinary split-prime Katz element. For the primitive local class ξ and a signed integral basis v_ε, ξ=L_p v_ε. The class need not be a basis: a nonunit coordinate is meaningful. Changing v_ε to u v_ε changes L_p to u⁻¹L_p. The principal span C∞=Λ_Rξ and the full global auxiliary-ideal module C remain distinct until the integral localization comparison is proved.

BKO p.961 gives δ(ξ)=L(φ̄,1)/Ω and δ_χ(ξ)=L(φ̄χ,1)/Ω. For nontrivial χ∈Ξ_BKO^ε its interpolation formula is

$$L_p(\chi)=\frac{L(\overline{\varphi\chi},1)}{\Omega\,\delta_{\chi^{-1}}(v_\varepsilon)}.$$

The trivial character has a separate derivative normalization. When ε=−1 that derivative is zero and is not a formula for L_p(1). The inverse character in the denominator follows from the contragredient action, not from a free choice of notation.

## Signs, duals and integral boundaries

A nontrivial character of order p^r first occurs at K_r and has local conductor p^(r+1). BKO’s plus character set uses even conductor exponent and includes the trivial character. AH’s character sets use order parity, so Ξ_AH^s=Ξ_BKO^(−s). AH and BKO define the point space of sign s by vanishing on Ξ_AH^(−s)=Ξ_BKO^s; their point and Selmer labels therefore agree. At level zero the plus formal-point space has rational rank zero and the minus space rank one. See BKO §2 and §6, pp.947–950, 961–962; AHII §2 and Remark 3.2, pp.613–614.

The discrete local condition at a prime away from p is zero. Its compact Cartier-dual condition is full local cohomology. At p, compact strict pairs with discrete relaxed, and compact relaxed with discrete strict. In the Pontryagin dual, (γf)(x)=f(γ⁻¹x). A χ-component of the discrete group therefore corresponds to χ⁻¹-specialization of the dual. Coefficient trace identifications keep the inverse different when R/Z_p is ramified.

AHII §5, pp.618–620, uses

$$\omega_n^+=\prod_{\substack{1\leq k\leq n\\k\ \mathrm{even}}}\Phi_{p^k}(\gamma),\qquad\omega_n^-=(\gamma-1)\prod_{\substack{1\leq k\leq n\\k\ \mathrm{odd}}}\Phi_{p^k}(\gamma).$$

The product is γ^(pⁿ)−1. At n=0 the two products are 1 and γ−1. At order p only the minus product vanishes; at order p² only the plus product vanishes once its factor is included. The associated finite integral error modules are retained. Rational character decomposition does not make the polynomials integrally comaximal.

Rubin Theorem 4.1, pp.36–37, is a crucial scope boundary. Under its standing prime-to-p hypotheses, split p has the torsion local-unit/Galois equality. For inert or ramified p, part (ii) gives class-group divisibility by global units modulo elliptic units and equality on irreducible finite-group character parts nontrivial on the p-decomposition group. The local-unit quotient and p-ramified Galois module in the two-variable nonsplit setting are not torsion; assigning them torsion characteristic ideals would not repair the proof. The BKO extraction’s stale route-6 units-form wording is corrected by the canonical reviews. The canonical inert gap G2, used by IC.3, retains the remaining avatar twist, decomposition-character verification and Γ⁺-specialization comparison. AHI Lemma 2.4.5 and Corollary 2.4.6, pp.1028–1029, supply a dictionary template under ordinary hypotheses; their ordinary local proof is not applied at the inert prime.

For CGLS Theorem 1.2.2, author v2 pp.7–8, p is odd and split, the Teichmüller lift θ has split conductor support, and θ at the conjugate p-place is neither 1 nor ω. The branch ωφ⁻¹ can be tamely ramified at p. Keep the θ-branch ray conductor and Δ_θ-invariants in the cohomological comparison. The functional equation at equation (2.11), p.15, exchanges the dual norm-twisted branches and inverts the anticyclotomic variable; its extra factors require checking before a λ-equality follows. The exact Coleman/Katz comparison, one-variable control and p-divisible class-number case remain open in CZ.3.

BKO Theorem 6.2, pp.962–963, additionally assumes E/K. Maximal CM then forces h_K=1 and permits R=O. For the selected CM character component, the Mordell–Weil dimension is bounded by ord_χ L_p for matching χ∈Ξ_BKO^ε and by ord_χ L_p+1 otherwise. First bound Selmer dimensions at χ by the length/order at χ⁻¹ of the compact dual, using IC.5’s specialization-length lemma. Changing χ⁻¹ to χ uses the O-valued descent in this theorem; it is not automatic for a general R-valued Gross datum. The ideal containment is (L_p)⊆char(X_str), which gives ord char(X_str)≤ord L_p. These are rank bounds, not leading-term BSD equalities.

## Layers and ownership

Each layer below imports the corresponding canonical layer. The canonical dependency graph, including requests and gaps, supplies the build order. The alias has only an outgoing dependency to its owner layer; neither owner depends on this alias. All source and proof descriptions below are target-centered.

### CZ.0 — CM ray towers and elliptic units

Import CMAllPrimeMainConjectures:CZ.0. At every prime p, specialize the existing completed group algebra to G=Gal(K(p^∞f)/K), retaining finite torsion Δ of possibly p-divisible order. Import inverse-norm p-units h¹, p-primary class groups h², j_* ray-tower cohomology and their Kummer/class/Brauer comparisons; normalized CM theta values and the full auxiliary-ideal elliptic-unit span z. For each l|f, l∤p retain E_l=Z_p[[G/D_l]] in H²_pf/H²_p. Finite generation, rank one and R-torsion-freeness have their canonical proof obligations; absence of Z_p-torsion does not prove R-torsion-freeness.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.0`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `partial`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `ray-tower-iwasawa-algebra` | definition | The CM ray-class tower and its two-variable Iwasawa algebra |
| `ray-tower-iwasawa-cohomology` | construction | Iwasawa cohomology of the ray tower with general coefficients |
| `tower-unit-class-modules` | definition | The tower unit module h¹ and class module h² |
| `tower-kummer-identification` | comparison | Kummer identification of the tower unit module |
| `class-module-h2-comparison` | comparison | Class groups and H² of the ray tower agree in codimension one |
| `h2-euler-comparison` | theorem | Euler-factor comparison of H² over O_K[1/p] and O_K[1/pf] |
| `tower-class-module-torsion` | theorem | Finite generation and torsion of the class module (weak Leopoldt for the ray tower) |
| `tower-unit-module-structure` | theorem | Finite generation, torsion-freeness and generic rank of the unit module **Unverifiable.** |
| `theta-eisenstein-kronecker` | lemma | Logarithm and logarithmic derivatives of the theta function as Eisenstein–Kronecker series |
| `cm-theta-function` | construction | Kato's CM theta function aθ_E |
| `canonical-cm-pair` | comparison | The canonical CM pair of modulus f over K(f) |
| `standard-elliptic-unit` | construction | Standard elliptic units and their distribution relations |
| `kronecker-limit-formula` | theorem | Kronecker's limit formula for elliptic units |
| `elliptic-unit-module` | construction | The elliptic-unit module z and the auxiliary-free element z_{p∞f} |
| `elliptic-unit-cotorsion` | theorem | The elliptic units have torsion quotient |

**Existing planets:** CM ray-class tower; Tower unit and class modules h¹ and h²; Kato's CM theta function; Standard elliptic units; Kronecker limit formula for elliptic units; Elliptic-unit module z and z_{p∞f}.

**Owner remaining:** Supply the CM ray-tower H¹ torsion lemma and all-p Euler-rank formula; vanishing of norm roots of unity does not prove R-torsion-freeness. The Kronecker limit formula is planned from Kato (3.8.2); a lemma-level pass decomposes the analytic continuation of the Eisenstein–Kronecker series at s = 0.

### CZ.1 — CM realizations and explicit reciprocity

Import CMAllPrimeMainConjectures:CZ.1. Import the rank-one Betti, étale and de Rham realizations of a Hecke character ψ of type (−r,0), r≥1, with arithmetic Artin action ψ(a)⁻¹ and local idele factor a_v^r. Import Kato Proposition 15.9 with its conjugate character, period, trace and auxiliary factors. Relative O_p-height one includes ordinary p-height two at inert primes. Geometric de Rham comparison and the generalized reciprocity input remain owner gaps.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.1`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `partial`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `cm-hecke-realization` | construction | Kato's λ-adic realization of a CM Hecke character |
| `cm-p-divisible-reciprocity` | lemma | Height-one explicit reciprocity for the CM p-divisible groups |
| `cm-eisenstein-evaluation` | lemma | The period evaluation (15.9.1) |
| `cm-elliptic-reciprocity` | theorem | Kato's explicit reciprocity law for elliptic units |

**Existing planets:** Kato's realization V(ψ), S(ψ), per_ψ; Kato's elliptic-unit reciprocity law.

**Owner remaining:** The height-one explicit reciprocity law is an input requested from PadicHodgeRegulators D.2 (gap).

### CZ.2 — Elliptic-unit Euler systems and integral character equalities

Import CMAllPrimeMainConjectures:CZ.2. Import the elliptic-unit Euler system, integral character projection and Johnson-Leung–Kings Theorem 5.2 with its finite-character Tamagawa input at every prime. Distinguish this theorem from the equivariant Ω-statement needing the μ-hypothesis. Import Rubin’s exact unit/class/local-unit modules: split primes have the torsion local-unit form, whereas nonsplit primes use Theorem 4.1(ii), class-group divisibility and equality only on the stated nontrivial decomposition-group character components.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.2`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `partial`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `elliptic-unit-euler-system` | construction | The Euler system of elliptic units and its twists by finite characters |
| `tamagawa-s0-abelian` | theorem | The Tamagawa number conjecture at s = 0 for abelian extensions of K |
| `elliptic-zeta-element-comparison` | theorem | Elliptic units are the Tamagawa zeta elements |
| `elliptic-unit-euler-system-bound` | theorem | Rubin's Euler-system bound for elliptic units |
| `lambda-main-conjecture` | theorem | The main conjecture for imaginary quadratic fields at every prime (Johnson-Leung–Kings Theorem 5.2) |
| `lambda-main-conjecture-euler-factors` | theorem | The main conjecture over O_K[1/pf] with Euler factors |
| `rubin-iwasawa-modules` | definition | Rubin's Iwasawa modules U_∞, Ē_∞, C̄_∞, A_∞, X_∞ |
| `classical-two-variable-main-conjecture` | theorem | Rubin's main conjecture and its all-prime classical form |

**Existing planets:** Euler system of elliptic units; Main conjecture at every prime (Johnson-Leung–Kings); Rubin's modules U∞, Ē∞, C̄∞, A∞, X∞; Rubin's two-variable main conjecture.

**Owner remaining:** The p = 2 Tamagawa input (Itakura) and the Huber–Kings comparison are recorded gaps; Rubin's own Kolyvagin-system proof (§§5–10) is not decomposed, since Johnson-Leung–Kings' cohomological proof supersedes it here.

### CZ.3 — Split-prime Coleman and Katz comparisons

Import CMAllPrimeMainConjectures:CZ.3. Import the split-prime Coleman/Katz targets and CGLS anticyclotomic θ-components with split conductor support and θ|G_vbar different from 1 and ω. Permit the tame branch ωφ⁻¹. The exact Coleman domain, completed coefficient extension, image, integral one-variable control and Katz functional-equation factors are unresolved; three imported nodes are unverifiable. The p-divisible class-number case remains an explicit gap. No characteristic ideal is projected without its Tor and local corrections.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.3`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `partial`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `two-variable-coleman-map` | construction | The two-variable Coleman map at a split prime **Unverifiable.** |
| `elliptic-units-to-katz-measure` | theorem | Elliptic units map to Katz's two-variable measure **Unverifiable.** |
| `katz-form-main-conjecture` | theorem | The Katz-measure form of the main conjecture at split primes **Unverifiable.** |
| `anticyclotomic-theta-main-conjecture` | theorem | Anticyclotomic θ-components and the λ-invariant equality |
| `katz-functional-equation-lambda` | theorem | Functional equation of the anticyclotomic Katz projections and λ(L_ψ) = λ(L_φ) |

**Existing planets:** Two-variable Coleman map; Katz-measure form of the main conjecture; Anticyclotomic θ-component main conjecture.

**Owner remaining:** The two-variable Coleman map and the Yager–de Shalit identification rest on sources not read (gap); the case p | h_K is a gap.

### CZ.4 — Rational equivariant CM equality

Import CMAllPrimeMainConjectures:CZ.4. Import equality at height-one primes not containing p and deduce ξ((h¹/z)[1/p])=ξ(h²[1/p]) times the product of ξ(E_l[1/p]) for l|f, l∤p. The Euler factors disappear only in the stated conductor-ramified components or if no such primes occur. Inverting p removes singular primes; no integral equivariant theorem is added.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.4`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `regular-prime-equality` | theorem | The equivariant main conjecture at regular height-one primes |
| `rational-equivariant-main-conjecture` | theorem | The rational equivariant main conjecture (Burungale–Tian Theorem 2.1, corrected) |
| `printed-equivariant-form-range` | application | Where the printed form of Theorem 2.1 holds, and a counterexample component |

**Existing planets:** Equality at regular height-one primes; Rational equivariant main conjecture (BT Theorem 2.1).

**Owner remaining:** Singular primes (p ∈ q) and the integral equivariant Ω-form are outside this roadmap: they need Johnson-Leung–Kings' μ-hypothesis (Conjecture 5.5), proved only for split p ∤ 6.

### CZ.5 — CM induction and cyclotomic descent

Import CMAllPrimeMainConjectures:CZ.5. Import characterization of CM newforms, Kato’s Galois induction normalization, the corestriction/Shapiro comparison and the descent exact sequences of Lemma 15.13. Use §15.14 for K contained in Q(μ_p∞), including Gaussian p=2 and Eisenstein p=3. Retain the height-one and residue-characteristic hypotheses, the general-weight induction and nonvanishing gaps, and the finite-length specialization lemma. Kato’s archimedean map (15.11.3) is not used as a Galois identification.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.5`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `partial`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `cm-newform-characterization` | theorem | Three characterizations of CM newforms |
| `cm-induction-normalization` | comparison | Kato's Galois normalization of the CM induction (Lemma 15.11(1)) |
| `cm-twist-nonvanishing` | theorem | Nonvanishing of cyclotomic twists of CM L-values (Kato 13.5 for CM forms) |
| `cm-comparison-map` | construction | Kato's CM comparison map (15.12.1) |
| `twisted-tower-cohomology` | theorem | Twisting the tower cohomology to CM coefficients |
| `cm-descent-lemma` | theorem | Kato's descent from the ray tower to the cyclotomic tower (Lemma 15.13) |
| `cm-contained-descent` | theorem | Descent when the CM field lies in the cyclotomic tower (Kato 15.14) |
| `grothendieck-length-lemma` | lemma | Kato's length lemma (Lemma 14.15) |
| `cm-h2-torsion` | theorem | The CM case of Kato's Theorem 12.4: H² torsion and H¹ free of rank one |
| `cm-length-inequality` | theorem | Kato's inequality for CM forms (Prop. 15.17) |

**Existing planets:** Three characterizations of CM newforms; Kato's CM comparison map; Kato's descent lemma; Descent in the contained case; CM case of Kato's Theorem 12.4.

**Owner remaining:** Ribet's self-twist theorem, the weight-k CM induction (CM.4) and Rohrlich's nonvanishing proof are recorded gaps.

### CZ.6 — All-prime rational Kato main conjecture

Import CMAllPrimeMainConjectures:CZ.6. Import the compatible period normalization, inverse-semilinear twisting, rational elliptic-unit/Beilinson–Kato bridge and equality descent. The specialization proof cancels the H²[a] terms using Lemma 14.15 and vanishing of a-torsion in the rank-one quotient; Proposition 15.17 alone is an inequality. Endpoint: for every normalized CM newform f of weight k≥2 and every λ|p, ξ(H²_Iw(V(f)))=ξ(H¹_Iw(V(f))/Z(f)) over O_λ[[Gal(Q(μ_p∞)/Q)]][1/p]. No integral lattice comparison is inferred.

**Canonical dependency:** `CMAllPrimeMainConjectures:CZ.6`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `partial`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `cm-period-normalization` | comparison | Kato's archimedean normalization of the CM induction (Lemma 15.11(2)) |
| `cm-coefficient-reciprocity` | theorem | The reciprocity law in V(f)-coefficients (15.12.2) |
| `twisted-equivariant-equality` | theorem | The equivariant equality on ψ-components with lattice coefficients |
| `cm-zeta-bridge` | theorem | Elliptic units specialize to Beilinson–Kato elements (Kato (15.16.1)) |
| `equality-descent` | theorem | From the equivariant equality to Kato's equality at cyclotomic primes |
| `cm-kato-main-conjecture` | theorem | Kato's main conjecture for every CM newform and every prime (Burungale–Tian Theorem 2.6) |
| `cm-kato-divisibility` | theorem | Kato's divisibility for CM forms in the Z(f) form (Theorem 12.5(3), CM case) |
| `cm-kato-normalization-dictionary` | comparison | Normalization dictionary exported to CMRankZeroConverse |
| `dyadic-and-triadic-acceptance` | application | Acceptance cases: K = Q(i) at p = 2 and K = Q(√−3) at p = 3 |

**Existing planets:** Elliptic units become Beilinson–Kato elements; Equality descent; Kato's main conjecture for CM newforms (BT Thm 2.6).

**Owner remaining:** The integral refinement of Theorem 2.6 (Burungale–Tian Remark 2.7) is not a target.

### IC.0 — Inert Gross datum and sign dictionary

Import InertAnticyclotomicCMMainConjecture:IC.0. For p≥5 inert in K with p∤h_K, import the maximal-CM Gross Q-curve datum E/H, its good reduction above p, the avatar lattice T=R(φ_p), W=(T⊗_R L)/T and ε=W(φ). Import local/global anticyclotomic tower comparison, trace-dual coefficient conventions and integral scalar extension of the signed decomposition. Nontrivial order-p^r characters have local conductor p^(r+1); the trivial character belongs to the BKO plus set. Character-set labels swap between AH and BKO; point and Selmer labels do not.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.0`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `cm-datum` | definition | The inert Gross CM datum |
| `tower-comparison` | theorem | Global and local anticyclotomic towers |
| `character-dictionary` | theorem | Order, conductor and sign dictionary |
| `local-coefficients` | comparison | The local discrete CM module |
| `signed-scalar-extension` | theorem | Signed decomposition over the CM coefficient ring |

**Existing planets:** Inert Gross CM datum; Global–local tower comparison; Conductor and sign dictionary.

**Owner remaining:** InertAnticyclotomicCMMainConjecture/G1: Early CM construction and analytic contracts have no registered supplier stage InertAnticyclotomicCMMainConjecture/G3: Integral Gross descent, trace, period and primitive-lattice comparisons Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

### IC.1 — Signed local conditions and Selmer modules

Import InertAnticyclotomicCMMainConjecture:IC.1. Import actual signed formal-point Kummer images L_n^s and their exact Cartier-dual annihilators. Discrete Selmer kernels use L_n^s at p and zero away from p; strict uses zero at p, relaxed all local cohomology, ordinary the full Kummer image. The corresponding compact away-p condition is full cohomology. Form restriction colimits, compact corestriction limits and Pontryagin duals with γ acting by γ⁻¹ on evaluations; retain trace and inverse-different lattices.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.1`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `signed-kummer` | construction | Transported signed Kummer conditions |
| `choice-independence` | theorem | Independence of the local CM comparison |
| `away-p-vanishing` | theorem | Rational local vanishing away from p |
| `selmer-kernels` | definition | The four global CM Selmer conditions |
| `infinite-modules` | construction | Infinite Selmer duals and compact Selmer modules |

**Existing planets:** Signed Kummer condition; Away-p local vanishing; Signed global Selmer group; Contragredient Selmer dual.

**Owner remaining:** Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

### IC.2 — Primitive elliptic units and Rubin’s L-function

Import InertAnticyclotomicCMMainConjecture:IC.2. Import the primitive ν=1 elliptic-unit class ξ with its true conductor, exact central-value normalization and nonzero ε-signed projection. For a basis v_ε of V_R^ε define ξ=L_p v_ε and C∞=Λ_Rξ, giving V_R^ε/C∞≃Λ_R/(L_p). A unit basis change u gives u⁻¹L_p. For nontrivial χ in Ξ_BKO^ε the interpolation denominator is δ_(χ⁻¹)(v_ε); keep the separate trivial derivative. ξ is nonzero, not necessarily a basis.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.2`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `primitive-class` | construction | The primitive global CM elliptic-unit class |
| `normalization` | theorem | Primitive and imprimitive special values |
| `sign-and-nonzero` | theorem | Sign and nonvanishing of the primitive class |
| `rubin-lfunction` | definition | Rubin’s integral anticyclotomic p-adic L-function |
| `interpolation` | theorem | Interpolation with inverse-character denominator |

**Existing planets:** Primitive CM elliptic-unit class; Signed primitive elliptic-unit line; Rubin’s anticyclotomic p-adic L-function.

**Owner remaining:** InertAnticyclotomicCMMainConjecture/G1: Early CM construction and analytic contracts have no registered supplier stage Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

### IC.3 — Global elliptic units and integral descent

Import InertAnticyclotomicCMMainConjecture:IC.3. Import the full auxiliary-ideal global module C, inverse-avatar twist and trace-dual lattice, Gross descent and the AH/BKO local dictionary. The compact relaxed module has rank one; strict vanishes in the decomposed setting. Rubin’s nonsplit Theorem 4.1(ii) is imported from CZ.2 and must be checked for K₀=H(E[p]), including nontriviality on the p-decomposition group. Keep Γ⁺ specialization, Tor and common correction divisors. The Gross normalization, primitive integral index and R-coefficient involution remain gaps.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.3`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `global-unit-module` | construction | The all-auxiliary global elliptic-unit module |
| `gross-descent` | theorem | Gross Q-curve and coefficient descent contracts |
| `local-dictionary` | comparison | Compact local cohomology and signed local units |
| `global-ranks` | theorem | The relaxed and strict global ranks |
| `integral-unit-comparison` | theorem | Integral elliptic-unit comparison for the strict dual |

**Existing planets:** Global elliptic-unit module; Gross CM descent comparison; Relaxed and strict Selmer ranks; Integral elliptic-unit main-conjecture input.

**Owner remaining:** InertAnticyclotomicCMMainConjecture/G2: Inert units-form translation of Rubin's Theorem 4.1(ii) to the Gross avatar InertAnticyclotomicCMMainConjecture/G3: Integral Gross descent, trace, period and primitive-lattice comparisons InertAnticyclotomicCMMainConjecture/G5: Two-variable relaxed/strict comparison: Billot's theorem with R-coefficients and the involution Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

### IC.4 — Integral inert anticyclotomic main conjecture

Import InertAnticyclotomicCMMainConjecture:IC.4. Import the Poitou–Tate sequence relating S_s, S_rel, H/H^s, X_s and X_str, opposite-sign torsion, and the conditional signed characteristic comparison. After the integral primitive-lattice comparison, obtain char_ΛR(X_(−ε))=(L_p), BKO Theorem 6.1. Λ_R=R[[Γ⁻]] throughout, including the prime above p. The four inherited gaps still constrain this planned proof; accepted review is not mathematical closure.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.4`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `duality-sequence` | theorem | The signed global-duality sequence |
| `opposite-torsion` | theorem | Opposite signed torsion and vanishing compact kernels |
| `relaxed-dual-characteristic` | theorem | Torsion in the relaxed dual |
| `signed-characteristic` | theorem | From global units to the opposite signed characteristic ideal |
| `primitive-lattice-comparison` | comparison | The localized global lattice and the primitive class |
| `main-conjecture` | theorem | The inert anticyclotomic CM main conjecture |

**Existing planets:** Signed Poitou–Tate sequence; Opposite signed Selmer torsion; Relaxed-dual characteristic comparison; Signed elliptic-unit characteristic formula; Inert anticyclotomic CM main conjecture.

**Owner remaining:** InertAnticyclotomicCMMainConjecture/G3: Integral Gross descent, trace, period and primitive-lattice comparisons InertAnticyclotomicCMMainConjecture/G5: Two-variable relaxed/strict comparison: Billot's theorem with R-coefficients and the involution Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

### IC.5 — Finite-level signed control

Import InertAnticyclotomicCMMainConjecture:IC.5. Import ω_n⁺ as the product of Φ_(p^k)(γ) for even k≥1, and ω_n⁻=(γ−1) times the odd-k product. Their product is γ^(p^n)−1. At n=0 they are 1 and γ−1. Local control is injective with finite cokernel under the decomposition; dual global control is surjective with finite kernel. Keep finite errors integrally, use rational signed splitting only after tensoring with L, and bound character dimensions by localized lengths with χ⁻¹ on duals.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.5`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `control-polynomials` | definition | The signed finite-level annihilators |
| `local-control` | theorem | Signed local control with its finite error |
| `global-control` | theorem | Signed Selmer control at finite level |
| `finite-decomposition` | theorem | Finite-level decomposition into the two signed pieces |
| `specialization-length-bound` | lemma | Specialization dimension is bounded by the local length |
| `strict-control` | theorem | Strict Selmer specialization inequality |

**Existing planets:** Signed control polynomials; Signed local control; Signed Selmer control; Finite signed Selmer decomposition; Strict Selmer specialization bound.

**Owner remaining:** Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

### IC.6 — Strict divisors and character rank bounds

Import InertAnticyclotomicCMMainConjecture:IC.6. Import (L_p) contained in char(X_str), the at-most-one-dimensional ordinary/strict local difference and matching-sign control. For BKO Theorem 6.2 impose E/K in addition to the Gross assumptions; maximal CM then forces h_K=1 and permits R=O. A χ-component CM rank is bounded by ord_χ L_p for χ∈Ξ_BKO^ε and by ord_χ L_p+1 otherwise. The χ↔χ⁻¹ order comparison uses this O-valued descent; it is not asserted for arbitrary R-valued Gross data.

**Canonical dependency:** `InertAnticyclotomicCMMainConjecture:IC.6`. **Alias coverage:** `source_decomposed`. **Canonical coverage:** `planned`.

| Imported node suffix | Kind | Target |
| --- | --- | --- |
| `strict-divisor` | theorem | The strict characteristic divisor divides L_p |
| `local-codimension` | theorem | The one-dimensional CM local correction |
| `matching-bound` | theorem | The matching-parity Selmer bound |
| `rank-bounds` | theorem | Finite-character CM rank bounds |

**Existing planets:** Matching-parity CM Selmer bound; Finite-character CM rank bounds.

**Owner remaining:** Discharge the explicit supplier requests used in this layer and inherit the imported suppliers’ unresolved proof obligations.

## Imported definitions, APIs and discriminating tests

All nineteen contracts below remain owned by the indicated canonical node. API/test names are the exact existing names; their complete signatures, quantified hypotheses, uses and tests are in that node’s `api`, `uses` and `tests` arrays. The manifest records their hashes. No alternate implementation or renamed definition is supplied here. The tests described are planned acceptance obligations under the owner; the separate thirteen native Lean examples do not implement these 73 tests.

### `CMAllPrimeMainConjectures:CZ.0/ray-tower-iwasawa-algebra`

Specialize the native completed algebra to the arithmetic inverse limit. Fix the Γ×Δ splitting and coefficient ring; pass to the normalization only with the stated roots of unity and after inverting p. Finite torsion of p-divisible order is allowed.

**API outline:** `CMRayTower`, `CMRayTower.iwasawaAlgebra`, `CMRayTower.torsion`, `CMRayTower.splitting`, `CMRayTower.restrictTo`, `CMRayTower.cyclotomicQuotient`, `CMRayTower.normalization_eq_pi`, `CMRayTower.IsRegularPrime`, `CMRayTower.xi`, `CMRayTower.xi_eq_iff_length`.

**Discriminating checks:** Gaussian K at p=2 and tame modulus 1 has no finite torsion; at p=5 the corresponding torsion has order 4; the Gaussian modulus (3) at p=2 has 8-torsion and gives an integral nonnormal example. Check normalization after inverting p and rank two of G/Δ.

**Canonical test names:** `CMRayTower.torsion_gaussian_two`, `CMRayTower.torsion_gaussian_five`, `CMRayTower.not_normal_of_dvd`, `CMRayTower.normalization_inv_p`, `CMRayTower.rank_two`.

### `CMAllPrimeMainConjectures:CZ.0/ray-tower-iwasawa-cohomology`

Use the inverse corestriction limit of the specified j_* étale groups. The continuous-cochain Shapiro map, coefficient functoriality and derived base change have separate hypotheses; perfectness has only the JLK Lemma 4.3 scope. With a chosen basis, untwisted-to-twisted is Tw_(χ⁻¹)-semilinear.

**API outline:** `rayIwasawaCohomology`, `rayIwasawaCohomology.shapiro`, `rayIwasawaCohomology.finite`, `rayIwasawaCohomology.vanishing`, `rayIwasawaCohomology.baseChange`, `rayIwasawaCohomology.twist`, `rayIwasawaCohomology.localization`, `rayIwasawaCohomology.map`.

**Discriminating checks:** Degree zero for Z_p(1) vanishes; the trivial twist is the identity; specialization agrees with Kato’s exact sequence; adjoining a tame ramified prime to the open set changes H² by its Euler module.

**Canonical test names:** `rayIwasawaCohomology.h0_tate`, `rayIwasawaCohomology.twist_trivial`, `rayIwasawaCohomology.agrees_cyclotomic`, `rayIwasawaCohomology.not_unrestricted`.

### `CMAllPrimeMainConjectures:CZ.0/tower-unit-class-modules`

Form h¹ from p-completed p-units and h² from p-primary ideal classes, using norms. Retain global units as a submodule. Constructors take compatible families; projections, extensionality and conductor-change norm maps expose the inverse limits.

**API outline:** `towerUnits`, `towerClasses`, `towerUnits.globalUnits`, `towerUnits.proj`, `towerClasses.proj`, `towerUnits.restrict`, `towerUnits.mk`, `towerUnits.ext`.

**Discriminating checks:** Finite projections satisfy norm compatibility; norm-compatible roots of unity have zero limit, without inventing a map from one layer to that limit; zero p-primary class groups at every layer give h²=0; global units are the valuation kernel.

**Canonical test names:** `towerUnits.proj_norm`, `towerUnits.roots_of_unity_vanish`, `towerClasses.class_number_one_layer`, `towerUnits.global_subset`.

### `CMAllPrimeMainConjectures:CZ.0/cm-theta-function`

The normalized CM theta unit has divisor N(a)[0]−[E[a]] for a prime to 6. Its norm constraints determine its constant. Base change and O_K-linear isogeny norms are included, with isogeny degree coprime to N(a).

**API outline:** `CMTheta.theta`, `CMTheta.divisor`, `CMTheta.norm_invariant`, `CMTheta.unique`, `CMTheta.ofInt`, `CMTheta.isogeny_norm`, `CMTheta.two_ideals`, `CMTheta.baseChange`.

**Discriminating checks:** For a=(5) compare the existing integer-smoothed theta; the divisor has degree zero; the unit ideal gives the constant 1. Constants satisfying only the multiplication-by-2 norm need not be 1, whereas both 2 and 3 constraints force 1. Quotienting by E[a] disproves an unrestricted isogeny norm formula.

**Canonical test names:** `CMTheta.ofInt_eq_cTheta`, `CMTheta.divisor_degree`, `CMTheta.trivial_ideal`, `CMTheta.not_any_unit`, `CMTheta.isogeny_coprime_required`.

### `CMAllPrimeMainConjectures:CZ.0/standard-elliptic-unit`

Evaluate the inverse normalized theta at the canonical level point. When unit injectivity needs an auxiliary p-power modulus, norm down and prove independence of that choice. State integrality away from the conductor, Galois transport, norm distribution and auxiliary-ideal independence.

**API outline:** `ellipticUnit`, `ellipticUnitOf`, `ellipticUnitOf_indep_r`, `ellipticUnit.isUnit_away`, `ellipticUnit.norm_relation`, `ellipticUnit.aux_indep`, `ellipticUnit.galois`.

**Discriminating checks:** Check the p-power norm tower; use distinct auxiliary ideals (5),(7), giving factors 25−σ_(5) and 49−σ_(7); a conductor with two distinct prime factors gives a global unit. At a new prime keep 1−Frob⁻¹ in the norm identity; cyclotomic units do not furnish the transverse norm-compatible elliptic system.

**Canonical test names:** `ellipticUnit.norm_tower`, `ellipticUnit.aux_indep_distinct`, `ellipticUnit.unit_two_primes`, `ellipticUnit.euler_factor`, `ellipticUnit.not_cyclotomic`.

### `CMAllPrimeMainConjectures:CZ.0/elliptic-unit-module`

Take the span of all admissible auxiliary families in h¹. The divided zeta element lies initially in the total quotient module; its auxiliary factor returns it to h¹. The auxiliary-factor ideal is the cyclotomic-character kernel and becomes a unit ideal at height one.

**API outline:** `ellipticUnitModule`, `zetaElement`, `zetaElement_indep`, `zetaElement_mul_mem`, `ellipticUnitModule_localization`, `cyclotomicIdeal_eq`, `zetaElement_restrict`, `zetaElement_eq_jlk`.

**Discriminating checks:** Cross-multiplication for two auxiliaries proves independence; the quotient by the auxiliary-factor ideal is Z_p; conductor change retains the Euler factors; compare the actual JLK zeta element. A height-one pole cannot be inferred from the auxiliary denominator when that ideal is already a local unit.

**Canonical test names:** `zetaElement_indep_two`, `cyclotomicIdeal_quotient`, `ellipticUnitModule_height_one`, `zetaElement.auxiliary_factor`.

### `CMAllPrimeMainConjectures:CZ.1/cm-hecke-realization`

For ψ of infinity type (−r,0), r≥1, take the r-th CM cohomology tensor line and its semilinear descent. Expose Betti, étale and de Rham realizations, the period map, conductor independence and the r=1 CM comparison. Geometric filtered de Rham comparison remains a gap.

**API outline:** `CMRealization.betti`, `CMRealization.etale`, `CMRealization.galois_artin`, `CMRealization.galois_idele`, `CMRealization.deRham`, `CMRealization.period`, `CMRealization.dR_comparison`, `CMRealization.indep_conductor`, `CMRealization.rank_one`.

**Discriminating checks:** Both realizations have dimension one; Frobenius at q∤pf acts by ψ(q)⁻¹; r=1 recovers the dualized CM Tate component. The local idele factor at p prevents this positive-weight character from being treated as finite order.

**Canonical test names:** `CMRealization.finrank_one`, `CMRealization.frobenius`, `CMRealization.r_one`, `CMRealization.not_unramified`.

### `CMAllPrimeMainConjectures:CZ.2/elliptic-unit-euler-system`

Reuse the Euler-system carrier for Z_p(1), then twist and trace to finite-character coefficients. The projection to a character quotient is integral even where an averaging idempotent is unavailable. The norm relation, Iwasawa class and Γ-twist compatibility are the exposed interfaces.

**API outline:** `ellipticEulerSystem`, `ellipticEulerSystem.isEulerSystem`, `ellipticEulerSystem.twist`, `ellipticEulerSystem.twist_isEulerSystem`, `ellipticEulerSystem.iwasawaClass`, `ellipticEulerSystem.projection`, `ellipticEulerSystem.twist_gamma`.

**Discriminating checks:** The trivial character recovers the untwisted system; at q∤pma the norm has factor 1−Frob_q⁻¹; consecutive twists compose to their product. A system omitting that new-prime Euler factor is rejected.

**Canonical test names:** `ellipticEulerSystem.trivial_twist`, `ellipticEulerSystem.euler_factor_unramified`, `ellipticEulerSystem.twist_compose`, `ellipticEulerSystem.not_norm_compatible_p`.

### `CMAllPrimeMainConjectures:CZ.2/rubin-iwasawa-modules`

For K₀⊃H abelian of degree prime to p and K∞/K₀ of rank one or two, distinguish class groups, global-unit closures, elliptic-unit closures, p-local units and the p-ramified Galois group. Character idempotents are integral under the prime-to-p degree hypothesis. Keep the five-term class-field sequence.

**API outline:** `RubinModules`, `RubinModules.chiPart`, `RubinModules.fundamentalSequence`, `RubinModules.toCohomology`, `RubinModules.char`, `RubinModules.restrictToZp`.

**Discriminating checks:** At split p the sequence compares two torsion formulations; at inert p the local-unit quotient in rank two is not torsion. A trivial finite group has one component; the global p-unit character component agrees with JLK’s cohomological realization.

**Canonical test names:** `RubinModules.sequence_split`, `RubinModules.nonsplit_not_torsion`, `RubinModules.chi_trivial_hyp`, `RubinModules.compare_jlk`.

### `CMAllPrimeMainConjectures:CZ.3/two-variable-coleman-map`

This is an **unverifiable requested interface** under the canonical review. Only split p is in scope. The relative height-one Coleman source, completed coefficient extension to the unramified coefficient ring, image and kernel must first be identified in an allowed primary source. The listed injectivity, characteristic comparison and specialization API are targets, not usable established inputs.

**API outline:** `TwoVariableColeman.col`, `TwoVariableColeman.col_injective_chi`, `TwoVariableColeman.char_eq`, `TwoVariableColeman.restrict`, `TwoVariableColeman.cyclotomic_compat`, `TwoVariableColeman.interpolation_unique`.

**Discriminating checks:** Compare the cyclotomic height-one construction; the constant unit system maps to zero; the rank-two inert local-unit module forbids the proposed injective map to one copy of Λ. The quotient characteristic comparison is an acceptance requirement once the exact map is supplied.

**Canonical test names:** `TwoVariableColeman.col_cyclotomic_unit`, `TwoVariableColeman.col_trivial_unit`, `TwoVariableColeman.not_inert`, `TwoVariableColeman.char_compare`.

### `CMAllPrimeMainConjectures:CZ.5/cm-comparison-map`

At each finite level corestrict from the ray field to the compositum KQ(ζ_pⁿ), then use Shapiro and the Galois identification (15.11.2). Treat K⊗Q(ζ_pⁿ) as a finite étale algebra when it splits. The coefficient restriction map has image in G′∞ in the contained case.

**API outline:** `cmComparison`, `cmComparison.semilinear`, `cmComparison.specialize`, `cmComparison.lattice`, `cmComparison.uses_15_11_2`.

**Discriminating checks:** At level zero recover corestriction to K followed by Shapiro; compare two levels by their transition maps; in the contained case recover induction from G′∞. The archimedean map (15.11.3) is not substituted for a Galois isomorphism in weight at least three.

**Canonical test names:** `cmComparison.finite_level`, `cmComparison.corestriction_compatible`, `cmComparison.contained_case`, `cmComparison.not_via_15_11_3`.

### `InertAnticyclotomicCMMainConjecture:IC.0/cm-datum`

Record the actual Gross curve, Hecke character, avatar lattice, p-adic place, embeddings and integral differential/period data on their imported carriers. Extend T, W and Λ compatibly with coefficients. Theorem 6.1 allows h_K>1 prime to p.

**API outline:** `InertCM.Datum.ofGrossCurve`, `InertCM.Datum.tateRestriction`, `InertCM.Datum.extendCoefficients`, `InertCM.Datum.periodChange`.

**Discriminating checks:** For K=Q(√−23), p=5 is inert and h_K=3, so an otherwise supplied datum is not rejected by a class-number-one constructor. An ordinary splitting hypothesis is invalid. Coefficient extension changes the lattice in the discrete quotient as well as its field.

**Canonical test names:** `class_number_not_one`, `inert_not_ordinary`, `coefficient_extension`.

### `InertAnticyclotomicCMMainConjecture:IC.1/signed-kummer`

Transport the actual same-parity formal-logarithm kernel through Kummer and the CM coefficient comparison. Use the proved saturated divisible image. Its compact local condition is the full orthogonal under the specified Cartier-dual pairing, and restriction and scalar extension respect these constructions.

**API outline:** `InertCM.signedLocalCondition`, `InertCM.mem_signedLocalCondition`, `InertCM.signedCondition_restrict`, `InertCM.signedCondition_annihilator`, `InertCM.signedCondition_extend`.

**Discriminating checks:** A pure χ point fails the s-condition when χ has BKO sign s and passes for the other sign; at level zero the plus image has rational rank zero and the minus image rank one; restriction of a point class equals the class of the included point.

**Canonical test names:** `same_parity_point`, `trivial_local_plus`, `restriction_kummer`.

### `InertAnticyclotomicCMMainConjecture:IC.1/selmer-kernels`

Instantiate the existing Selmer carrier with signed Kummer image at p and zero at each finite prime away from p. Strict, relaxed and ordinary variants change only the p-condition. Membership, containment, restriction and restricted-ramification equivalence are exposed.

**API outline:** `InertCM.signedSelmer`, `InertCM.mem_signedSelmer`, `InertCM.strict_le_signed`, `InertCM.selmer_restrict`, `InertCM.selmer_restrictedRamification`.

**Discriminating checks:** A nonzero away-p localization is excluded; a nonzero allowed p-localization may pass signed/relaxed conditions while failing strict; enlarging S retains zero conditions at newly included unramified primes.

**Canonical test names:** `local_obstruction`, `full_vs_strict`, `unramified_set_change`.

### `InertAnticyclotomicCMMainConjecture:IC.1/infinite-modules`

Discrete groups use restriction colimits; compact groups use corestriction limits on the actual dual lattice. Pontryagin evaluation has γ⁻¹ on the argument. Discrete zero away from p pairs with full compact cohomology, and compact strict pairs with discrete relaxed. Trace-dual coefficient extension retains the inverse different.

**API outline:** `InertCM.selmerDual`, `InertCM.selmerDual_eval`, `InertCM.selmerDual_coinvariants`, `InertCM.compactSelmer`, `InertCM.dual_extendCoefficients`.

**Discriminating checks:** A χ-eigenvector pairs with χ⁻¹ on the dual; a nonzero finite control error survives integrally but vanishes after tensoring with the coefficient field; ramified coefficient rings require the inverse different rather than an unchosen trace identification with R.

**Canonical test names:** `inverse_action`, `finite_group_error`, `ramified_coefficients`.

### `InertAnticyclotomicCMMainConjecture:IC.2/primitive-class`

Take the supplier’s ν=1 global elliptic-unit class and its specified anticyclotomic local projection, using the true primitive conductor. Expose localization, coefficient extension and integral unit period changes. Local interpolation alone does not supply the global class.

**API outline:** `InertCM.primitiveClass`, `InertCM.primitiveClass_localize`, `InertCM.primitiveClass_extend`, `InertCM.primitiveClass_period`.

**Discriminating checks:** The trivial auxiliary character uses its own conductor construction; ξ may equal π times a signed basis vector, so its coordinate retains π; an arbitrary local vector does not prove that the full global auxiliary family has that principal image.

**Canonical test names:** `trivial_auxiliary`, `p_divisible_vector`, `global_local_distinction`.

### `InertAnticyclotomicCMMainConjecture:IC.2/rubin-lfunction`

Take the coordinate of ξ in the chosen integral signed basis. Uniqueness, quotient-by-span identification and coefficient extension are part of the contract. Replacing the basis by u times that basis multiplies the coordinate by u⁻¹ and preserves its principal ideal.

**API outline:** `InertCM.rubinLfunction`, `InertCM.primitiveClass_eq_coordinate`, `InertCM.rubinLfunction_basisChange`, `InertCM.signedQuotient_cyclic`, `InertCM.rubinLfunction_extend`.

**Discriminating checks:** Zero has coordinate zero; a basis vector has coordinate 1 while π times it has coordinate π; unit basis changes preserve the ideal; an R-valued series is not silently narrowed to O-valued coefficients.

**Canonical test names:** `zero_coordinate`, `basis_vector`, `unit_basis_change`, `coefficient_ring`.

### `InertAnticyclotomicCMMainConjecture:IC.3/global-unit-module`

Use the closed span of the complete global auxiliary-ideal Euler-system family, after inverse-avatar tensor twist and trace-dual descent. Localization lands in H^ε. Norms and two-variable specialization must transport that complete family and retain quotient Tor terms.

**API outline:** `InertCM.globalEllipticUnitModule`, `InertCM.auxiliaryClass_mem`, `InertCM.unitModule_norm`, `InertCM.unitModule_specialize`, `InertCM.unitModule_signed`.

**Discriminating checks:** One auxiliary class with a nonunit factor need not generate the full span; a unit in Z_p(1)-cohomology is not a T′ class without the actual twist; matching local values alone do not produce a global class in C.

**Canonical test names:** `auxiliary_nonunit`, `twist_direction`, `localization_not_definition`.

### `InertAnticyclotomicCMMainConjecture:IC.5/control-polynomials`

For γ fixed, take the even positive cyclotomic factors for plus and γ−1 times the odd factors for minus. Their product is γ^(pⁿ)−1. Character vanishing uses the AH sets, equivalently opposite BKO character sets, and controls rational signed points and Selmer groups.

**API outline:** `InertCM.controlPolynomial`, `InertCM.controlPolynomial_product`, `InertCM.controlPolynomial_eval`, `InertCM.signedPoints_annihilated`.

**Discriminating checks:** At level zero obtain 1 and γ−1; order-p characters vanish only on minus once that factor occurs; order-p² characters vanish only on plus once that factor occurs; disjoint roots over characteristic zero do not imply integral comaximality.

**Canonical test names:** `level_zero`, `order_p`, `order_p_squared`, `integral_not_comaximal`.

## Source-item crosswalk

Prefixes BT, BKO and CGLS below mean PAPER-BURUNGALE-TIAN-26, PAPER-BURUNGALE-KOBAYASHI-OTA-21 and PAPER-CASTELLA-ETAL-22. A node beginning CZ belongs to CMAllPrimeMainConjectures; IC belongs to InertAnticyclotomicCMMainConjecture. Each full extraction ID and locator is in `targetCoverage`. The BKO Rubin addendum is counted separately from the original 23-item BKO route.

| Extraction item | Canonical node suffixes |
| --- | --- |
| `BT/units-finite` | `CZ.0/tower-unit-module-structure` |
| `BT/classes-finite` | `CZ.0/tower-class-module-torsion`, `CZ.0/tower-unit-class-modules` |
| `BT/units-torsionfree` | `CZ.0/tower-unit-module-structure` |
| `BT/units-rank-one` | `CZ.0/tower-unit-module-structure` |
| `BT/classes-torsion` | `CZ.0/tower-class-module-torsion` |
| `BT/elliptic-units` | `CZ.0/elliptic-unit-module`, `CZ.0/standard-elliptic-unit` |
| `BT/elliptic-unit-cotorsion` | `CZ.0/elliptic-unit-cotorsion` |
| `BT/regular-prime-equality` | `CZ.4/regular-prime-equality` |
| `BT/equivariant-main` | `CZ.4/rational-equivariant-main-conjecture`, `CZ.4/printed-equivariant-form-range` |
| `BT/class-cohomology` | `CZ.0/class-module-h2-comparison` |
| `BT/h2-euler-comparison` | `CZ.0/h2-euler-comparison` |
| `BT/cm-zeta-bridge` | `CZ.6/cm-zeta-bridge` |
| `BT/cm-descent` | `CZ.5/cm-descent-lemma` |
| `BT/cm-contained-descent` | `CZ.5/cm-contained-descent` |
| `BT/equality-descent` | `CZ.6/equality-descent` |
| `BT/cm-kato-main` | `CZ.6/cm-kato-main-conjecture` |
| `BT/cm-h2-torsion` | `CZ.5/cm-h2-torsion` |
| `BT/cm-realization` | `CZ.1/cm-hecke-realization` |
| `BT/cm-comparison-map` | `CZ.5/cm-comparison-map` |
| `BT/ray-coefficient-iwasawa-cohomology` | `CZ.0/ray-tower-iwasawa-cohomology` |
| `BT/twisted-equivariant-equality` | `CZ.6/twisted-equivariant-equality` |
| `BT/cm-elliptic-reciprocity` | `CZ.1/cm-elliptic-reciprocity` |
| `BT/cm-characterization` | `CZ.5/cm-newform-characterization` |
| `BKO/global-local-tower` | `IC.0/tower-comparison`, `IC.0/character-dictionary` |
| `BKO/cm-discrete-module` | `IC.0/cm-datum`, `IC.0/local-coefficients` |
| `BKO/signed-local-kummer` | `IC.1/signed-kummer`, `IC.1/choice-independence` |
| `BKO/away-p-local-vanishing` | `IC.1/away-p-vanishing` |
| `BKO/signed-selmer` | `IC.1/selmer-kernels`, `IC.1/infinite-modules` |
| `BKO/ah-hypothesis-translation` | `IC.3/gross-descent`, `IC.4/primitive-lattice-comparison` |
| `BKO/opposite-selmer-torsion` | `IC.4/opposite-torsion` |
| `BKO/signed-main-conjecture` | `IC.4/main-conjecture` |
| `BKO/rubin-two-variable-input` | `IC.3/integral-unit-comparison`, `CZ.2/classical-two-variable-main-conjecture` |
| `BKO/strict-selmer-comparison` | `IC.6/strict-divisor` |
| `BKO/strict-control-bound` | `IC.5/strict-control`, `IC.6/local-codimension` |
| `BKO/signed-control-equality` | `IC.5/global-control`, `IC.5/finite-decomposition`, `IC.6/matching-bound` |
| `BKO/bsd-correct-parity` | `IC.6/rank-bounds` |
| `BKO/bsd-opposite-parity` | `IC.6/rank-bounds` |
| `BKO/relaxed-ranks` | `IC.3/global-ranks` |
| `BKO/relaxed-strict-char` | `IC.4/relaxed-dual-characteristic` |
| `BKO/global-signed-exact` | `IC.4/duality-sequence` |
| `BKO/primitive-elliptic-unit` | `IC.2/primitive-class`, `IC.2/normalization`, `IC.2/sign-and-nonzero` |
| `BKO/rubin-lfunction` | `IC.2/rubin-lfunction` |
| `BKO/rubin-interpolation` | `IC.2/interpolation` |
| `BKO/ah-local-dictionary` | `IC.3/local-dictionary` |
| `BKO/ah-conditional-equality` | `IC.4/signed-characteristic` |
| `BKO/ah-elliptic-unit-generator` | `IC.4/primitive-lattice-comparison` |
| `BKO/rubin-two-variable-main-conjecture` | `CZ.2/rubin-iwasawa-modules`, `CZ.2/classical-two-variable-main-conjecture`, `IC.3/integral-unit-comparison` |
| `CGLS/9` | `CZ.3/anticyclotomic-theta-main-conjecture`, `CZ.3/katz-form-main-conjecture`, `CZ.3/katz-functional-equation-lambda` |

## Inherited work and supplier boundaries

The following inventory addresses every canonical gap and request by JSON pointer and hash in `inheritedObligations`. This index neither duplicates nor discharges the underlying contracts. It also preserves the exact canonical stage statuses and remaining lists. Importing a node with a gap is not evidence that the gap is solved.

### CMAllPrimeMainConjectures

Packet status `partial`; independent review `needs_changes`. 13 gaps and 25 requests remain.

| Owner gap pointer | Obligation |
| --- | --- |
| `/gaps/0` | Integral Tamagawa number conjecture at s = 0 for abelian extensions of K, at p = 2 |
| `/gaps/1` | Height-one generalized explicit reciprocity |
| `/gaps/2` | General-weight CM induction not yet planned in CM.4 |
| `/gaps/3` | Ribet's characterization of self-twists |
| `/gaps/4` | Rohrlich's central nonvanishing and the infinite-order Hecke edge |
| `/gaps/5` | Two-variable Coleman map and its Katz image (de Shalit, Yager) |
| `/gaps/6` | Split-prime Katz form when p divides the class number |
| `/gaps/7` | Ray-tower j_* comparison and Euler-rank/torsion lemmas |
| `/gaps/8` | Geometric de Rham comparison for the CM tensor realization |
| `/gaps/9` | Exact Coleman-map source and scalar-extension interface |
| `/gaps/10` | One-variable Coleman/Katz control and functional-equation factors |
| `/gaps/11` | Theta-series converse and exact level |
| `/gaps/12` | Arithmetic integrality of theta values |

**Supplier contracts, in canonical request order:**

- `/requests/0`: `AutomorphicPadicLFunctions:L0`; used by `CZ.0/ray-tower-iwasawa-algebra`.
- `/requests/1`: `IntegralIwasawaTheory:I.2`; used by `CZ.0/tower-unit-class-modules`, `CZ.0/tower-class-module-torsion`, `CZ.2/rubin-iwasawa-modules`.
- `/requests/2`: `PadicMeasuresIwasawaAlgebras:L1`; used by `CZ.0/ray-tower-iwasawa-algebra`, `CZ.3/two-variable-coleman-map`.
- `/requests/3`: `ComplexMultiplicationAndExplicitReciprocity:CM.4`; used by `CZ.5/cm-newform-characterization`, `CZ.5/cm-induction-normalization`.
- `/requests/4`: `PadicHodgeRegulators:D.2`; used by `CZ.1/cm-p-divisible-reciprocity`.
- `/requests/5`: `AnalyticNumberTheory:AN.4`; used by `CZ.5/cm-twist-nonvanishing`.
- `/requests/6`: `ColemanPowerSeries:L1`; used by `CZ.3/two-variable-coleman-map`.
- `/requests/7`: `ColemanPowerSeries:L2`; used by `CZ.3/two-variable-coleman-map`.
- `/requests/8`: `AutomorphicPadicLFunctions:L3`; used by `CZ.3/elliptic-units-to-katz-measure`, `CZ.3/anticyclotomic-theta-main-conjecture`, `CZ.3/katz-functional-equation-lambda`.
- `/requests/9`: `AutomorphicPadicLFunctions:L3h`; used by `CZ.3/anticyclotomic-theta-main-conjecture`.
- `/requests/10`: `ModularIwasawaMainConjectures:L0`; used by `CZ.6/cm-kato-main-conjecture`, `CZ.6/cm-kato-normalization-dictionary`.
- `/requests/11`: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`; used by `CZ.0/ray-tower-iwasawa-algebra`.
- `/requests/12`: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; used by `CZ.0/kronecker-limit-formula`, `CZ.1/cm-hecke-realization`, `CZ.5/cm-newform-characterization`.
- `/requests/13`: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; used by `CZ.1/cm-hecke-realization`, `CZ.5/cm-newform-characterization`.
- `/requests/14`: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`; used by `CZ.0/class-module-h2-comparison`.
- `/requests/15`: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; used by `CZ.0/ray-tower-iwasawa-algebra`, `CZ.0/canonical-cm-pair`, `CZ.0/standard-elliptic-unit`, `CZ.2/rubin-iwasawa-modules`.
- `/requests/16`: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`; used by `CZ.0/ray-tower-iwasawa-algebra`.
- `/requests/17`: `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`; used by `CZ.5/cm-newform-characterization`, `CZ.5/cm-twist-nonvanishing`.
- `/requests/18`: `tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer`; used by `CZ.5/cm-newform-characterization`.
- `/requests/19`: `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`; used by `CZ.0/cm-theta-function`.
- `/requests/20`: `tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree`; used by `CZ.0/cm-theta-function`.
- `/requests/21`: `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; used by `CZ.1/cm-hecke-realization`, `CZ.1/cm-p-divisible-reciprocity`.
- `/requests/22`: `SelmerIwasawaCohomology:L3`; used by `CZ.0/ray-tower-iwasawa-cohomology`, `CZ.0/tower-unit-module-structure`.
- `/requests/23`: `SelmerIwasawaCohomology:L4`; used by `CZ.1/cm-hecke-realization`.
- `/requests/24`: `PadicMeasuresIwasawaAlgebras:L5`; used by `CZ.2/tamagawa-s0-abelian`, `CZ.2/lambda-main-conjecture`.

### InertAnticyclotomicCMMainConjecture

Packet status `complete`; independent review `accepted`. 4 gaps and 9 requests remain.

| Owner gap pointer | Obligation |
| --- | --- |
| `/gaps/0` (`G1`) | Early CM construction and analytic contracts have no registered supplier stage |
| `/gaps/1` (`G2`) | Inert units-form translation of Rubin's Theorem 4.1(ii) to the Gross avatar |
| `/gaps/2` (`G3`) | Integral Gross descent, trace, period and primitive-lattice comparisons |
| `/gaps/3` (`G5`) | Two-variable relaxed/strict comparison: Billot's theorem with R-coefficients and the involution |

**Supplier contracts, in canonical request order:**

- `/requests/0`: `PadicMeasuresIwasawaAlgebras:L4`; used by `IC.0/signed-scalar-extension`, `IC.4/relaxed-dual-characteristic`, `IC.4/main-conjecture`, `IC.5/specialization-length-bound`, `IC.5/strict-control`, `IC.6/matching-bound`.
- `/requests/1`: `PadicMeasuresIwasawaAlgebras:L5`; used by `IC.3/global-ranks`, `IC.4/relaxed-dual-characteristic`, `IC.5/global-control`, `IC.5/finite-decomposition`.
- `/requests/2`: `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; used by `IC.0/cm-datum`.
- `/requests/3`: `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`; used by `IC.1/away-p-vanishing`.
- `/requests/4`: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`; used by `IC.1/away-p-vanishing`.
- `/requests/5`: `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`; used by `IC.1/selmer-kernels`.
- `/requests/6`: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`; used by `IC.0/tower-comparison`.
- `/requests/7`: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; used by `IC.0/tower-comparison`.
- `/requests/8`: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; used by `IC.0/tower-comparison`.

The all-prime review leaves CZ.0/tower-unit-module-structure and CZ.3/two-variable-coleman-map, elliptic-units-to-katz-measure and katz-form-main-conjecture unverifiable. Rank/torsion of the ray tower, exact Coleman scalar extension and image, and arithmetic theta integrality require actual proofs or exact permitted sources. A new alias cannot improve these verdicts.

The inert review closes its former G4 and G6 by finite away-p control and the injection/length bound; those historical gaps are not reintroduced. Its G1, G2, G3 and G5 remain. In particular, BKO’s extension from the rational CM curve setting to the Gross avatar requires the actual integral trace, differential and primitive-lattice comparison. The Billot relaxed/strict comparison over R also retains its coefficient-conjugation involution. That comparison is an inherited contract; Billot’s source was not independently read in this job.

## Libraries, source access and validation boundary

The reviewed parent audit in `data/library-coverage.json` marks ModularIwasawaMainConjectures L0–L5 not built at the pins and L6 as process. The parent’s ordinary, family and signed modular branches do not establish the requested all-prime CM equality. Existing Kato, Selmer, congruence, Heegner and BSD overlaps retain their owners. No generic Galois cohomology, Selmer-data, CM realization or completed-group-algebra construction is assigned to this index.

Current read-only TauCetiRoadmap main was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The search included the nine roadmap directories absent from the atlas snapshot and Completed roadmaps, with targeted inspection of ModularForms, EllipticCurves, ClassFieldTheory, GlobalNumberFields and ProfiniteProPGroups. The latter’s Layer 9 and current Tau Ceti already provide `completedGroupAlgebra` with projection, extensionality and map APIs. CZ.0’s arithmetic specialization must use that object. Newer current-library declarations are not asserted at the older pins. The canonical inert review’s claim of a merged PadicMeasuresIwasawaAlgebras package was not treated as proof of availability: the designated current-main directory does not expose that roadmap. The supplier contracts remain in force.

The native acceptance baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Six declarations were read in full for this boundary check:

| Mathlib declaration | Module | Use |
| --- | --- | --- |
| `Ideal.span_singleton_eq_top` | `Mathlib/RingTheory/Ideal/Span.lean` | For a commutative semiring, span{x}=top iff x is a unit. |
| `Ideal.span_singleton_le_span_singleton` | `Mathlib/RingTheory/Ideal/Span.lean` | For a commutative semiring, span{x} is contained in span{y} iff y divides x. |
| `Ideal.span_singleton_mul_left_unit` | `Mathlib/RingTheory/Ideal/Span.lean` | Multiplying the generator by a unit leaves its principal ideal unchanged. |
| `Polynomial.eval` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean` | Evaluate a polynomial over a semiring by eval₂ at the identity coefficient homomorphism. |
| `Module.Basis` | `Mathlib/LinearAlgebra/Basis/Defs.lean` | A basis is represented by a linear equivalence with finitely supported coordinate functions. |
| `Module.length` | `Mathlib/RingTheory/Length.lean` | For a module over a ring, length is the Krull dimension of the full submodule lattice, converted from `WithBot ℕ∞` to `ℕ∞` by `unbot`. The bottom dimension value is removed; the zero submodule remains in the lattice. |

The [suggested Lean file](../suggested/ModularIwasawaMainConjecturesPartII.lean) contains thirteen anonymous checks on these existing carriers: loss of the ideal (5) on rationalization, direction of (25)⊆(5), preservation under a unit generator change, scalar inversion in Z/7Z, the p=5 first-level polynomial identity, the level-zero factors, their evaluations over Z and Z/5Z, and rank-one basis coordinates. It contains no admitted data or substitute arithmetic carrier. Successful elaboration checks these examples; it does not validate either owner’s full suggested file or implement an Iwasawa theorem.

Primary sources used for the endpoint and convention checks are listed below. The page numbers refer to the stated read edition, not silently to a different journal pagination. All descriptions are in our own words. No source passage, source file or book text is stored in the repository.

- **BKO21**: Ashay A. Burungale, Shinichi Kobayashi, Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1). Annals of Mathematics 194 (2021), 943–966. Read 2026-10-19. §2 pp.947–949; §6 pp.960–963, including Theorems 6.1–6.2 and the p.961 interpolation formula, also checked on a page image. SHA-256: `77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e`.
- **AHII05**: Adebisi Agboola, Benjamin Howard, [Anticyclotomic Iwasawa theory of CM elliptic curves II](https://web.math.ucsb.edu/~agboola/papers/bisi_mrl_2005.pdf). Mathematical Research Letters 12 (2005), 611–621; published author PDF. Read 2026-10-19. §2 pp.612–613; §3 pp.614–616, including Propositions 3.3–3.4 and Theorem 3.6; §4 pp.616–617, Theorems 4.1–4.3; §5 pp.618–620, Lemma 5.1, Theorem 5.2 and Proposition 5.3. SHA-256: `24f7a3ee7afd3f6bc2bc51ac2df48eb456be9878c9f63b1f6fce1baef9e53c5c`.
- **AHI06**: Adebisi Agboola, Benjamin Howard; appendix by Karl Rubin, [Anticyclotomic Iwasawa theory of CM elliptic curves](https://web.math.ucsb.edu/~agboola/papers/bisi_aif_2006.pdf). Annales de l’Institut Fourier 56 (2006), 1001–1048. Read 2026-10-19. Lemma 2.4.5 and Corollary 2.4.6, pp.1028–1029, for the twisting/unit-class dictionary. Ordinary-prime hypotheses are retained; this is not an inert-prime theorem. SHA-256: `1c176f86e757830dd18d36568c3066e2682733e8e3de6193133f886090280741`.
- **RUB91**: Karl Rubin, [The “main conjectures” of Iwasawa theory for imaginary quadratic fields](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0103/LOG_0009.pdf). Inventiones Mathematicae 103 (1991), 25–68; scan from the Göttingen Digitization Center (GDZ). Read 2026-10-19. §4 pp.36–37, standing hypotheses, sequence (5), Theorem 4.1 and Remarks 1–2, checked on page images. SHA-256: `96ca08e8ed1a7646d4bf40e2e088e0ea6e068319978ac7e5c5e3d45cc39ee23a`.
- **burungale-tian-2026**: Ashay A. Burungale and Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2). Annals of Mathematics 203 (2026), no. 1, 1–13; read in the author version arXiv:2506.03465v2 (11 October 2025), whose page numbers are used throughout. Read 2026-10-19. Author v2 §2, pp.3–5: Theorems 2.1, 2.3, 2.4 and 2.6 and the CM descent boundary. SHA-256: `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.
- **kato-2004-asterisque-295**: Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), ix, 117–290 (Numdam scan; printed page = PDF page + 115). Read 2026-10-19. §15, pp.250–267, focusing on the realization and descent statements; Lemma 14.15, pp.243–244. Formula checks at pp.263–265 distinguish the Galois map, archimedean normalization, contained case and one-sided inequality. No independent audit of all §15 proof inputs is claimed. SHA-256: `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.
- **johnson-leung-kings-2011**: Jennifer Johnson-Leung and Guido Kings, [On the equivariant and the non-equivariant main conjecture for imaginary quadratic fields](https://arxiv.org/pdf/0804.2828v2). J. reine angew. Math. 653 (2011), 75–114; read in arXiv:0804.2828v2 (12 August 2009), whose numbering is used. Read 2026-10-19. Author v2 Lemma 4.3 p.20; Theorem 5.2 and Corollary 5.3 pp.24–25; Theorem 5.7 and §5.4 pp.26–27; §7 opening and Lemmas 7.1–7.2 pp.34–35. These fix coefficient/open hypotheses and the integral/equivariant boundary. SHA-256: `2af28fc5c53be95d3b5431c8b22f4cf53ced6381d22f7def225240ab715cf543`.
- **castella-grossi-lee-skinner-2022**: Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2). Inventiones mathematicae 227 (2022), 517–580; read in arXiv:2008.02571v2, with author-version page numbers. Read 2026-10-19. Author v2 §1.2, Definition 1.2.1, Theorem 1.2.2 and Remark 1.2.3, pp.7–8; §2.2 equation (2.11) and Theorem 2.2.3, p.15. SHA-256: `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.

The canonical source corrections CMAllPrimeMainConjectures/E1–E3 and InertAnticyclotomicCMMainConjecture/E1–E3 remain linked in `sourceIssueReferences`. The CGLS tame-branch and missing-invariants corrections are inherited through CZ.3’s existing source references. This index makes no new erratum or comprehensive source-proof audit claim.

No book was needed for the routing result. The permitted library index was checked; inaccessible or unread de Shalit/Yager, Ribet, Huber–Kings, Itakura and generalized-reciprocity proof inputs remain owner gaps. No uncleared book copy was obtained. The public Rubin journal article was read; the strict-control bound follows the corrected owner’s argument and does not require Rubin’s book.

## Proposed publication structure

Keep the two canonical roadmaps. Map this alias’s CZ.n to CMAllPrimeMainConjectures:CZ.n and IC.n to InertAnticyclotomicCMMainConjecture:IC.n for n=0,…,6. The source-item table also records the single cross-branch import of Rubin’s nonsplit theorem. Preserve all identifiers, gaps, requests and source corrections. When the maintainer applies the split, check live inbound references, redirect the duplicate queue identity, and retire the four alias publication files while retaining the handoff/crosswalk record. This is a proposal; no canonical roadmap, queue or upstream file was edited.

Independent review [REV-DESIGN-ModularIwasawaMainConjecturesPartII](../reviews/REV-DESIGN-ModularIwasawaMainConjecturesPartII.md), dated 2026-10-19, accepts this ownership and routing index. Its per-import checks verify identity and preservation of the canonical contract, not a new mathematical verification of that contract. The all-prime `needs_changes` verdict, four unverifiable targets, all 17 gaps and all 34 requests remain on the owners. Mathematical refinement continues there. Retirement of the alias still requires the maintainer to apply the proposal; a fresh duplicate design is not a prerequisite.
