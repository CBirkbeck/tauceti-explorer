# Independent package review: IntegralIwasawaTheory, round 2

**Verdict: accepted after the corrections below.** The package keeps the general arithmetic towers, all-prime Ferrero–Washington theorem, finite CM Fitting identities and integral determinant main conjecture. Its Coleman prerequisites are now constructed before use, without a supplier edge to the later ColemanPowerSeries roadmap. Acceptance concerns the roadmap and its interfaces; the admitted theorem statements are not formalised results.

Reviewer: Codex, session `codex-Kz5ezx`, 20 October 2026. Issue #11371, job `REV-PKG-IntegralIwasawaTheory~codex2`. The originating package is commit `b69192d7a`, by session `codex-JtmwXx`; the available independent review is `REV-PKG-IntegralIwasawaTheory~adv.md`, by session `codex-NFDhQ0`, followed by fix commit `9b0d090dd`. I did not author those submissions. The fix worker's own acceptance was not treated as an independent verdict.

## Inputs and scope

The issue template names a Mordell-conjecture title, a monolithic packet and a `~codex` review report that do not exist for this package. The actual inputs are the arithmetic Iwasawa package, its three accepted parts `IntegralIwasawaTheory--I.1.json` (68 records), `--I.8.json` (53), and `--L1.json` (27), the available `~adv` report, the package handoff and the subsequent dependency fix. I read these rather than inventing a missing rejection report. No packet was edited. The separately designed Part II is outside this package.

The 148-record crosswalk in `handoff/PKG-IntegralIwasawaTheory~codex.md` was checked against the README. Its destinations remain valid with these updates: old §§7.1–7.4 are now §§7.4–7.7, the closure comparison also uses new §§7.1–7.3, and the rational equivalence formerly in §6.5 is now §7.8. No target, hypothesis, locator, existing Check or worked example was dropped. The added targets close the formerly upward Coleman prerequisite.

I read WORKERS, PACKAGE_REVIEW, the relevant protocol and expansion rules, UPSTREAM_GUIDE, and the current ProfiniteArithmetic and ClassFieldTheory examples. The README has a summary, ownership boundaries, conventions, exact supplier contracts, ordered layers, API prose, Checks, examples and references. Metadata remains exactly `topic = "math.NT"`. Its roughly 219 KB reflects the full targets and new prerequisite construction: PACKAGE_REVIEW's 12 October “Shape of a roadmap” explicitly overrides older size notes and requires retaining that detail, including the issue template's older 200 KB ceiling. There is no process narrative in the roadmap itself.

## Findings corrected in this review

1. **Upward Coleman dependency.** The input still consumed ColemanPowerSeries §4, although that roadmap comes later and consumes this one's circular arithmetic. Removed every supplier citation to it. New §§7.1–7.3 own the native power-series norm and trace, local unit inverse limit, interpolation, arithmetic Coleman sequence, real principal circular closure, its generator and its actual image. Only the downstream-consumer entry names ColemanPowerSeries. The ownership move is recorded in the handoff; its files were not edited.

2. **The moved construction retains its generality.** Norm and interpolation are stated for every prime and every finite unramified extension E of ℚ_p. Coefficient Frobenius is retained: norm-fixed means `Nf=Σf`, with `f(π_a)=σ_a^(a−1)u_a`. The roots have order p^a with a≥1. This avoids both an ℚ_p-only replacement and the invalid order-one initial evaluation. Norm/trace use a finite-free scalar structure, with rank-p basis, integral ψ and actual local integer-ring/basis suppliers. The arithmetic exact sequence is additionally transported to finite free commutative ℤ_p-algebras. Its odd-prime plus equivalence is a separate theorem; no exact plus idempotent is asserted at 2.

3. **Endpoint, sign and real generator.** The Coleman endpoint is the first moment, not augmentation. A Dirac-measure difference distinguishes them. The arithmetic map is explicitly the negative of the raw derivative composite of RJW Definition 10.14: direct calculation in Proposition 10.4 and Lemma 10.5 gives the negative of the canonical zeta numerator. With this convention the circular generator maps to `([b]−1)ζ_p`. The real principal generator includes both its root-of-unity phase and Teichmüller correction; its (p−1)st power is global, while the generator itself may be only local. This prevents equating a discrete global group with its closure.

4. **Order and checks.** The rational main-conjecture equivalence now follows the Coleman and Mellin comparisons in §7.8. It explicitly identifies the nontrivial tame branch and the global-unit quotient E∞/C∞; the trivial ramified numerator retains augmentation instead of adopting the source’s separate f_0=1 convention. Layer 7's dependencies include Layer 5 for the μ=0 comparison. New Checks cover trace and norm constants, ψ on 1 and 1+T, the signed dyadic root tower, unramified Frobenius, the first local layer, the Tate kernel, circular phases, local closure, and finite-free scalar transport. Existing closure and Mellin subsections gain explicit discriminating Checks. The newly heavy definitions are inventoried in Suggested.lean's closing comment rather than encoded through admitted carriers. The bounded-growth and regular-cancellation numerical milestones are now also named explicitly in the README, matching their existing Lean statements.

5. **Characteristic-ideal convention and source precision.** The generic supplier contract now explicitly distinguishes the full ideal `(p^μ∏F_j^n_j)` from NSW's characteristic polynomial `∏F_j^n_j`. The latter alone does not see a vertical p-power factor. The Burns–Flach locator is extended through p. 80 for the finite-coefficient determinant statement; part (a)'s bounded-model proof remains pp. 78–79. The NSW bibliography names §5.3 and uses the working author-hosted PDF link.

## Previous independent findings: verification

All eleven corrections in the available prior report are present in the input and retained here.

| Prior finding | Evidence in the corrected package |
| --- | --- |
| Full versus principal cyclotomic character | Conventions and §0.1 distinguish κ from κ_Γ; ℚ(√−2) at 2 has full value 3 mod 8 and principal value 5 mod 8. Tate-factorisation hypotheses persist in §§6.4, 10.5 and 12.4. |
| Weakened main-conjecture surrogate | It is absent from Lean. §11.7 retains the actual arithmetic complex and determinant theorem. The finite-image ideal theorem is labelled an algebraic milestone. |
| Primitive ratio and association duplication | Exact Mathlib declarations are supplier boundaries; the field ratio in §1.2 is a light specialization. |
| Real-field and general CM duplication | Existing maximal-real identifications and general Hasse-index/regulator APIs are imported; the compatible tower and prime-power index-one results are stronger retained targets. |
| Ordinary ray-unit duplication | Existing RayClass.Exact maps supply the ordinary sequence; §8.2 adds S-depletion and its S-unit localization. |
| Minus-class and S-capitulation scope | Odd-prime CM hypotheses and S containing p and infinity are retained in §2.8. Dyadic norm-minus errors remain explicit. |
| Weighted Ribet mismatch | §9.6 constructs the distinct-character weighted local extension and verifies its containing-lattice/topology hypotheses; it does not silently use a global output as a local theorem. |
| Transpose direction | §8.5 uses the stated map `R^r→R^(r+s)` and excess-generator Fitting index. The `(2,T)` row is the counterexample to reversing it. |
| Commutative determinant output | §10.1 has general-G perfectness, commutative fractional-ideal output only for abelian G, and relative K-theory for general G. |
| Earlier locator errors | Cyclotomic norm, Ritter–Weiss infinity hypotheses, going-up statement/proof distinction, Ribet title and Brumer–Stark root-killing locators are retained. The additional Burns–Flach page correction is above. |
| Tests and ordering | The prior polynomial, dyadic, transpose, Ribet, finite-image and determinant controls remain. Coleman construction and equivalences are now also in prerequisite order. |

## Direct source checks

The three historical source-access flags were checked in the freely readable originals. G1: Burns–Flach (1996), (1.9), p. 73, Proposition 1.20(a)–(b), pp. 78–80, and the duality on p. 86: ordinary real cochain tails cancel in the bounded construction; a complete real Tate complex is not substituted. G2: Sinnott (1980), Proposition 2.3, pp. 194–195, and §4, pp. 201–208, including the augmentation correction, logarithmic lattice and Theorem 4.1: the norm-generated circular group and real intersection retain their distinct factors. G3: Sinnott (1984), pp. 274–282, Washington (1978), Proposition 2 and proof, pp. 88–92, Ferrero (1978), pp. 10–12, Washington (1975), Lemma 4, p. 184, and Oesterlé, Propositions 1–6, pp. 173–180: the rational-measure proof is independent of the main conjecture, while the dependent-root arrangement and dyadic relative-to-full argument have their own inputs. Image pages were read where text extraction omitted formulas. No uncleared Washington book was used.

The additional random sample was selected with seed 11371 from citation-bearing paragraphs before editing; these are the fifteen checked locators. Section numbers refer to the final README.

| # | Claim | Source checked and result |
| --- | --- | --- |
| 1 | §5.1 Γ-transform/content | Sinnott 1984, §1, (1.1), (1.4)–(1.6), pp. 274–275; correct. |
| 2 | §5.2 content independence | Sinnott 1984, Lemma 1.1, p. 274, Theorem 1, pp. 276–277; correct. |
| 3 | §2.6 cyclotomic weak Leopoldt | NSW 10.3.25, pp. 640–641; Sharifi 3.3.3–3.3.4, pp. 84–85; includes p=2 after adjoining μ_2p. |
| 4 | §3.4 class p-rank criterion | RJW Corollary A.13, pp. 206–207; Sharifi 2.4.10, p. 58; finite generation, not bounded group order. |
| 5 | §3.3 growth/cutoff | Sharifi 3.2.13, pp. 81–82; RJW A.9–A.12, pp. 203–206; eventual cutoff and finite error retained. |
| 6 | §12.6 exterior bidual | Dasgupta–Kakde (8)–(10), pp. 8–9, §3.4, pp. 25–27; integral evaluation condition retained. |
| 7 | §3.2 inertia quotient | Sharifi 3.2.11, (3.2.1), Remark 3.2.12, pp. 80–81; kernel may have positive rank. |
| 8 | §5.7 Bernoulli/digit comparison | Oesterlé Propositions 1–2, §§3–4, pp. 173–175; independent comparison, not a circular proof of μ=0. |
| 9 | §10.6 dyadic sequences | Kurihara Lemma 4.2(1), pp. 25–26; Sharifi 3.3.9, pp. 86–88; norm-minus convention retained. |
| 10 | §4.3 abelian resolvents | Sharifi proof of 1.5.21, pp. 35–36; nontrivial character and algebraic coefficient relation are essential. |
| 11 | §7.5 principal closures | RJW proof of 13.11, pp. 193–194; closure comparison agrees with the principal residue correction. |
| 12 | §2.4 local finiteness | NSW §11.2, pp. 731–735; Sharifi setup of 3.3.6, pp. 85–86; no assumed global Leopoldt injection. |
| 13 | §1.2 circular numbers | RJW Definition 11.6, p. 176, Lemma 12.18, p. 186; intersection with units is necessary. |
| 14 | §12.1 character quotient | Kurihara remarks following 4.1, p. 27; augmentation factor and derived coefficient change retained. |
| 15 | §2.2 unit limits | Sharifi 3.3.5, p. 85; AWS §2.5, p. 24; NSW §11.2, pp. 731–735; torsion and valuation directions are explicit. |

Beyond this sample I checked NSW 5.3.1–5.3.11, pp. 289–293, against the Iwasawa-algebra contract: complete DVR preparation, generator coordinate, pseudo-isomorphism with finite errors, μ/λ and the characteristic-polynomial convention all agree. The arithmetic coefficient hypotheses are not extended to equal-characteristic DVRs. Sharifi §§2.3–2.4, pp. 50–58, gives an additional accessible comparison. The moved Coleman targets were checked against Sharifi 5.4.3–5.4.14, pp. 143–147, and RJW §§10.2–10.4 and 12, pp. 164–170, 176–189. The sign choice is stated as this package's normalization, justified by calculation, rather than blindly repeating incompatible displayed conventions.

Source versions: Sharifi's undated author PDF read in this run has SHA-256 `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26`; NSW is the author-hosted corrected second-edition PDF. Locators in the README use printed page numbers. All descriptions here and in the roadmap are in my own words; no source passages or page-by-page source summary were committed.

## Library and prerequisite audit

The prescribed pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474`. I read the library-coverage entry and checked the cited actual declarations; the stale audit's absent Fitting/coordinate entries do not override the current library. The additional read-only current checkouts were Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine newer roadmaps and four named Completed roadmaps. Searches included carriers, hypotheses and operators as well as theorem names. No build was run there.

Existing primitive-root unit/association, general CM unit-index/regulator, maximal-real-field, class norm, ray exactness, completed coordinates/filtration and arbitrary indexed Fitting base-change APIs remain supplier boundaries. The README now explicitly says the current coordinate/Fitting/maximal-real modules postdate the baseline and are not imports of the pinned representative file. Fitting base change requires the finite module structures, not flat scalar change. Arithmetic field-layer compatibility is retained, rather than a second generic algebra construction. No additional existing target needed removal in this round.

Supplier order was checked against the ordering document and the actual supplier layers. No FoundationsAndLibraryIntegration or UPSTREAM ids remain. The rational unit/class sequence in SelmerIwasawaCohomology §§4.16–4.17 uses reciprocity, not the abelian Leopoldt theorem proved here; it is a valid independent input. Its field-level Leopoldt comparison is not used to assume that theorem. Dirichlet/automorphic analytic inputs do not use arithmetic μ-vanishing. SpecialValuesBirchTate and EulerSystemsCyclotomicMainConjecture remain downstream. The Coleman ownership repair is the only new cross-roadmap move.

## Adversarial pass

I walked every subsection, definition/API and theorem statement, including the unchanged targets. The table groups closely related statements; each listed interval was checked, not just its headline theorem.

| Statements/conventions | Instances and conclusions |
| --- | --- |
| Standing coefficients, actions, twists and determinants | Ramified O uses `f v_π`, full versus principal κ differs at 2, and differential 2 in degrees 0,1 versus 1,2 reverses the determinant ideal. |
| §§0.1–0.3 towers/layers/ramification | Base layer, p=2 real tower, ℚ(√−2), m=n, and one quadratic norm: degrees and norm directions agree; arbitrary towers do not acquire cyclotomic splitting claims. |
| §§0.4–0.5 actions/characters | Nonabelian kernel is excluded from lift independence; ω_1=2T+T², not T²; p-torsion character projectors are nonintegral. |
| §§1.1–1.4 cyclotomic/circular groups | Orders 1,2 separated; 1−ζ is nonunit; ratio with p∤b is a unit; even b requires the real phase; norm compatibility is downward. |
| §§1.5–1.8 index formulas/lattices | General CM index may be 2, prime-power is 1; dyadic small conductor; real quadratic norm-generated versus intersection group has factor 2; no arbitrary-conductor shortcut. |
| §§2.1–2.4 limits/extensions/finiteness | Norm versus extension limits; local valuation omitted only for integral units; real signs at 2; local finite generation precedes global injection. |
| §§2.5–2.8 weak Leopoldt/minus/cohomology | Real dyadic H² may not satisfy a cd₂ shortcut; cyclotomic weak Leopoldt all p; S excludes no p-place; ℤ/4 has order-two 2-torsion, not order four. |
| §§3.1–3.2 inertia control | One ramified prime versus two; `(t,−t)` kernel; m=n gives ν=1; ordinary classes are not arbitrary full coinvariants. |
| §§3.3–3.5 growth/rank/dictionaries | μp^n, λn, negative ν and exceptional initial levels; cyclic order p^n has bounded rank; ray Γ quotient and Chevalley denominator retained. |
| §§4.1–4.4 logarithms/Leopoldt | p and roots of unity have zero logarithm; independence is algebraic-coefficient, not ℚ_p-linear; trivial resolvent vanishes; CM index 2 does not impair rational reduction. |
| §§5.1–5.3 measures/content/pole | δ_0 gives zero, δ_1 gives 1, dyadic symmetrization gives 2 without averaging; fixed clearing factor cannot be multiplied by p; constant/pole branch kept. |
| §§5.4–5.7 arithmetic μ/digits | Odd mirror hypothesis; dyadic p-rank bound replaces integral minus idempotent; arbitrary finite abelian norm descent; dependent torsion roots require the positive arrangement theorem. |
| §§6.1–6.3 analytic elements/smoothing | ℚ gives −1/2; split depletion zero; smoothing at 2 can fail root-killing; trivial/type-W poles and arithmetic Frobenius inverse agree. |
| §§6.4–6.5 twists/predicates | r=0 can give infinite coinvariants; zero evaluation excluded; vertical p-power is invisible to distinguished factors; weak is not strong without μ comparison. |
| §7.1 norm/trace/interpolation | Nc=c^p, trace c=pc, N(Y)=−Y at 2; unramified constant needs Σ; a=1 has π=−2 at 2; uniqueness does not assume π_a→0. |
| §§7.2–7.3 Coleman/closures | Roots map to zero, Dirac mass differs from first moment, raw composite has negative numerator; p=3,b=2 pins phase; local corrected generator is not necessarily global. |
| §§7.4–7.8 Vandiver/Mellin/equivalence | p=3 base class zero; irregular does not imply failure of Vandiver; a(a(T))=T and trivial numerator −TZ_1; only arithmetic cyclic identification is conditional. |
| §§8.1–8.3 minus/duals/ray/Selmer | Quotient versus eigenspace at 2; lattice dual of finite module zero versus nonzero Pontryagin dual; ray C_6 and minus C_2; auxiliary S′ must kill classes. |
| §§8.4–8.6 Ritter–Weiss/transpose/cardinality | Zero square matrix not injective; infinity belongs to ordinary depletion; row (2,T) fixes transpose index; dyadic errors survive odd-character cardinality alone. |
| §§9.1–9.2 ordinary Eisenstein/Tate interfaces | Unit ξ gives zero cuspidal quotient but full quotient Λ; full a₁-duality and trace-limit lattice are not inferred from irreducible-family theorems; trivial pole treated separately. |
| §§9.3–9.5 Hilbert/Hecke/Galois | Arbitrary degree/all cusps; x=0 invalidates cancellation without regularity; repeated oldform roots yield nonreduced factors; actual ordinary quotient retained. |
| §§9.6–9.7 Ribet/finite Fitting | Coincident dyadic residual characters, unbounded denominators, local generator with zero cocycle, m=0; finite containing lattice is required; square presentation is not yet injection. |
| §§10.1–10.2 complexes/perfectness | Real C_2 tails are nonzero but cancel; finite coefficients and general G separated from commutative ideals; H³=ℤ_p retained in tower complex. |
| §§10.3–10.5 Tor/Euler/descent | Finite ℤ/p has both invariant and coinvariant terms; T at weight zero has infinite quotient; local Euler factor and full-character descent retained. |
| §10.6 real dyadic filtration | Sign changes real-cohomology parity; degree d gives vertical 2^d; order-two finite cokernel cannot itself produce a height-one vertical factor. |
| §§11.1–11.2 twist/limit/control | τ sends c to −c and moves ω_n; smoothed torsion must be killed; top edge map is a theorem, not an inverse-limit definition. |
| §§11.3–11.4 ideal continuity/relation lifting | n=0 gives T, a=0 gives unit ideal; noncofinal systems fail; zero/free modules and ℤ_2[C_2] checked; no compatibility of finite matrices assumed. |
| §§11.5–11.7 infinite Fitting/determinant | Finite zero determinant versus infinite nonvanishing; (p,T) disproves arbitrary height-one detection; augmentation H³ and invertible lattices over actual order retained. |
| §§12.1–12.2 characters/induction | p-power characters need derived change, trivial character augmentation, e=0,1 generator substitution, analytic pole denominator retained. |
| §§12.3–12.4 special values/Kolster | ℚ weight two has v₂(ζ(−1))=−2 and w₂ valuation 3; covariant action, full characteristic series, invariants and finite Tor errors retained. |
| §§12.5–12.6 Brumer–Stark/exterior lattice | Root-killing T, odd versus dyadic higher Fitting scope, ranks 0 and 1, half a lattice wedge, and swapping two split places distinguish integrality/sign conventions. |

No theorem of Tate's thesis is stated or proved. The four allowed analytic definitions do not become a functional-equation supplier. General number-field/primes scope is retained; statements that require odd p have explicit mathematical hypotheses and their dyadic counterpart where needed, rather than an implicit restriction of the roadmap.

## Lean signature checks and validation

Suggested.lean has one `import Mathlib`, 11 real-bodied light definitions, 10 theorem statements and 21 proved examples, at most two per definition. There is no admitted data, algorithm, `set_option`, theory development or dummy arithmetic headline. Heavy definitions stay in the README and closing inventory. The only code-file change is that inventory.

| Signature read with its hypotheses | Agreement with README |
| --- | --- |
| `cyclotomicRatio_mul` | §1.2: ζ≠1 and ζ^b≠1 make the field ratio identities legitimate. |
| `cyclotomicClassNumberGrowth` | §3.3: positive conductor, any prime, natural μ/λ, integral ν, eventual equality. |
| `bounded_iff_mu_lambda_zero` | §3.4: actual growth predicate and primality; finite initial segment does not affect boundedness. |
| `mu_zero_of_subexponential_prank` | §3.4: eventual lower bound and normalized limit; arithmetic identification remains a separate theorem. |
| `ferreroWashington_cyclotomic` | §5.6: includes p=2 and positive conductor; general abelian descent remains in prose. |
| `dyadic_rank_subexponential` | §5.5: numerical consequence of eventual linear relative exponent and rank bound, without claiming to construct its arithmetic input. |
| `tateCoordinate_comp` | §6.4: scalar coordinate composition over a field with unit u; full Tate interpretation has the factorisation condition. |
| `coleman_trivial_numerator_identity` | §7.6: u≠0 and 1+T≠0; result is −Tz. |
| `cancel_regular_principal_bound` | §9.4: regular x in a commutative ring and actual ideal containment. |
| `ideal_eq_of_joint_finite_images` | §11.3: finite free commutative ℤ_p-algebra and every positive coefficient precision/tower level; ideal separation only. |

Final `lean-check` exited 0: exactly ten `declaration uses sorry` warnings, no errors or other warnings; 299 lines. `check_sorry_data.py` exited 0. The three input-packet checks each exited 0 with zero errors and warnings (68, 53 and 27 records); the three historical source flags in I.8 are resolved by the direct readings above, not by mutating that packet. Intake file validation and `git diff --check` passed. There are no remaining mathematical or source-access findings from this review. Future work is the formalisation described by the accepted roadmap and the downstream ownership update recorded in the handoff.

No suspicious instructions were encountered in untrusted issue/source material. Source downloads and transient logs remain scratch only; no local filesystem paths, restricted files or source passages are part of this submission.
