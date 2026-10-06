# Independent review of HabiroNahmSeries HB.9

Accepted as a completed planning pass, with five open gaps and six supplier requests. The packet plans the targets; it does not close their proofs or implement the declarations. The reviewer is Codex, session `codex-HyViHv`, job `REV-HabiroNahmSeries--HB.9`, issue #6462, on 6 October 2026. The author session was `codex-gEEAjx`; this reviewer did none of the submitted planning work.

The reviewed files are [the packet](../packets/HabiroNahmSeries--HB.9.json) and [the suggested Lean file](../suggested/HabiroNahmSeries--HB.9.lean). The reader document was inspected as an input. This issue does not authorize editing that document or the accepted base packets.

| Item | Count and result |
| --- | --- |
| Local nodes | 18: 10 verified, 8 corrected; none unverifiable |
| New nodes added by review | 0 |
| Imported HB.9 IDs inspected | 17, with their proof limitations recorded below |
| Source excerpts checked | 19: 18 GSWZ and 1 CGZ |
| Pinned baseline citations | 11 confirmed; 0 removed or replaced |
| Definition/construction APIs | 13 items across three objects |
| Definition/construction tests | 13: five Gaussian, five powered, three unpowered |
| Planets | 2 local, 3 inherited, total 5 |
| Source issues | E64 and E65 independently confirmed; confirmed E66 added |
| Coverage | One planned stage, zero closed stages; packet status complete |
| Open obligations | Five gaps, six precise supplier requests |

The target-level granularity matches this job. The three stage targets retain their accepted IDs, with explicit refinements and dependency chains. The elementary calculations are appropriate refinements of those targets. General Gaussian integration, admissibility, cyclic dilogarithms, Frobenius lifts and indexed Habiro modules remain with their existing owners. The reviewed AUDIT-14 entries in `data/library-coverage.json` find all three HB.9 targets absent and assign generic completion and Frobenius to HabiroRings. No implemented target or duplicate general theory is planned here. For upstream density and explicit interfaces, this review read the ArithmeticDirichletSeries and Completed/IntegralLattices roadmaps in full.

The principal source is Garoufalidis–Scholze–Wheeler–Zagier, [The Habiro ring of a number field, arXiv v2](https://arxiv.org/pdf/2412.04241v2). Its PDF SHA-256 is `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`. The pertinent definitions, root expansion, Gaussian formulas, coefficient-transfer argument, regulator discussion, module proof and examples were read directly. All eighteen GSWZ excerpts match the v2 TeX source literally. Both uniqueness citations now quote the actual paragraph on p.44, rather than quoting the preceding covariance display on p.43.

The [Scholze author copy](https://people.mpim-bonn.mpg.de/scholze/Habiro.pdf), SHA-256 `9c01791a695e46c041514f75c61188b3a2bfb7bf09f6fae40805b9cc8d246423`, retains the relevant normalization displays. The [arXiv listing](https://arxiv.org/abs/2412.04241) and [Scholze publication page](https://people.mpim-bonn.mpg.de/scholze/papers.html), together with public title/erratum/correction searches, supplied no later correction or identified published version. These findings concern the specified preprint and checked author copy; they make no assertion about an unread version of record.

For the constant comparison, Calegari–Garoufalidis–Zagier, [Bloch groups, algebraic K-theory, units, and Nahm's conjecture, arXiv v3](https://arxiv.org/pdf/1712.04887v3), was read at the introductory formulas, all of §2.2, Lemma 2.10 and Theorem 2.11. Its PDF SHA-256 is `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`. The CGZ excerpt matches the PDF text after whitespace normalization. Its cyclic dilogarithm has integral exponents, whereas GSWZ's exponents are divided by m. This verifies the m-th-power comparison, not the missing signed finite-Chern identification.

The baseline was inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The actual declaration statements and ambient hypotheses provide the following interfaces.

| Declaration | Module and usable statement |
| --- | --- |
| `RingHom` | `Algebra/Ring/Hom/Defs`: maps preserving the ring operations; supplies the map in divisibility transfer |
| `MvPowerSeries` | `RingTheory/MvPowerSeries/Basic`: coefficients indexed by finitely supported natural exponents |
| `MvPowerSeries.rescale` | `RingTheory/MvPowerSeries/Substitution`: ring homomorphism over a commutative semiring, scaling each coordinate |
| `MvPowerSeries.coeff_rescale` | Same module: coefficient α is multiplied by the product of coordinate scales raised to α |
| `MvPowerSeries.expand` | `RingTheory/MvPowerSeries/Expand`: algebra homomorphism over a commutative ring, substituting Xᵢ^γ, with γ nonzero |
| `MvPowerSeries.coeff_expand_smul` | Same module: the coefficient at γα is the original coefficient at α |
| `MvPowerSeries.coeff_expand_of_not_dvd` | Same module: a coefficient vanishes when one exponent is not divisible by γ |
| `MvPowerSeries.constantCoeff_expand` | Same module: power substitution preserves the constant coefficient |
| `MvPowerSeries.map` | `RingTheory/MvPowerSeries/Basic`: coefficientwise ring map between semiring coefficient types |
| `PowerSeries.coeff` | `RingTheory/PowerSeries/Basic`: the coefficient projection, with the appropriate linear structure |
| `PowerSeries.coeff_one_mul` | Same module: over a commutative semiring, the first coefficient of a product is the sum of the two constant/linear cross terms |

The suggested file's field hypotheses are stronger than these series operations require, and therefore suffice. `expand` is applied after `rescale`; applying them in the opposite order with the same scale inserts an unwanted γ². Source inspection at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` also found no Nahm, Habiro, Coleman or Dwork target declarations. Existing Tau Ceti power-series evaluation and substitution do not supply the missing arithmetic statements. No Tau Ceti declaration is cited by this packet or imported by the suggested file.

This review corrected the powered product's first use description, which falsely called it volume-cancelled despite the later correct diagnostic statement. Its volume is V(t^γ)−V(t); the universal gluing argument uses the unpowered product with q^γ covariance. The source-match description now distinguishes the source product from the powered repair proposed in inherited E47. The two uniqueness paragraph locators and excerpts were corrected to p.44, and E65's comparison locator for (112) was corrected to p.29.

Direct dependencies were added where proof steps consumed named inputs: the unpowered construction and system and corrected Gaussian inputs for gluing; the requested HB.8 correction for the refined first jet; the requested HB.2 signed comparison; Frobenius, first jets, regulator specialization, orientation, product gluing and requested HB.7/D.3 extensions for the full étale module; and the deformed Nahm equations and coefficient ring for descendant lifting. These additions expose existing owners and requests. They do not assert those missing extensions have been supplied.

The import description now preserves the seventeen owner IDs without importing a full-ring single-branch embedding, powered universal integrality, or unrestricted-root corollaries as established proofs. G-all-order-gluing now explicitly includes the extra Corollary 1.11 argument needed for all root orders, and names the symmetrization and torsion-power consumers. Restricted membership alone cannot prove those targets. The suggested file's omission note records the same limitation. No Lean declarations or proof obligations were changed.

The universal product localization also needed correction: HB.7 requires R[1/γ], not integrality at primes dividing γ. The contract now uses S^(m)[1/(Δγ)] and p∤Δγ. New source finding E66 records the false local assertion in the third paragraph of the Theorem 5 proof, distinct from E63’s omitted Δ in the global conclusion. At A=0,m=1,γ=5 and zero shifts the exact t coefficient is 5/(1−q⁵)+q/(q−1), whose expansion at q=1+x is 3−2x+x²+x³/5+O(x⁴). For A=(3), which has nondegenerate t=1 solutions, the corresponding coefficient is 5q¹⁵/(q⁵−1)−q⁻²/(q−1)=15+74x+278x²+(3224/5)x³+O(x⁴). The cubic field and Nahm-unit discriminants introduce only 23 here; the normalized branch of the universal coefficient algebra is integral at 5. When 5∤Δ, the coefficient 3224/5 therefore also disproves the asserted local integrality in a nondegenerate example. For any good prime p∤Δ the same obstruction appears by taking γ=p: H(x)=((1+x)^p−1)/(px) has p-integral coefficients below degree p−1 and coefficient 1/p in degree p−1. Hence the t coefficient (−1)^A((1+x)^(1−A)−(1+x)^(pA)/H(x))/x has x^(p−2) coefficient (−1)^A/p plus a p-integral element. This handles any finite excluded-prime set, including extra K₃ primes. Inverting γ is exactly the correction already anticipated by Definition 1.4.

The individual local-node checks are recorded in the packet's `review.checked` array. Their mathematical content is as follows; names below have the common prefix `HabiroNahmSeries:HB.9/`.

| Node | Independent check |
| --- | --- |
| `followup-saturation-transfer` | First-power divisibility permits writing a=pc; cancellation of the nonzero image of p in the domain and induction give divisibility by every power. Étaleness supplies no saturation assumption. |
| `followup-branch-loss` | A=5,p=5 gives δ=z⁻⁴ and T²=z⁴. The two maps T=±z² prove T−z² can vanish on the selected branch without vanishing in the full algebra. |
| `followup-regularisation-jet` | Root distribution and the Bernoulli expansion give all five residual vertices and the corrected constant subtraction. Cubic w³/h has positive Gaussian weight and must remain. |
| `followup-gaussian-first-jet` | Independent enumeration of pairings confirms the cubic-linear multiplicity three and cubic-cubic multiplicities nine plus six, including coincident indices. The five exact tests detect omitted terms or wrong multiplicities. |
| `followup-refined-linear-integrality` | Every cyclotomic Kummer denominator is a unit, the inverse Hessian is integral by its adjugate, and only 2,3,m occur in the finite vertices. Normalize individual constants, without dividing a possibly zero sum. |
| `followup-auxiliary-product` | The finite product and all APIs/tests are correct; its application description was corrected as explained above. |
| `followup-product-system` | Applying (33) to each factor gives the displayed parameter powers, tⱼ^γ positive recurrence and negative recurrence. Exact rank-two checks corroborate the formulas. |
| `followup-product-uniqueness` | At each positive total degree, the first differences remove parameter dependence; covariance multiplies the coefficient by q^αⱼ−1. Infinite order gives uniqueness. |
| `followup-integral-gluing-contract` | The unpowered volumes cancel and its system identifies a constructed family. Corrected localization to Δγ and local primes p∤Δγ (E66). Integral existence, faithful coefficient transfer and Frobenius descent remain explicitly conditional. |
| `followup-coleman-potential-sign` | Reflection and the Nahm logarithm relation give the positive sum of Dₚ(zⱼ). The Lean signature asserts this algebraic implication honestly. |
| `followup-modified-potential-formula` | Expanding φ(z)=zᵖexp(pη) gives the positive pβℓ₁ term, negative quadratic term and displayed higher Taylor terms. Legendre's bound makes their valuations at least one and tend to infinity for p>3. |
| `followup-regulator-specialisation` | Unit conditions place the points in the good Coleman discs. The actual Frobenius and analyticity suppliers justify reversing the Taylor calculation, without evaluating V(t) at t=1. |
| `followup-kummer-orientation-contract` | The inverse cyclic prefactor is verified. Monomials, the finite sum and the fixed exported ε=c² still require the requested signed comparison. |
| `followup-etale-module-contract` | B may have generic fibre K×K; the full product and Kummer action must survive descent. The field pullback supplier alone does not prove this extension. |
| `followup-descendant-pullback-contract` | t=q^(mν) starts at 1. Differentiating the logarithmic Nahm equations gives Λ⁻¹(mν/ζₘ). The zero, level-two and negative-shift acceptance examples agree. |
| `followup-unpowered-auxiliary-product` | Common t gives the source product; rescaling tⱼ by q^γ changes νⱼ by −γ. The four APIs and three tests distinguish it from the powered construction. |
| `followup-unpowered-product-system` | The positive recurrence uses tⱼ; the negative recurrence is unchanged; covariance uses q^γ. Exact coefficient checks confirm every equation. |
| `followup-unpowered-product-uniqueness` | The same induction gives multiplier q^(γαⱼ)−1. Positivity of γ and infinite order of q give the required cancellation. |

The definition APIs expose construction, constants, covariance, coefficient functoriality, specialization and integral-subring membership. Equality of inputs uses ordinary congruence for the actual finite sums and series operations. There is no private Gaussian theory or replacement indexed module. Every construction has at least three tests, with negative shifts and substitution order represented. The unavailable completed coefficient, Gaussian, Coleman and K₃/module carriers are named omissions in the suggested file. Its algebraic sign lemma is not advertised as a definition of Coleman functions. The two local planets mark a central construction and a central regulator identity; routine computations and open contracts are not extra planets.

The imported HB.9 inputs were inspected individually and have the following dispositions.

| Imported suffix | Disposition in this follow-up |
| --- | --- |
| `frobenius-on-the-coefficient-ring` | Use the lift and branch compatibility; a selected branch is not a full-ring embedding. |
| `dwork-difference-for-the-gaussian-data` | The corrected explicit Wₚ fixes the modified-polylogarithm signs and factors. |
| `frobenius-congruence` | Retain the target; faithful transfer and corrected HB.8 identification remain required. |
| `habiro-module-interface` | Use HB.7 local spans with integral constant and linear terms, allowing a zero sum. |
| `specialisation-at-one` | Use the coefficient-algebra map and étale Frobenius compatibility, retaining T. |
| `constant-term-is-the-unit` | Keep individual torsor units; require the full signed constant comparison. |
| `gluing-by-uniqueness-of-q-difference-solutions` | Use the unpowered system; integral construction and root transport remain gaps. |
| `potential-and-the-p-adic-dilogarithm` | Use the positive Coleman sign and specialize the completed Wₚ expression. |
| `module-membership` | Retain Theorem 5 with its root-order restrictions and full quadratic étale coefficients. |
| `descendants-by-specialisation` | Replace a fixed t=1 proof route by the level-m curve and recorded transport obligation. |
| `p-adic-regulator-input` | D.1/D.3/D.4 requests keep normalization, unramified integrality and localization distinct. |
| `torsion-powers-lie-in-the-ring` | Unrestricted orders need the additional Corollary 1.11 extension in G-all-order-gluing. |
| `bloch-torsion-converse` | Preserve nonvanishing at infinitely many permitted prime orders. |
| `hypotheses-that-cannot-be-dropped` | Preserve symmetry, nondegeneracy, Nahm units and excluded primes. |
| `verifying-the-defining-conditions` | Shape, local span and product gluing have separate inputs. |
| `constant-terms-of-the-series` | Keep the square-root coefficient algebra and the possible vanishing of sums. |
| `symmetrisation-lies-in-the-ring` | γ=1 cancellation is valid; unrestricted orders require the recorded extension argument. |

The HB.8 Gaussian, coefficient-ring, F_A/system and identification statements were read directly. HB.4 supplies the Euler scalar. HB.2 supplies the actual cyclic dilogarithm, Kummer class and fixed finite Chern interface; its unresolved sign cannot be chosen to fit the target. The accepted HB.7 follow-up supplies field pullback and an effective-descent contract with an open proof obligation, not the asserted full split-algebra theorem. HB.6 distinguishes coefficient Frobenius fixing the cyclotomic coordinate from absolute Frobenius on prime-to-p cyclotomic algebras. The HabiroRings étale lift supplies uniqueness and naturality. The four cited Coleman L2 nodes supply integral modified polylogarithms, Frobenius relation, good-disc analyticity and reflection. The D.1, D.3 and D.4 stage statements cover precisely the requested normalization, integral local regulator and global localization. No supplier is substituted by an unrelated near match.

E64 is confirmed independently from (59). Root distribution turns the leading dilogarithm into Li₂(Zexp(mw))/(m²h). Its linear and quadratic terms therefore have denominators mh and 2h. The B₁ term is −B₁(s)log(1−y), so removing it requires the positive constant-log sign. At m=1 the printed formula changes the Hessian and fails constant normalization.

E65 is confirmed after the E64 correction: the inverse Euler denominator contributes exp(Nh/24). An exact rational-function calculation provides an independent check. For A=(3),m=1, put C=(z−1)/(3−2z), b=3/2+z/(2(1−z)), Q=z/(2(1−z)²), T=z/(1−z)², U=z(1+z)/(1−z)³ and c=z/(12(1−z)). Substituting these into the first-jet polynomial and adding 1/24 equals the coefficient in (242), with t=(z−1)/z³ and δ=(3−2z)/z³, exactly over Q(z). Cross-multiplication gives the zero polynomial. Without the Euler contribution the discrepancy is −1/24. This calculation uses the inherited E41 correction to the principal part and proves a first-coefficient identity; it does not prove corrected HB.8 identification at every order.

Additional exact checks enumerated Wick pairings for covariance matrices ((2,1),(1,3)) and ((−1,2),(2,1)). The auxiliary systems were tested using the defining coefficients (31), through total degree four, at q=2 and γ=2, for matrices ((3,1),(1,2)), ((0,−1),(−1,1)) and ((−2,2),(2,−1)). Both zero shifts and μ=((1,−2),(−1,1)), ν=(2,−1) were used. The two families satisfy 1,440 coefficient equalities covering every positive/negative recurrence and covariance. These finite checks supplement the general proofs; they do not establish all-order integrality.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.9.json` reports zero errors and zero warnings. The source-issue schema and version metadata pass the corresponding errata validation functions. `lean-check research/blueprint/suggested/HabiroNahmSeries--HB.9.lean` elaborates at the exact pinned Mathlib with exit code zero and only 32 warnings that declarations use `sorry`. Memory exceeded the required threshold before compilation, and only one compile was run at a time. This Mathlib-only elaboration does not certify the missing Tau Ceti, Gaussian or arithmetic proofs. `git diff --check` passes.

The remaining work is precisely G-coefficient-transfer, G-HB8-identification, G-kummer-orientation, G-all-order-gluing (including the unrestricted-order corollaries), and G-descendant-transport, with the six requests to HB.8, HB.2, HB.7 and PadicHodgeRegulators D.1/D.3/D.4. There is no blocking question for the orchestrator. An eventual assembly should carry these import limitations into the combined reader and arrange correction of the base packet's single-branch and powered-integrality proof descriptions through their owning job. This review neither edits another job's files nor treats their accepted status as evidence for those contradicted proof routes.
