# Independent package review: CyclotomicClassGroupsAndStickelberger

Verdict: **accepted with the corrections in this submission**. Reviewer: Codex, session `codex-1cnoFN`, 20 October 2026. Job: `REV-PKG-CyclotomicClassGroupsAndStickelberger~codex`; issue #11266. The package author was a different session. The review concerns the cyclotomic package and its 47-node accepted plan, rather than the unrelated parenthetical title in the generated issue.

The issue refers to a previous round-two report and review object. Neither file exists at the input commit `85901bab151d1397787fccdbd6359fb35f32c868`. This is a fresh fixing review of that commit's package; no earlier verdict has been inferred. The packet is unchanged.

## Corrections

1. **Remove a current-library duplicate.** Current Tau Ceti already defines generalized Bernoulli values in `TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli`. Its `DirichletCharacter.generalizedBernoulli_def` supplies the finite formula in every degree, `map_generalizedBernoulli` supplies coefficient extension, and `generalizedBernoulli_one_of_ne_one` supplies the weighted first character sum. The package's `firstCharacterBernoulli` definition and its two Lean examples were deleted. The degree-two finite formula is also consumed rather than replanned. The README boundary names the existing declarations. Section 3.1 retains parity, modulus-induction and generating-series comparisons; §4.2 retains the analytic special-value and integral constant-term comparison. These arithmetic results are not supplied by the current module. No unavailable current-library import was added to the pinned Lean file.
2. **Conductor-one sign.** Section 2.1 incorrectly called the primitive trivial first Bernoulli value `−1/2`, contradicting §3.1. It is `+1/2` under the endpoint convention used by the native generalized value and by `L(0,1)=−1/2`. Ordinary `bernoulli 1` remains `−1/2`. Nontrivial-character formulas retain their original signs.
3. **Regularity citations.** Sharifi Definition 1.1.1 and Theorem 1.1.2, pp.1–2, do not supply the claimed regularity criterion. Replace them by Example 1.3.14, p.18, the class-field results of §1.3, the class-number product in Theorem 4.2.20, pp.107–108, reflection in Corollary 4.4.4, p.113, Herbrand in Theorem 4.5.7, p.117, and Mazur I Corollary 2.9, pp.53–54.
4. **Tower citations.** Sharifi Theorem 4.5.8 is the minus Stickelberger-index theorem on p.117, not a regular-prime or dyadic class-number theorem on p.118. Section 5.4 now cites Lemma 1.3.13 and Example 1.3.14, p.18. The dyadic proof starts above the Gaussian base field and uses the cyclotomic ramification calculation, §3.1, pp.75–77. Norm surjectivity for the real field cites Lemma 1.3.8 and Corollary 1.3.9, p.16.
5. **Supplier precision.** GlobalNumberFields Layer 10 supplies cyclotomic splitting, ramification and conductor normalization. Integer rings, maximal real fields, unit lattices, regulators and the analytic class-number formula here use Mathlib. Norm/extension arithmetic comparisons are §0.3 targets. The boundary now identifies ClassFieldTheory Layers 10 and 13 for unit/S-unit Herbrand calculations and ModularForms Layers 0, 2, 4 and 8 for the modular inputs. The Layer 0 dependency paragraph agrees with those boundaries.

No prime, positive level, packet milestone or consumer contract was removed. The Bernoulli deletions remove a second implementation of existing work, with the arithmetic comparisons preserved on its native carrier.

## Form, coverage and dependencies

Compared the package with the ClassFieldTheory and GlobalNumberFields upstream roadmaps, their current supplier sections, and UPSTREAM_GUIDE. The README opens with a summary, then ownership, conventions, exact supplier contracts, nine ordered layers, APIs, discriminating Checks, examples, dependencies and references. It is below 200 KB. `metadata.toml` remains exactly `topic = "math.NT"`. No packet IDs, review narrative, placeholder target tables or private filesystem paths occur in the roadmap.

The accepted plan's complete target inventory is retained:

| Plan family | README coverage and dependency finding |
| --- | --- |
| C0, five nodes | §§0.1–0.5: native action, primary tensor comparison, tame decomposition, real/dyadic distinctions and the principal prime's class-field quotient |
| C1, eight nodes | §§1.1–1.7: relative unit saturation, Hilbert 90 comparison, Hilbert 91–94, invariant ideals, capitulation and one-prime control |
| C2, five nodes | §§2.1–2.5: rational element, denominator/integral ideals, positive smoothing, Gauss factorization and full class-group annihilation |
| C3, five nodes | §§3.1–3.4: native Bernoulli arithmetic comparisons, exceptional annihilator, Herbrand, reflection and class-number/regulator products |
| C4, six nodes | §§4.1–4.5: determinant bound, Eisenstein congruence, residual extension, finite-flat splitting, unramified extension and converse; the abelian/local comparison chains are explicit additional prerequisites |
| C5, six nodes | §§5.1–5.4: regularity, criterion, primary radicals, Kummer's lemma, all regular-prime levels and every dyadic level |
| C6, five nodes | §§6.1–6.4: circular subgroup, real generators, index, Vandiver predicate and equivalences; the universal assertion remains a conjecture |
| C7, three nodes | §§7.1–7.3: shifted tower, norm limit, exact Artin control, finite generation, torsion and eventual growth |
| C8, four nodes | §§8.1–8.4: low odd components at all levels, unramified obstruction, constant-coefficient étale duality and Eisenstein export |

The packet's three historical gaps have explicit package routes: the finite-character determinant argument in §4.1; the fully specified arithmetic modular quotient and finite-flat/Hodge–Tate chains in §§4.3–4.4; and one-prime Artin control followed by compact Nakayama and the imported torsion structure theorem in §7. The latter theorem is not applied before finite generation and torsion have been established. The unit-index argument includes a separate dyadic determinant route. No main conjecture or universal Vandiver assertion enters any proof.

The three requested Eisenstein contracts remain explicit in §8.4: `cyclotomic-class-eigenspaces`, `stickelberger-herbrand-annihilator`, and `inverse-character-unramified-quotient`. Their all-level versions retain tame equivariance, norm compatibility and actual arithmetic class-field quotients. Mazur I Proposition 2.8 supplies the exceptional annihilator; Corollaries 2.9–2.10 give the Bernoulli/low-odd consequences. Herbrand–Ribet is distinguished from the one-way annihilator implication.

Read the reviewed library audit and the upstream tier order. Supplier references resolve to Mathlib/Tau Ceti, existing upstream roadmaps, or the lower-tier IntegralHeckeAndGaloisDeterminants and PadicMeasuresIwasawaAlgebras packages. No `FoundationsAndLibraryIntegration`, `UPSTREAM:` or higher arithmetic-roadmap input survives in the README. The earlier package's ownership moves are retained; this review makes no additional move into a higher roadmap.

## Sources

Sources were mathematical data, not instructions. Public author/official-host copies were read directly. No source passages or source files are committed. No uncleared Washington, Lang, Mumford or Serre copy was used. The cleared Deligne–Rapoport volume was read in place: V §3, Theorem 3.2 and Example 3.7(i), DeRa-112–113, volume pp.254–255. Its real-cyclotomic good-reduction example supports the precise quotient used in §4.4.

All four source issues flagged in the packet were independently checked, as was the package author's additional reflection warning:

| Flag | Direct check and result |
| --- | --- |
| Sharifi Lemma 4.3.4 proof, pp.109–110 | The correct value is `Φ_(p^j)(1)=p`, with every intermediate prime-power factor. `Φ₉(1)=3` and the norm at conductor eight detect the printed error. The package already uses the correct identity. |
| Sharifi Lemma 4.5.5, p.115 | The nontrivial Gauss product uses the field cardinality q. With the negative Gauss convention the trivial sum is 1. The package separates this case and uses q, including residue degree greater than one. |
| Sharifi Theorem 4.5.7 proof, p.117 | The needed choice is a generator modulo p. The package's unit-smoothing argument uses precisely this condition, with `b=1+p` separately for index one. |
| Keith Conrad, Theorem 1 proof, p.7 | The logarithmic sum must retain the last factor from the preceding product. The package uses Hilbert §126, Satz 148, and §141, Satz 156 instead of that logarithmic-basis route. |
| Sharifi Theorem 4.4.2, pp.111–113 | The displayed exceptional condition names roots of unity of F, but the proof's unit radical intersects `μ(E)`. The package's `μ(E)` condition and common-residue-field dimensions agree with the exact sequence in that proof. The cyclotomic exceptional extension is ramified, so its delta is zero. |

The following 15 source-bearing entries were sampled from the input README using seed 11266; the original line numbers identify the sample before the review edits. Each cited statement was opened and its hypotheses and page numbering compared. Additional checks included the erroneous regularity/tower locators corrected above, the abelian-variety construction, Raynaud, the local-character theorem and the cleared good-reduction source.

| Input line / package section | Locator inspected | Result |
| --- | --- | --- |
| 200 / §1.2 | Hilbert §55, Satz 91, pp.272–275 | Relative independence modulo the cyclotomic uniformizer; degree-two infinite-place qualification retained |
| 287 / §1.7 | Sharifi Proposition 1.3.11, Corollary 1.3.12, pp.17–18; Remark 3.2.12, pp.80–81 | Inertia-sum exact sequence and one-total-prime norm control match |
| 331 / §2.2 | Sharifi Definition 4.5.1(b), Lemma 4.5.2, p.114 | Integral ideal and coefficient-denominator criterion match |
| 414 / §3.1 | Mazur I §2, pp.52–54; Ribet Lemma 3.1, pp.156–157 | Nonexceptional congruence and separate exceptional denominator retained |
| 461 / §3.3 | Sharifi Lemma 4.4.3, Corollaries 4.4.4–4.4.5, p.113 | Unit rank, reflected ranks and exceptional zero components match |
| 465 / §3.4 | Sharifi Lemma 4.2.17, p.106 | Hasse index one at the stated prime-power CM conductors, including powers of two |
| 537 / §4.2 | Ribet Lemma 3.1, pp.156–157 | Constants and different-weight Fourier congruence match; existing finite Bernoulli formula now imported |
| 588 / §4.3 | Milne 2022 §13, Theorem 13.3(a)–(b), p.25 | Euler characteristic, top intersection and polarization degree match |
| 604 / §4.3 | Ribet Proposition 4.1, p.160 | Local algebraicity and the large-prime trace contradiction match; their prerequisite constructions remain explicit |
| 629 / §4.4 | Tate §§2.1–2.4, Proposition 1, pp.162–164, Proposition 3, p.166 | Formal-group equivalence, dual dimension identity and generic Tate-module hypotheses match |
| 820 / §6.4 | Soulé, Introduction, p.1 | Vandiver is a conjectural real p-class vanishing assertion |
| 851 / §7.1 | Sharifi Definition 3.2.3, p.78; Lemma 1.3.8, p.16 | Norm limit and norm-image description match |
| 864 / §7.2 | Sharifi Proposition 3.2.6, Corollary 3.2.7, p.79 | Inverse-limit class-field identification matches |
| 880 / §7.3 | Sharifi Proposition 3.2.11, pp.80–81 | Arithmetic finite generation/torsion route matches; the compact-module input is named |
| 912 / §8.1 | Mazur I Proposition 2.8, Corollaries 2.9–2.10, pp.53–54; Sharifi Corollary 1.3.12, p.18, Remark 3.2.12, p.81 | Base-level odd vanishing and its all-level propagation match |

Additional source checks: Stacks Varieties §45, tags 0BEM and 0BEP–0BEV, pp.101–104, supplies the mixed-coefficient intersection convention including negative twists; Milne 2008 I §10, §§14 and II §1 supplies the degree polynomial, Rosati trace and Frobenius bound; Milne CFT VII §3, pp.208–209 supplies the archimedean Herbrand factor. Raynaud Proposition 3.3.2, p.267, and Theorem 3.3.3/Corollary 3.3.6, p.268, require the strict small-ramification bound. Tate §3, pp.176–177, and §4.1, pp.179–180, distinguish the nonzero-twist vanishing from untwisted cohomology. Brian Conrad Appendix B, pp.32–34, supplies the embedding-indexed character comparison. Tate references concern *p-Divisible Groups*, not Tate's thesis.

For reproducibility, the public source versions inspected have these SHA-256 hashes:

| Source | SHA-256 |
| --- | --- |
| Sharifi, 189-page author PDF | `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26` |
| Ribet, Berkeley author PDF | `6985813b4026bb0fd7098aed3f816262e0922f62a5d2dab22e29bcc2eb323471` |
| Mazur, Numdam PDF | `c20c7e73be20d6cc961127504b6be019f7707e0ee6154ba1fac0bbfd5973be8a` |
| Raynaud, Numdam PDF | `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` |
| Tate, Boston University hosted scan | `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` |
| Brian Conrad, author PDF | `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd` |
| Keith Conrad, author PDF | `4739a256159d1cf74184a34849d2ef3b6a5fd6dcb18ece90d02ea52bb99f1bc2` |
| Soulé, arXiv v1 PDF | `1e1acc3e9e375379fd863606a81943b616195cd6432081383826bf38c2ce57dd` |
| Milne AV, 2008 | `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef` |
| Milne AV, 2022 | `bffdf81c57c77420b5454b31270007989d12f332abea62424be15c424079fc7c` |
| Milne CFT, 2020 | `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5` |
| Stacks Varieties PDF | `ed339c312c86721e3f830876da14cabe89a96e83e454a78b7cd355555f4bca45` |
| Hilbert, official e-rara plaintext of item 2944458 | `e4d58252f805f00213729aee8231f51577eee03c676dc95058c6ee5e56efd519` |

Source links and full bibliographic identities are in the package references. The Hilbert text comes from the official digitization linked there. Hashes identify the checked versions, rather than relying on mutable PDF page numbering alone.

## Library and duplication audit

Read the relevant declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, `IsCyclotomicExtension.Rat.galEquivZMod` sends the native root to its a-th power; `RingOfIntegers.mapRingEquiv` restricts that field automorphism; `ClassGroup.mulEquivHom` and `mulEquiv_mk0` use the covariant ideal map. The native CM unit-index/regulator and Dedekind-residue statements have the required normalizations. The primitive Dirichlet functional equation is already available and is consumed rather than reproved.

Searched the current TauCetiRoadmap tree at `0d144d044dacebca17b654695b6f1ad58f159b27`, including all nine newer roadmaps and Completed, by objects and hypotheses as well as declaration names. Also searched current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The new overlap found is the generalized Bernoulli module, removed as described above. The generic Tate-module carrier was already correctly imported in the README and is not rebuilt. Existing curve Riemann–Roch and coherent cohomology are supplier inputs; the abelian numerical intersection/degree/Rosati comparison is a different, retained target. No other duplicate requiring removal was found. Neither current checkout was modified or built.

## Adversarial mathematics pass

Every subsection's definitions, identities, hypotheses and conventions was checked. The table groups the individual targets by the mathematical calculation used to test them. Every definition has at least three discriminating prose Checks; the eight light Lean definitions have fourteen proved examples in total, at most two per definition. Heavy objects stay in the README and are identified in the Lean closing comment.

| Statements / definitions | Instances and negative controls | Outcome |
| --- | --- | --- |
| Primary class module, tensor equivalence and covariant action, §0.1 | Order p² versus order prime to p; zero class group; conductor-five powers 2 and 3 | Integral tensor keeps p-power torsion; inverse automorphism would fail the root/action witness |
| Tame components and sum, §§0.2–0.3 | Zero module; order-four action on a 25-torsion module; indices −1 and 3 at p=5; wild action at level two | Reduction condition fixes omega; all tame components retained; no wild-invariant substitution |
| Norm/extension identities and real comparison, §§0.3–0.4 | Quadratic two-term orbit; p-torsion killed by the degree; odd versus dyadic coefficients | No cancellation of a nonunit degree or unjustified class-extension injectivity |
| Three dyadic minus constructions, §0.4 | Trivial involution on order two and order four groups; negative involution on order five | Comparison defects are two-torsion; no integral plus/minus splitting claimed at two |
| Prime above p and split-at-p quotient, §0.5 | Conductor two; residue norm at p²; unrelated nonprincipal prime | Class-field quotient uses principality, not total ramification alone |
| Saturated units and fundamental systems, §§1.1–1.2 | Real quadratic and cyclic cubic examples; units with a base-field power; imaginary quadratic counterexample | Saturation and no infinite ramification are necessary; projectivity/local freeness replaces global freeness |
| Hilbert 90/92, §1.3 | Degree one; norm-one representatives; archimedean factor | Cohomology count retains the full unit norm index and degree |
| Invariant ideals and Hilbert 93, §1.4 | Unramified prime; ramification index e; orbit ideal | Residue exponents are modulo e, independently at each prime |
| Capitulation and Hilbert 94, §§1.5–1.6 | Principal ideal, alternate generator, trivial extension, infinite ramification | Cocycle is independent modulo coboundaries; exact kernel count retains no-infinite-ramification hypothesis |
| One-prime control, §1.7 | Trivial extension; unramified cyclic extension; one versus two inertia groups | Inertia-sum kernel is retained; norm isomorphism requires the stated total-prime hypotheses |
| Stickelberger element and denominator ideal, §§2.1–2.2 | Conductors 1, 2 and 5; trivial versus nontrivial even character | Basis inverse witnessed by unequal 2/5 and 3/5 coefficients; conductor-one Bernoulli sign corrected |
| Positive smoothing, §2.3 | b=1; b replaced by b+m; m=5,b=2 coefficients 0 and 1 | Integer b is not replaced by its residue; floor coefficients agree with positive smoothing |
| Gauss data, valuations and full annihilation, §§2.4–2.5 | Trivial character; residue field of square size; inertia substitution; all conductors at least two | Field cardinality, negative Gauss sign and inverse inertia character retained; descent occurs before principal-ideal cancellation |
| Bernoulli comparisons and congruences, §3.1 | Moduli 3 and 4; conductor one; new prime with zero Euler factor; p=5,k=2 | Current finite value imported; distinct-prime induction and generating-series denominator specified; exceptional value separated |
| Herbrand and exceptional components, §3.2 | Index one versus minus one at p=5; coincidence at p=3; b=1+p | Integral smoothing handles the pole; converse is not inferred from annihilation |
| Reflection and Kummer radical, §3.3 | Representative multiplied by a pth power; valuation one; residue-field extension; constant versus roots-of-unity target | Ideal class map is well-defined; mu(E) and common-field dimensions independently confirmed |
| CM units and class-number products, §3.4 | Conductors 3, 4 and 8; conductor two; abstract rational class-number quotient | Hasse index one and roots-of-unity factors correct; integrality uses norms, not the quotient definition |
| Centered residue matrix and bound, §4.1 | Matrices at p=3 and 5; representative sign changes; odd/even character spaces | Determinant factor `(2p)^(d−1)` and squared row norm agree; no circular use of Ribet |
| Eisenstein constants and unit-constant form, §4.2 | k=2; fixed points in the even-index involution; unit/nonunit constant | Different weights compared as Fourier series; zero Euler factors are not ignored; counting includes fixed points |
| Residual eigencharacter lifting, §4.2 | Rank one; coincident residual eigenvalues; zero lattice; residue-field torsion module | Occurrence and finite freeness are essential; no unnecessary residual-distinctness hypothesis |
| Modular quotient and Tate realization, §4.3 | Coefficient rank two versus full Tate rank; elliptic quotient; arithmetic Frobenius; lattice rescaling | Genuine arithmetic realization precedes residual lattice choice |
| Torsion levels and Tate rank, §4.3 | n=0; dimension zero; elliptic/product examples; auxiliary prime equals characteristic | Point count is separated from group-scheme degree; generic characteristic restriction retained |
| Numerical intersections and degree polynomial, §4.3 | Negative degree on the projective line; two rulings of a quadric; closed point degree; product and zero endomorphism | Mixed coefficient has no spurious factorial; rational endomorphisms allow denominators; dimension zero treated separately |
| Abelian Riemann–Roch and Rosati, §4.3 | Degree-zero line bundle; principal/product polarization; scalar and off-diagonal endomorphisms | Positive denominator is stated; trace formula and Frobenius absolute value have general dimension/characteristic scope |
| Line characters and irreducibility, §§4.3–4.4 | Cyclotomic/trivial/unramified character; nonintegral p-adic weight; primes at least seven | Local algebraicity is proved through Hodge–Tate comparison; finiteness of the global remainder uses global reciprocity |
| Finite-flat models and local splitting, §4.4 | Strict e bound; constant line versus ramified quotient; alternate stable lattice | Model supplied by an isogenous abelian variety; connected complement descends to full decomposition group; e=p−1 is excluded |
| P-divisible groups and local comparison, §4.4 | Multiplicative, étale, product and zero groups; finite group killed by p; special-fiber characteristic p | Height and dual dimensions match; Hom twist is −1; untwisted H¹ is not declared zero |
| Unramified modular extension, §4.5 | Split residual extension versus nonsplit one; p-local tame image | Nonzero elementary p-extension follows from nonsplitting; local splitting removes p-inertia |
| Regularity, primary radical and Kummer lemma, §§5.1–5.3 | p=1,2,3; unit zeta versus congruence modulo p; valuation threshold p | Predicate's arithmetic use assumes primality; lambda versus p congruence is not weakened; unramified radical proof avoids logarithmic typo |
| Odd and dyadic towers, §5.4 | All positive levels; rational and Gaussian bases; real class-group norm | Correct one-prime source replaces false locator; no infinite-ramification induction step through Q(i)/Q |
| Circular subgroup, real generators and norms, §§6.1–6.2 | Primitive and imprimitive exponents; real sign choices; smallest odd and dyadic conductors | Torsion and intermediate prime-power factors retained; dyadic real units use integral representatives |
| Circular determinant/index and Vandiver, §§6.3–6.4 | Rank-zero base fields; conductor eight; unit/class index versus group isomorphism; p=1 | Determinant route includes dyadic levels; conjecture is not promoted to a theorem |
| Norm limit and Artin control, §§7.1–7.2 | Zero class groups; a nonprincipal S-prime in an unrelated field; dyadic base shift | Exact control is arithmetic one-prime control, not a formal property of inverse limits |
| Finite generation, torsion and growth, §7.3 | Compact versus discrete divisible module; positive free Lambda rank; Lambda/(T−p); tower shift | Nakayama precedes structure theorem; finite coinvariants force torsion; nu is an integer; shift changes mu and nu correctly |
| Low odd components and unramified quotients, §§8.1–8.2 | p=3; p=5 exponent reduction; the 691 exception; finite and infinite levels | Index reduced before Bernoulli test; all-level result uses p-group control; quotient has actual conjugation action |
| Constant étale duality and Hom character, §§8.3–8.4 | p=5 source exponent three and two different targets; trivial source/target/group; characteristic-p fiber | Inverse exponent −i differs from Kummer exponent 1−i; Lean witnesses actions 2 and 4 |

## Lean and final validation

The revised `Suggested.lean` has 260 lines, eight real-bodied light definitions, fourteen proved examples and ten admitted theorem targets. No sorry-defined carrier, sorry example, `set_option`, auxiliary development chain or unavailable import is present. Heavy definitions and their full generality remain in the README and closing comment. All ten theorem signatures were compared with their README statements:

| Lean theorem | Hypotheses and scope checked |
| --- | --- |
| `cyclotomicClassEigenspaces` | Odd prime, actual Teichmueller reduction, all tensor classes, unique full sum |
| `stickelberger_smoothing_annihilates` | Every conductor at least two, positive integral smoothing parameter prime to it, native full class group |
| `herbrand_ribet` | Odd prime, even index in the exact Bernoulli range, covariant exponent 1−k, integer numerator |
| `kummer_criterion` | Full native class number, prime and oddness hypotheses, exact even-index range |
| `kummer_lemma` | Integral unit and congruence modulo p; unit pth root in the same native integer ring |
| `regular_prime_power_class_number` | Every positive level at every regular odd prime |
| `dyadic_class_number` | Every positive dyadic conductor, including the rational field |
| `vandiver_of_regular` | Native maximal real subfield and regular odd-prime hypothesis |
| `cyclotomic_class_number_growth` | Every prime, dyadic conductor shift, eventual quantifier, nonnegative mu/lambda and integer nu |
| `inverseCharacterClassGroup` | Actual Teichmueller section, odd prime, exponent minus one; all-level extension remains a README target |

Validation completed successfully:

- `lean-check research/blueprint/packages/CyclotomicClassGroupsAndStickelberger/Suggested.lean`: exit 0, exactly ten declaration-uses-sorry warnings, no other warnings or errors.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CyclotomicClassGroupsAndStickelberger.json`: zero errors and warnings; the historical packet is unchanged.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables and handoff: zero problems.
- `git diff --check`: clean.

These checks validate the roadmap package and representative signatures; the admitted theorems are future formalisation work. No unresolved package defect remains from this review.
