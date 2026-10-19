# Independent package review: SpecialValuesBirchTate

Review of #10960, job `REV-PKG-SpecialValuesBirchTate~adv`, by Codex (GPT-6),
session `codex-XwqxOn`, 19 October 2026. The package was written by another
worker. This report is also the handoff for the remaining supplier work.

**Verdict: needs_changes.** The package has been corrected in place and its
suggested Lean file elaborates. Five prerequisite proofs remain unfinished in
the supplying plans. They are identified below rather than treated as theorems
already decomposed. The review itself is complete; this is not a checkpoint or
an assertion that the mathematical end theorems are false.

## Remaining defects and where to resume

1. **The independent integer tame-kernel certificate.** K2SymbolsBrauer T.5's
   `integer-kernel-upper-generation` reduces the integer calculation to the
   finite-rank monomial-kernel theorem. The supplying reader document's T.3
   gap 5, `G-monomial-kernel`, still records that theorem without a T.2 target
   providing the proof for commutative rings and finite rank at least three.
   The field and semilocal results in T.2 do not apply to ℤ. Supply the
   finite-word reduction, its precise rank hypotheses and its passage to the
   stable kernel in that owner. The sign-symbol lower bound does not repair
   this upper-bound gap. Package §3.1 therefore has a conditional independent
   certificate, not a closed independent derivation of #K₂(ℤ) = 2.
2. **The independent ℚ(√5) certificate.** ArithmeticKTheory N.8's
   `real-quadratic-upper-generation` uses the vanishing of the tame kernel of
   ℚ(ζ₅). Its target `tame-kernel-of-q-zeta-five` still depends on the
   generalized Thue input of Skałba, *J. Number Theory* 46 (1994), 303–322,
   which the owner has not obtained and decomposed. Resume at N.8's recorded
   gap: supply that input and its use in the Zhang–Xu residue-generator
   argument, then check restriction/corestriction and the two-generator
   bound over ℚ(√5). The two real sign characters prove the lower bound four;
   they do not supply the missing upper bound. Using Birch–Tate itself would
   destroy the independence required of package §3.2.
3. **The classical–modern module comparison at 2.** The requested I.10
   dictionary in `IntegralIwasawaTheory--I.1.json` is not a verified diagram
   of module maps. The campaign reader document itself distinguishes it from
   the supplied characteristic-ideal calculation. Supply Kummer duality with
   the norm-kernel minus module, the real inertia, the κ² twist and the
   finite-specialisation exact sequences, retaining the order-two Selmer
   cokernel and the finite Tor terms. Kurihara's height-one identity alone
   does not determine those finite terms. The abelian μ = 0 argument cannot
   be extended to an arbitrary totally real field. Package §7.5 now explicitly
   retains this gap; §§7.1–7.4 use the ramified-module route independently of it.
4. **The bounded compact-support model at real dyadic places.** The accepted
   I.8 plan still records source/proof gap G1 in
   `IntegralIwasawaTheory--I.8.json`, affecting
   `burns-flach-iwasawa-complex`, `compact-complex-cohomology` and I.9's
   determinant main conjecture. Kurihara §4.1, pp. 22–23, refers to
   Burns–Flach 1996, Proposition 1.20 and p. 86
   (DOI `10.1007/BF01444212`). The supplier must
   furnish the bounded model, its real-place treatment, and its perfectness
   and base-change comparison with the Selmer construction, including p = 2.
   An unbounded complete Tate cone is not a replacement. This qualification
   affects the modern route too. The original 1996 passage was not independently
   verified here; the defect is documented in the supplier and its use in
   Kurihara was checked.
5. **The all-prime Ferrero–Washington adapters.** The same supplying plan's
   gap G3 remains in L4's digit-separation and Bernoulli-obstruction route:
   the finite torsion-root lattice, dyadic Kummer reflection/descent and
   coefficient-trace comparison still need their exact proof adapters.
   The supplier records Oesterlé, Séminaire Bourbaki 535, §§3–6,
   pp. 173–180, and the original
   Ferrero–Washington article (DOI `10.2307/1971116`).
   Those original passages were not independently certified in this review.
   Finish that independent route before treating the μ = 0 input of §6.5 as
   a closed proof; do not derive it circularly from the main conjecture it is
   used to establish.

These are existing supplier deficiencies, not new ownership assignments.
Only the issue's permitted package and review files were edited. The packets,
supplying plans, atlas and upstream checkouts were not changed. The I.8 packet's
other gap, G2 on the general circular-unit index, is not an additional direct
prerequisite of the argument here.

The fourth gap inherited from the original SpecialValuesBirchTate packet was
the arbitrary ramified abelian/second-kind comparison. The consumer now gives
the inverse-character measure test, the maps between the norm kernel,
anti-invariants and the quotient by 1 + j, and the finiteness argument under the
precise finitely generated μ = 0 hypothesis. Greither's exceptional character
branch was checked on p. 470. This repairs that consumer proof plan; it does
not erase the distinct unfinished Ferrero–Washington proof in item 5.

## Review basis and ownership audit

Read WORKERS, PACKAGE_REVIEW, UPSTREAM_GUIDE, the expansion protocol and the
applicable blueprint protocol sections, the complete package, its accepted
54-node packet and eight-stage library audit. The shape comparison used the
PadicMeasuresIwasawaAlgebras exemplar and the current upstream
ArithmeticDirichletSeries and ProfiniteArithmetic roadmaps, including their
suggested files. Their older admitted-data examples do not override the current
rule against admitted carriers.

The atlas checkout was `ded1a70165e3d3df66d8ed847d734695148f8da8`;
the current upstream roadmap checkout was
`0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library
was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Pinned checks used Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Searches used the mathematical objects and hypotheses, including ramified and
minus Iwasawa modules, cohomology with Tate twists, finite-field K-groups,
relative K₀, special values, regulator covolumes, and the concrete quadratic
field. They covered all nine roadmaps newer than the atlas snapshot and the
four newer Completed roadmaps. The arithmetic use of the name Iwasawa is not
the Iwasawa decomposition of Lie groups. EffectiveBounds' existing unit
regulator does not construct the higher-weight motivic regulator.

| Existing owner | Boundary checked and disposition |
|---|---|
| Current Tau Ceti, `ArithmeticDirichletSeries/EulerProduct/Logarithm/DedekindZeta/Basic.lean` | `dedekindZeta_ofReal_eq_exp_tsum_neg_log_one_sub` and `dedekindZeta_re_pos` already give reality/positivity. Added them to the boundary and kept only the stronger lower bound 1 in §2.2. No separate positivity construction is assigned here. |
| Current Tau Ceti, `ArithmeticDirichletSeries/EulerProduct/Restrict.lean` | Read `LSeries_ofBadPrimes`: it supplies the finite Euler product on the convergent half-plane. §4.1 adds continuation and negative-integer evaluations, not that coefficient/series construction. |
| Current Tau Ceti, `NumberField/DedekindZeta.lean` | Read `exists_differentiableOn_eq_LSeries_ofBadPrimes_sub`: its continuation region alone does not include the negative integers required here. |
| Current Tau Ceti, `NumberField.Sqrt5` | Checked the generating polynomial X² − X − 1, discriminant, total reality, class number, torsion order and splitting/inertia declarations. These arithmetic inputs remain deferrals; the package owns the special-value evaluation. |
| LFunctions; BorelRegulators | Continued zeta, functional equations, quadratic factorisation and exact leading terms stay with those owners. Fixed the complex-place cross-reference to §8.2. No theorem from Tate's thesis is planned or cited as a theorem source. |
| ArithmeticKTheory; MotivicEtaleKTheory; K2SymbolsBrauer | K-groups, finiteness, roots-of-unity invariants and comparison/residue maps stay with their owners. The package uses their exact contracts and exposes items 1–2 above. |
| IntegralIwasawaTheory and the p-adic L-function owners | No second construction of the Iwasawa algebra, compact complex, main conjecture or measures. The consumer's value/series conversions are distinguished from these inputs. Items 3–5 remain explicit. |
| GeneralAlgebraicKTheory; PeriodsAndSpecialValues | Relative K₀, fundamental lines and the general ETNC remain supplied. §8.6 is the Tate-motive specialisation with its data and rationality predicate. |

No target in the nine new roadmaps or four Completed roadmaps required an
additional ownership transfer. No `FoundationsAndLibraryIntegration` or
`UPSTREAM:` dependency remains. The Caraiani–Newton order does not assign this
package and most of its K-theoretic suppliers a tier: it cannot certify their
relative tiers. No upward citation in that listed order was found, and no
unlisted tier or bundle has been invented to justify closure.

## Source verification

All eight public PDFs below were opened on 19 October 2026. Printed pages are
used throughout. No source passages are reproduced. Hashes agree with the
latest recorded source versions in the input packet; an older Kolster 1989
hash is not mistaken for the current version.

| Source read | Exact passages used | SHA-256 of public PDF |
|---|---|---|
| [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), 29 August 2013 | III.6.5 p. 236; IV.1.13 p. 269; V.6.8 pp. 411–412; V.11.13 p. 458; VI.8.6–8.8 pp. 514–516. Printed page = PDF page − 8. | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [Kolster 2009](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf) | Lecture 1 pp. 8–12; Lecture 2 pp. 13–16, especially Props. 2.1, 2.3, 3.1–3.2, Thm. 3.3 and Conjs. 3.5–3.7. | `5772ace94ba4b247ae745cf32c6b3b079fe25e0de46af057cb4e971a1c3ead28` |
| Kolster 1989, DOI `10.4153/CMB-1989-036-8` | All four pages 248–251; tower, finite exact sequence, Thm. 1, Lemma 2, Conj. 3 and Thm. 5. PDF page 1 = printed p. 248. | `ce649cf4085c501f755517afb0dd7bc9a9798ad1ee9a37116d7b5aae98073f2f` |
| [Greither 1992](https://www.numdam.org/item/AIF_1992__42_3_449_0.pdf) | pp. 452, 454, 469–470; inclusive statement, Lemma 3.3, exceptional χ = ω. PDF page 1 is the cover; printed page = PDF page + 447. | `8e4db974556923a9532151657039d50b34028254f13fc2f1541f449bb50623da` |
| [Kurihara 2025](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf) | §4, pp. 22–28, especially interpolation p. 23, Thm. 4.1 p. 24, Lemma 4.2 p. 25 and the remarks p. 27. | `22ebb98ed24bcebe814ea2f6ba6b4681d7dbafd309b55f06b02f5807fec8ff33` |
| [Rognes–Weibel 2000](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf) | pp. 1–4 and Appendix A pp. 45–49, including A.1, A.2, A.3 and A.4(b). | `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446` |
| [Burns–Flach 2001](https://ems.press/content/serial-article-files/25892) | Lemmas 5–6 pp. 526–529; Lemma 9 pp. 534–535; Conjs. 4–6 and Remark 9 pp. 535–537. Printed page = PDF page + 500. | `d9caa72585d3ae77f34fd1798289345ca2d7a0f4284933c1c0945cb0f0994e5b` |
| [Cohen II](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf) | Thm. 10.3.1, Cor. 10.3.3 pp. 186–189; Thm. 10.5.3 p. 218; Prop. 10.5.5 p. 219. Printed page = PDF page − 23. | `e25889069c18eee932088e1b9264c614ce883bb394a03cb3a109f5859ab57ca0` |

There were no explicit unverified-locator flags in the package itself. All
four inherited packet gaps were nevertheless followed, including their
supplier documents. The required random sample was selected from the original
README's `References:` paragraphs with Python `random.Random(10960).sample`;
the following are the fifteen selected subsections, sorted for readability.
A reference used only as motivation is distinguished from an actual proof.

| Sample | Passage opened and conclusion |
|---|---|
| §1.1 | K-book VI.8.6 p. 515 and Kolster 2009 p. 15: Birch–Tate normalisation and twisted roots of unity agree. |
| §2.2 | K-book p. 516 uses positivity. The sharper bound 1 follows separately from the unit-ideal coefficient; the current library supplies positivity. |
| §2.6 | Kolster p. 15 motivates a primewise formulation but does not prove uniqueness of positive rationals. The proof is the stated elementary Mathlib factorisation argument; positivity and nonzero denominators are essential. |
| §2.8 | Kolster p. 16, annihilator integrality before Conj. 4.1. The scalar consequence has the stated totally real/even-weight hypotheses. |
| §4.2 | Kolster p. 8: S-modified zeta convention; substituted 1 − n directly. |
| §4.4 | Kolster p. 8 and K-book p. 515: Euler deletion and Birch–Tate, with one sign per deleted prime. |
| §4.5 | Kolster pp. 8, 13–15: arbitrary finite S; the enlargement formula follows by multiplying the disjoint extra factors. |
| §5.1 | Kolster Prop. 2.3 p. 12 and Prop. 2.1 p. 10. Added the degree-inverse normalisation of transfer and separated the averaging argument from finiteness. |
| §5.2 | Kolster pp. 13–15 and K-book VI.8.7 p. 515: inverse eigenspace, unramified coefficient degree, all-real-place parity, and the trivial-character H⁰ denominator. |
| §6.1 | Kolster 1989 pp. 248, 250: covariant dual action and G(T)/(T + 1 − u), not a power series obtained by dividing at its pole. |
| §6.5 | Greither pp. 452, 469–470 and Rognes–Weibel pp. 45–49: exceptional character really is proved; variable and inverse-character transport are necessary. |
| §7.4 | Birch–Tate locators state the target. Kurihara Thm. 4.1 supplies the modern main-conjecture input; the consumer derivation still requires items 1–5 as applicable, especially item 4. |
| §8.1 | Kolster pp. 10–11: H¹ ranks on p. 11 are interchanged in print. The package correctly uses Prop. 2.1 and Borel's ranks. |
| §8.2 | Kolster Conjs. 3.6–3.7 pp. 15–16: K-theoretic odd-part and motivic full formulas have distinct regulator normalisations. Neither is an unconditional theorem for every number field. |
| §8.4 | Rognes–Weibel Thms. 0.1, 0.3, 0.6 pp. 1–4: the two weight classes modulo four have different group corrections but the same order-ratio factor. |

Additional checks beyond the sample covered every delicate convention in
Layers 6–8, the Bernoulli evaluation in §3.2, the finite-field and localisation
inputs, and the residue Chern-class sign. The inherited source misprints
(Kolster's ranks and the referenced conjecture number, Greither's exceptional
character exclusion, and the K-book's sign/pole issue) were checked against the
actual formulas rather than silently propagated.

## Adversarial mathematics pass

Every theorem, identity, definition and convention in the package was checked
in its variable scope. Rows below group the named API statements of a single
construction; no row licenses a stronger generalisation. “Retained” means the
stated hypotheses and existing tests survived the pass. All computations are
in the reviewer's own words.

| Statement or convention | Instances and computation | Result and correction |
|---|---|---|
| Number-field/signature conventions | ℚ has (r₁,r₂) = (1,0); ℚ(i) has (0,1); both satisfy degree = r₁ + 2r₂. | Retained; total reality is not confused with having one real embedding. |
| Finite primes, S and norms | Empty S; residue 𝔽₂; hypothetical norm 1. Actual height-one primes have norm at least 2. | Norm 1 is outside the domain; S never deletes archimedean factors. |
| Continued versus raw zeta; Γ totalisation | Mathlib's raw Dirichlet series is outside convergence at −1; Γℝ(−2) = 0 in the totalised API. | Retained continued-function boundary; no cancellation by a totalised zero gamma value. |
| W_n, w_n and cardinality | W₀ is infinite and excluded; w₁(ℚ) = 2 but w₂(ℚ) = 24; `Nat.card` of an infinite group is 0. | All cardinal ratios use supplied finiteness and positive w_n. |
| Coefficients and valuations | O = ℤ_ℓ[χ] is unramified, dχ is its degree and v_ℓ(ℓ) = 1. A ramified DVR changes the length/cardinality conversion. | No assertion over arbitrary DVRs or equal-characteristic power series rings is made. |
| §1.1 `BirchTateFormula`, transport | ℚ gives −2/24; the opposite sign gives +1/12; ℚ(i) gives zero on the analytic side but positive finite K₂/w₂. | Retained all-number-field predicate, with a totally real theorem and a complex-place non-example. |
| §1.2 multiplicative equivalence, nonvanishing, integrality | Multiply −1/12 by 24 to get −2; attempt w = 0. | Cancellation requires w > 0. Integrality follows from the predicate, not from arbitrary zeta values. |
| §2.1 Γℝ values and signs | Γℝ(−1) = −2π, Γℝ(2) = 1/π, Γℝ(−3) = 4π²/3; k = 0 reaches a pole. | Retained k ≥ 1 and the Lean pole control. |
| §2.2 lower bound | Unit ideal contributes 1; ℚ, σ = 2 gives π²/6 ≥ 1; σ = 1 is the pole. | Added current-library deferral; retained only stronger bound for σ > 1. |
| §2.3 vanishing and failure of BT | Even n with r₂ > 0 gives zero; odd n ≥ 3 has order r₁ + r₂ > 0; n = 1 is outside the assertion. | Retained; fixed reference to the general leading-term formula in §8.2. |
| §2.4 functional-equation sign | ℚ weights 2 and 4 give −1/12 and +1/120; degree-two totally real weight 2 is positive. | Retained sign (−1)^(k r₁), k ≥ 1; nonvanishing comes from the regular factors and positive ζ_F(2k). |
| §2.5 rationality | ℚ and ℚ(√5) have rational nonzero negative odd values. A complex-place raw value is zero and has a different leading-term problem. | Retained independent Siegel/Klingen input; no use of BT to prove its own rationality prerequisite. |
| §2.6 rational reconstruction | 1 and −1 have all the same valuations; 0 has junk valuation values; positive numerator/denominator factorisations detect every prime. | Retained positivity and nonzero hypotheses, with Lean negative controls. |
| §2.7 absolute and primewise BT | 2/24 = 1/12 and 4/120 = 1/30; k,w positive; q = 0 invalidates valuation reconstruction. | Retained hypotheses and sign split. |
| §2.8 integrality | w₂ζ(−1) = −2, w₄ζ(−3) = 2; smoothing at a norm-one element gives zero and does not by itself bound a denominator. | Retained all-prime Chebotarev/annihilator argument, including dyadic prime and trivial smoothing control. |
| §2.9 denominator consequence | den(−1/12) = 12 divides 24; den(1/30) = 30 divides 120. | Conditional on BT with positive w₂, not a replacement for BT. |
| §3.1 rational example | Bernoulli value −1/12, w₂ = 24, two real-sign symbol values. | Numerical identity correct; independent upper-bound proof retains remaining defect 1. |
| §3.2 `chiFive` and its API | Values at 0,1,2,3,4 are 0,1,−1,−1,1; χ(−1) = 1; χ(2) ≠ 1. | Retained real-bodied quadratic character, added two compiled example pairs. |
| §3.2 Bernoulli evaluation and quadratic certificate | Σχ(a)B₂(a/5) = 4/25, L(−1,χ₅) = −2/5; ζ_F(−1) = 1/30; 8·3·5 = 120. | Values correct. Sign-symbol lower bound gives four; upper bound retains defect 2. ℚ(√2) is a later corollary, not an independent certificate. |
| §4.1 `sEulerFactor`: empty, insert, union, entire | Empty product 1; overlapping S,T must not count a prime twice; norm 2 gives an entire nonzero-base complex power. | Retained insert nonmembership and disjoint-union hypotheses. |
| §4.1 natural-power evaluation | n = 1 gives 0 at a singleton; n = 0, norm 2 gives 1/2, whereas the truncated natural exponent expression gives 0. | Made prose require n ≥ 1, matching Lean; added the n = 0 control. |
| §4.1 `sModifiedZeta` and comparison | Empty S recovers continued zeta; on Re s > 1 the supplier series matches; n = 1 permits an extra zero. | Retained full-plane continuation as a supplied analytic construction, not equality with a divergent raw L-series. |
| §4.2 values, leading term, nonvanishing | Norms 2 and 3 at −1 give −1 and −2; n ≥ 2 makes every factor nonzero. | Retained leading-term multiplication only when the Euler factor is nonzero. |
| §4.3 S-integer K₂ order | Empty product 1; 𝔽₂ contributes #𝔽₂× = 1; 𝔽₃ contributes 2. | Exact relative sequence, not an infinite field K₂ cardinality, supplies the formula. |
| §4.4 S-integral BT and equivalence | ℚ: S = {2}, {3}, {2,3} gives +1/12, +1/6, −1/6 and K₂ orders 2,4,4. | Retained sign degree + card S and nonzero cancellation. |
| §4.5 enlargement and naturality | Add 3 to {2}: multiply both formulas by 2 and flip analytic sign; S = T is the identity. | Retained domain S ⊆ T and arithmetic ring maps. |
| §4.6 Kummer/tame residue sign | F₇, m = 3: inverse class is exponent −1 = 2 mod 3, not +1. At r = 0 the coefficient groups are trivial and cannot detect the sign; v ∤ ℓ gives the étale Kummer comparison. | Added compiled ZMod 3 sign control; retained the Chern normalisation and negative Kummer boundary. |
| §4.6 higher localisation | Odd degrees at least 3 have the stated global invariance; residue even K-groups vanish, residue odd groups contribute finite factors in the even sequence. | Retained the actual odd-degree bound and quotient/regulator distinction. |
| §5.1 restriction/corestriction codescent | Trivial group; C₂ acting trivially on ℤ₃: restriction 1, corestriction 2, inverse uses 1/2. C₃ over ℤ₃ has nonzero Tate H⁰. | Corrected inverse to degree-inverse corestriction, and coinvariant map to the averaged norm. Integer twists use averaging, not an unjustified finiteness claim. |
| §5.2 character parity | Trivial χ, n = 2; for F = ℚ(√5) and ε of opposite real signs, the quadratic extension F(√ε)/F gives a mixed-sign χ. | Added χ(c_v) = (−1)^n at every real place. The mixed-sign even-weight value is zero and excluded. |
| §5.2 twist, inverse eigenspace and H⁰ | ψ = χω^n, χ⁻¹ eigenspace; ℚ, ℓ = 3, n = 2 has the exceptional ψ = 1; ℓ = 5, n = 4 is another denominator case. | Retained the H⁰ term and dχ. No ψ ≠ 1 argument silently covers the pole branch. |
| §5.3 odd-primary BT | ℚ at ℓ = 3: v₃(2) + v₃(12) = v₃(24) = 1; ℚ(√5) at 5 similarly detects the denominator. | Retained comparison to finite K₂ and w₂, conditional on the named suppliers. |
| §6.1 tower and series | F = ℚ: e = 2, u = 5; ℚ(√2): e = 3, u = 9; u is not arbitrary in 1 + 2ℤ₂. | Retained e ≥ 2, covariant convention and pole at T = u − 1. |
| §6.1 `FedererMainConjecture`, generator change | Zero minus module has f = 1; u changes to u^c under γ ↦ γ^c; denominator changes by a unit, not literal equality. | Retained characteristic-ideal/unit invariance and the coordinate substitution with c⁻¹. |
| §6.2 finite exact sequence and unit Euler characteristic | ℚ has factor 2; the unit direct limit need not be finite. H¹ = B ⊕ (ℚ₂/ℤ₂)^r and H² = (ℚ₂/ℤ₂)^(r−1) have finite Γ-cohomology after the stated calculation. | Removed the spurious requirement that the discrete unit module itself be finite. Multiplicativity is used with finite invariants/H¹. |
| §6.3 dual action and characteristic evaluation | C₅, generator acting by 2: covariant dual acts by 2, contragredient by 3. | Added README and compiled inverse-action witness; retained substitution u⁻¹(1 + T) − 1 and evaluation u⁻¹ − 1. |
| §6.3 compactness and finite submodules | Λ/(2,T) has unit characteristic ideal but order 2; a noncompact module is outside the evaluation theorem. | Retained finitely generated compact torsion and no-finite-submodule hypotheses. |
| §6.4 Federer implies 2-BT | u = 5 gives v₂(u⁻¹ − u) = v₂(−24/5) = 3 = e + 1; primes over 2 have odd deleted factors at weight 2. | Retained w₂ valuation and 2^[F:ℚ] factor. |
| §6.5 auxiliary field and characters | Field unramified at 2 before adjoining the dyadic roots; even ψ corresponds to the prescribed odd χ; quotient Γ can have index 2^b. | Retained graph/index and induction-degree factors, not a direct-product assumption without proof. |
| §6.5 inverse second-kind character | ρ(γ) = i, u^s = 5: ρ(γ)⁻¹u^s − 1 = −1 − 5i, not −1 + 5i. | Added ω⁻¹ measure weight and inverse-character evaluation, mirrored in a compiled example. |
| §6.5 minus-module maps and μ | Norm kernel → anti-invariants → quotient; kernels/cokernels killed by 2 need not be finite without finite generation over ℤ₂. | Added the precise compact-dual μ = 0 finiteness argument; pseudo-isomorphism is not an isomorphism. Defect 5 remains in its independent supplier proof. |
| §6.5 Greither exceptional branch and meromorphy | χ = ω has finite class component; P/2 has μ = 0, while a meromorphic quotient with a pole has no such μ invariant. | Retained the exceptional branch and numerator μ assertion, including pole/root cancellation and real-degree counting. |
| §6.6 abelian BT | ℚ and ℚ(√5) are totally real abelian; ℚ(i) is abelian but fails the formula. | Retained both hypotheses and all prime comparisons. |
| §7.1 compact complex and characteristic ideal | H² = X, H³ = ℤ₂ gives the factor γ − 1 in char X; a finite module cannot be detected by height-one ideals. | Retained inverse determinant convention; explicitly exposed bounded-model defect 4. |
| §7.1 rational benchmark | u = 5: (u² − 1)ζ(−1)(1 − 2) = 24/12 = 2; Λ/(2) specialises to order 2. | Replaced an unnecessary unsourced free-pro-2 presentation with the direct numerical/module calculation, without treating it as an independent construction of X. |
| §7.2 modern dyadic descent | ℚ: n = 2 gives H² order 2 and H¹ order 8; n = 4 gives 2 and 16. | Retained contragredient evaluation u^n − 1, Euler factors odd and H¹(ℚ₂/ℤ₂(n)) = H²(ℤ₂(n)) in the stated range. Independent of defect 3, subject to defect 4. |
| §7.3 degree-two K₂ comparison | n = 2 has no extra real correction in K₂ itself; inverting 2 contributes finite-field unit order odd. | Retained exact valuation identity, not a claim of equality in all K-degrees. |
| §7.4 full BT | All prime valuations plus the totally real sign reconstruct the positive rational absolute value; ℚ(i) excluded. | Retained conclusion, explicitly subject to the bounded-model supplier qualification. |
| §7.5 series involution | u = 5 and γ = 25 gives 5/25 − 1 = −4/5 = −25⁻¹(25 − 5), whereas 25 − 5 = 20. | Added computed unit/sign witness. Series identity is stronger than an unexplained equality of special-value valuations. |
| §7.5 module/finite comparison | Zero minus module, one real place; Λ/(2,T) again shows finite corrections invisible to characteristic ideals; general totally real F need not have μ = 0. | Replaced the unsupported comparison sketch with the exact requested diagram and marked remaining defect 3; degree shifts and duality must be explicit. |
| §7.5 general Federer endpoint | Abelian F is already §6.5; arbitrary totally real F requires the missing comparison. | No claim that the endpoint follows from the height-one identity alone. |
| §8.1 `hInvariant` and primary product | ℚ: h₂ = 2; ℚ(√5): h₂ = 4; empty product 1; primary orders 2 and 9 give 18, not 11. | Added explicit product checks; supplied almost-all-prime vanishing makes the product finite. |
| §8.1 integral motivic groups and ranks | Even n, totally real gives H¹ rank 0; odd n gives rank r₁ + r₂. | Retained actual motivic groups, not arbitrary groups manufactured from their completions. |
| §8.2 motivic regulator covolume | Rank zero gives 1; map with matrix (2) gives covolume 2; basis change to −2 keeps 2; index-two lattice gives 4. | Added positive covolume, absolute determinant, basis and index API with four discriminating tests. |
| §8.2 Lichtenbaum predicates | n = 2 reduces to the respective BT form; ℚ(i) requires a leading coefficient rather than its zero raw value. | Retained distinction between odd-part K-theoretic and full motivic statements. General assertions remain conjectures. |
| §8.3 even-weight cohomological formula | ℚ: 2/24 = 1/12, 2/240 = 1/120; h₄ is 2 although K₆ has order 1. | Retained the dyadic cohomological statement from §7.2 and odd-primary result. |
| §8.4 real correction, n = 2 mod 4 | ℚ: H²₂/H¹₂ = 2/8 = 2·2/16, with K₃'s extra factor 2. | Retained K_even ≅ H² and corrected odd torsion order. |
| §8.4 real correction, n = 0 mod 4 | ℚ: 2/16 = 2·1/16; K₆ is the kernel of real restriction, not all H². | Retained real restriction kernel/cokernel and common ratio 2^r₁. |
| §8.5 higher signed formula | ℚ weights 2,4 give −2·2/48 and +2·1/240; k = 0 is excluded; groups have rank 0 in this parity. | Retained all totally real fields via Kurihara, subject to defect 4. Classical abelian route remains separately identified. |
| §8.6 `TateMotiveETNCData` | n = 2 allowed, n = 1 excluded; ℤe and 2ℤe are full projective lattices, ℤ/2 is not; ℚ(i) has component orders (0,1). | Added three data tests and explicit Coherence/analytic/projective input; raw zero components cannot enter the extended boundary. |
| §8.6 `TateMotiveETNCRationality` | e has zero class; 2e is rational but nonzero locally at 2; πe is not in the rational image. | Added separate predicate and three tests. The local criterion now explicitly assumes rationality. |
| §8.6 `TateMotiveETNC` and API | δ(2) + δ(1/2) = 0, but reversing the second class gives δ(4) ≠ 0; trivial G gives scalar image 2/24 = 2·2/48. | Added compiled plus-sign witness; retained reduced norm, center-valued leading terms, graded trivialisation and finite-quotient lattice corrections. Scalar image is not asserted equivalent to the full class. |

The tests involving fields, residues, DVRs and characteristic p are applied
only where the corresponding carriers occur: a finite field is a residue
field here, not a number field; an arbitrary DVR is not the unramified
character coefficient ring. No conclusion is proved by assuming that
conclusion as an input. Explicit gaps concern proof decompositions and exact
supplier interfaces, not admitted definitions.

## Definitions, APIs and Lean correspondence

The README retains at least three discriminating Checks for each definition:
`BirchTateFormula`, `chiFive`, `sEulerFactor`, `sModifiedZeta`, the 2-adic zeta
series, `FedererMainConjecture`, `hInvariant`, `motivicRegulatorCovolume`, both
Lichtenbaum predicates, `TateMotiveETNCData`, `TateMotiveETNCRationality` and
`TateMotiveETNC`. New Checks strengthen transfer normalisation, inverse actions,
regulator indices and the determinant sign rather than replacing existing
numerical tests. The only Lean definitions are the light, real-bodied
`chiFive` and `sEulerFactor`. Every heavier definition is named in the closing
comment; none is represented by an admitted data carrier.

The following signature comparisons were made against the actual surrounding
`variable` blocks, not merely declaration names. This exceeds the required ten.

| Lean signature checked | README agreement |
|---|---|
| `gammaℝ_neg_one` | §2.1, Complex gamma factor and −2π. |
| `gammaℝ_two` | §2.1, 1/π. |
| `gammaℝ_one_sub_two_mul` | §2.1, natural k ≥ 1, positive real magnitude and sign (−1)^k. |
| `gammaℝ_two_mul_pos` | §2.1, natural k ≥ 1, positive real value. |
| `one_le_dedekindZeta_ofReal` | §2.2, arbitrary number field F and real σ > 1; existential real value at least 1. It concerns the convergent function. |
| `rat_eq_iff_forall_padicValRat_eq` | §2.6, both rationals strictly positive; prime valuations, not every composite index. |
| `abs_eq_natCast_div_iff_forall_padicVal` | §2.6–2.7, q ≠ 0 and positive natural k,w; valuation equation in ℤ. |
| `chiFive_eq_legendreSym` | §3.2, integer a, complex-valued character modulo 5 and cast Legendre symbol. |
| `chiFive_apply_two`, `chiFive_apply_three`, `chiFive_apply_four` | §3.2 values −1,−1,1. |
| `chiFive_even`, `chiFive_ne_one` | §3.2 parity and nontriviality; these do not substitute for primitivity where the supplier needs it. |
| `LFunction_chiFive_neg_one` | §3.2 uses Mathlib's continued Dirichlet L-function, value −2/5. |
| `sEulerFactor_empty` | §4.1, any complex s, empty finite set, value 1. |
| `sEulerFactor_insert` | §4.1, v not in S, decidable equality only where needed. |
| `sEulerFactor_union` | §4.1, disjoint S,T. |
| `differentiable_sEulerFactor` | §4.1, entire complex function, nonzero natural prime norms. |
| `sEulerFactor_one_sub_natCast` | §4.1, n ≥ 1, matching natural exponent n − 1. |
| `sEulerFactor_neg_one` | §4.1, sign (−1)^card S and product of norm minus one. |
| `sEulerFactor_one_sub_ne_zero` | §4.1, n ≥ 2; singleton n = 1 is the compiled negative control. |

All 24 original Lean examples are retained, with 10 additional examples.
The additional compiled scalar examples fix the residue sign, normalised
transfer, covariant versus inverse dual action, inverse second-kind character,
series involution, absolute regulator determinant and ETNC plus sign. They
check those numerical conventions; they do not purport to construct the absent
cohomology or determinant theories.

## Validation and handoff

- `lean-check research/blueprint/packages/SpecialValuesBirchTate/Suggested.lean`
  exited 0 at the pins. The 431-line file emits only 20 declaration-uses-`sorry`
  warnings. No errors, admitted data definitions or unfinished background
  compilation remain.
- `python3 scripts/check_blueprint.py research/blueprint/packets/SpecialValuesBirchTate.json`
  exited 0, with 0 errors and 0 warnings. The packet was checked without editing it.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables
  reports 0 problems; `git diff --check` is clean.
- `metadata.toml` remains `topic = "math.NT"`. The package and report are in
  the reviewer's own words, with locators; no source PDFs, source passages or
  private filesystem paths are included.

Resume with the five owner proofs above. Once supplied, recheck the independent
integer/quadratic bounds, the bounded dyadic compact model, the independent
μ = 0 route, and the finite comparison diagram before changing the verdict to
accepted. No extra issue was claimed and no upstream PR or ownership transfer
is implied by this review.
