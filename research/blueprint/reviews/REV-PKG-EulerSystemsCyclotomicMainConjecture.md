# Review: Euler systems and the unconditional cyclotomic main conjecture

Refs #10897. Reviewer: Codex (GPT-6), session `codex-6MfWGv`,
19 October 2026. This reviewer did not write or review the package input.

**Verdict: needs_changes.** The independent package review is complete.
The package preserves the accepted plan's mathematical detail and has the
required upstream shape. One false Lean example has been repaired. Four
previously identified comparisons still lack a verified proof route at the
stated generality. They prevent approval for an upstream draft PR. This is a
completed review, not a checkpoint or a claim that the roadmap is formalised.

## Fix applied

The example identifying `(ζ⁻¹ - 1) / (ζ - 1)` with `-ζ⁻¹` originally
quantified over an arbitrary field element with only `ζ ≠ 1`. At `ζ = 0`
its left side is 1 and its right side is 0. Added `ζ ≠ 0` to that signature
and a `norm_num`-proved rational counterexample recording the failure when
the hypothesis is dropped. README §0.8 now explains both exclusions.
The intended application to a nontrivial root of unity satisfies them.

No target, API item, definition check, source issue or supplier obligation
was discarded. No packet or supplier file was edited.

## Remaining mathematical obligations and handoff

These are gaps in the specified comparison arguments, rather than a request
to implement all the planned theorems in Lean. A target name pointing to an
equally unresolved supplier target does not close a proof route.

1. **Uniform circular-unit descent, README §3.3.** Supply a theorem for the
   actual norm-limit `(E∞/C∞)χ`, with finite coinvariants at sufficiently
   large levels and a bound independent of the level on the difference from
   the finite-layer unit quotient. Include the general-conductor Sinnott
   correction and its bounded valuation. The available class-module control
   and a separate finite-layer index formula do not prove this assertion.
   Rubin, proof of Corollary III.2.8, printed p. 38, refers to Mazur–Wiles
   §1.6 and an appendix; that page does not supply the missing norm-descent
   proof. Resume by obtaining a permitted proof with these exact modules and
   conductor conventions, then complete the comparison without using the
   main conjecture itself. Sections 3.4–3.5 consume this input.
2. **Odd-prime split lattices, §4.21.** Give the actual valuation and
   logarithm lattices, the maps between them, and every finite kernel and
   cokernel factor when `χ(p)=1`, retaining faithfulness on the cyclic
   p-Sylow. Greither, Theorem 4.1 and its proof, printed pp. 482–484,
   explicitly develops the dyadic case and refers elsewhere for odd p.
   The current outline does not identify the odd-p factors or a verified
   theorem that computes them. Resume with the odd-p comparison in the cited
   earlier literature or a complete independent argument. Replacing the
   dyadic factor 4 by p does not establish it. The IntegralIwasawaTheory L2
   request is an obligation, not evidence that this comparison is supplied.
3. **Exceptional nonvanishing, §4.18, used by §§4.19–4.22.** The inspected
   `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing` target still requires
   nonvanishing of the relevant Gauss-ideal character projection and its
   comparison with Baker–Brumer. The derivative identity alone does not
   give a nonzero logarithm vector. Gross, Proposition 1.16, printed p. 983,
   has the algebraic-coefficient injectivity needed for the intended route;
   it does not identify this particular projected arithmetic vector.
   Resume by constructing that vector, proving its nonzero projection, and
   matching its logarithm to the supplier's expression. Do not replace this
   step by Gross Conjecture 1.15. Gross §4, equations (4.3)–(4.6), pp. 993–994,
   remains an unverified locator in this review; see the access limitation
   below.
4. **Pure cyclotomic Coleman comparison, §§4.7–4.8.** Identify the existing
   Coleman L4 image and adjusted generator with Greither's independently
   normalised `G_p(T′,ρ)`. State the intervening maps and track the
   raw/normalised Coleman sign, `X ↦ -T`, arithmetic Frobenius, inversion
   `T′=(1+T)⁻¹-1`, and the twist `χ=ωρ⁻¹`. The Coleman targets give an image
   ideal and generator but do not yet provide this comparison. The witness
   `F=ℚ, p=5, ρ=ω²` is even and nontrivial on Φ while trivial on Δ. Its
   conductor on Δ is 1, so `f₀=X` is not an invertible series. Greither's
   proof of Theorem 2.13, p. 466, applying Lemma 2.11(b) to a nontrivial
   Δ-character, cannot cover that witness. Resume jointly at
   ColemanPowerSeries L4 and DirichletPadicLFunctions L2 with the exact
   pure cyclotomic normalisation theorem.

The IntegralIwasawaTheory general-conductor norm-lattice correction and
dyadic reflection input to arithmetic μ=0 also remain the explicitly
recorded limitations of those supplier targets. This review does not
certify their proofs by inspecting their statements. No supplier files
were changed, and no new ownership move is proposed.

## Source verification

The public Rubin author draft, RJW arXiv v2 and Greither Numdam PDF were
downloaded and their SHA-256 values matched the accepted packet. Printed
page numbering was checked rather than inferred from PDF page indices.
The random sample was obtained by `random.Random(10897).sample(nodes, 15)`
on the packet's node array; the following records its members so a later
review does not need the scratch files. Sources and locators were read;
the descriptions here are independently phrased checks, not excerpts.

| Sample target (README) | Locator checked | Finding |
|---|---|---|
| Strict Selmer/class-group dictionary (§1.3) | Rubin I, Proposition 6.1, p. 14; III, proof of Theorem 2.3, p. 36 | Finite versus strict conditions and the `χ(p)≠1` restriction are retained. |
| All-prime Coleman sequence (§4.4) | Greither, before Theorem 2.4, p. 458, and proof, p. 459 | Coefficient Frobenius and the additional dyadic sign term are part of the contract. |
| Kolyvagin step (§4.11) | Greither, before Lemma 3.12, p. 477; Lemma 3.13, p. 479 | The p-Sylow/prime-to-p character separation is not replaced by integral semisimplicity. |
| Ramified minimal polynomial (§0.1) | RJW §10.2, Lemma 10.3, p. 48; Rubin III §2.1, p. 34 | The compatible-root polynomial and degree hypothesis agree. |
| Trivial-zero formula (§4.19) | Greither, reduction to Theorem 4.6, p. 488, and proof, p. 492 | The argument uses nonzero valuation and logarithm lines; the exceptional nonvanishing gap remains relevant. |
| Real p-extended number (§0.12) | Rubin III §2.1, p. 34 | Realification is a relative norm, with degree-one bottom cases. |
| Rubin sign convention (§0.6) | Rubin III §2.1, display (2), p. 34 | The package's degree sign is necessary, including at the prime 2. |
| Character generator (§0.22) | Rubin III §2.2, pp. 34–35, and Definition 2.2, p. 35 | Norms and the finite character sum give the indicated generator. |
| Cyclotomic Kummer classes (§0.16) | Rubin III §2.1, p. 34; RJW §10.5, equations (10.5)–(10.7), p. 52 | Completion and the Kummer coefficient twist are distinguished. |
| Integral χ-parts (§4.1) | Greither, introduction conventions (a)–(g), p. 451 | Character quotient followed by prime-to-p component agrees; no averaging by a nonunit. |
| Iwasawa Euler-system hypotheses (§2.1) | Rubin II §3, p. 27, Theorem 3.3, p. 28; III.2.7, p. 38 | The local multiplicative rank-one input is an additional arithmetic contract. |
| Gras consequence (§4.26) | Greither Theorem 4.14, p. 495; Corollary 4.15, p. 496, and proof, p. 497 | The factor from `L_p` versus `½L_p` is kept at p=2. |
| Finite-layer links (§4.10) | Greither Lemmas 3.9–3.10, p. 475; Lemma 3.11 and proof of 3.10, p. 477 | Bounded errors and the inertia module are not silently omitted. |
| Derivative classes (§1.4) | Rubin IV, Definition 4.1, p. 62; Definition 4.10 and Lemma 4.13, pp. 66–67 | The derivative class includes the actual descent and local comparison inputs. |
| Character Frobenius factor (§0.20) | Rubin III, proof of Theorem 2.3, equation (6), p. 36 | The inverse character value is consistent with arithmetic Frobenius. |

Every flagged comparison was also followed beyond the random sample:

| Flagged comparison | Additional source read | Result |
|---|---|---|
| Circular-unit finite descent | Rubin III, proof of Corollary 2.8, p. 38 | Referral confirmed; required uniform unit-side comparison not established there. |
| Odd-p split case | Greither Theorem 4.1 and proof, pp. 482–484 | Restriction of the written proof to p=2 confirmed. |
| Exceptional Gauss logarithms | Greither definitions and (G1)–(G2), pp. 490–491; Gross Proposition 1.16, p. 983, through indexed primary-source text | Algebraic-coefficient injectivity confirmed; arithmetic projection still unsupplied. Gross pp. 993–994 not verified. |
| Pure cyclotomic image | Greither proof of Theorem 2.13, pp. 465–467; Coleman L4 image/generator targets | The nontrivial-Δ argument cannot handle conductor 1; the separate normalisation comparison remains required. |

The Tokyo repository PDF for Gross repeatedly returned a timeout or HTTP 502.
Indexed text of the primary PDF exposed Proposition 1.16 and its proof on
p. 983, which were read. It did not expose the required §4 pages. Neither a
full download nor a verification of those equations is claimed. The source
entry remains [Gross, p-adic L-series at s=0](https://repository.dl.itc.u-tokyo.ac.jp/record/39628/file_preview/jfs280340.pdf).
No unavailable locator is treated as closing an argument.

The cleared library index was checked. No uncleared copy of Washington,
Lang, Mazur–Wiles or Solomon was used. Book and referred-paper proofs were
not inferred from their citations. No source file, passage or source-by-source
summary is included in the deliverable. No theorem of Tate's thesis is a
target; Tate twists and Kummer duality here are unrelated to that exclusion.

## Shape, library and dependency audit

LocalGaloisGroups and ProfiniteArithmetic README/Suggested files were read
as the two upstream models. This README has the opening Summary, scope,
conventions, exact contracts, ordered layers, named API and discriminating
Checks, examples and references. Its 75 anchors account for every packet
target: 31 in Layer 0, 6 in Layer 1, 4 in Layer 2, 5 in Layer 3, 26 in Layer 4
and 3 in Layer 5. Every local Needs link goes backwards in the presentation.
The three consequences in Layer 5 correctly follow the inputs they consume.

All 55 named API items and 56 named checks of the 13 definition/construction
groups are present. Each group has at least three discriminating checks.
The Gauss-vector group separately tests its constituent carriers and maps.
Tests include computed nonzero values and counterexamples; the minimum is
not obtained by counting only restatements of membership. The two Lean
definitions have real bodies. Definitions needing arithmetic supplier
carriers are listed in the closing comment and remain specified in the
README. No data definition or data instance has a `sorry` body. The file is
236 lines and develops no auxiliary arithmetic theory.

The 29 cited baseline declaration statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` in the pinned build.
This includes norm formulas and their freeness/tower/Galois hypotheses,
cyclotomic degrees and primitive roots, integral elements and ideals,
representation invariants and averaging, unit criteria, the additive unit
rank, Kummer coefficients and maps, and power series. In particular:

- Norm transitivity needs its module hypotheses; it is not a theorem for
  arbitrary algebra towers.
- The additive rank of units supplies no characterwise Galois-module
  decomposition. The latter is correctly requested from the arithmetic owner.
- Averaging requires invertible group order. The integral p-Sylow quotient
  in §4.1 cannot be replaced by a character idempotent.
- The Kummer map has its invertible-order coefficient assumptions and the
  appropriate multiplicative/cohomological convention.

The current upstream roadmap checkout was
`0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Every target was screened by
its mathematical objects and hypotheses against those checkouts, including
the nine newer roadmap directions, nested OperatorTheory parts, and
Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and
RestrictedProducts. The generic completed group algebra, local
multiplicative objects, profinite powering and reciprocity already have
owners and are deferred in Scope and ownership. Current finite-field Gauss
sum results and the Stickelberger discriminant congruence do not supply the
arithmetic Gauss-ideal/logarithm comparison here. No additional duplicate
target was found and no removal was made. This is a scoped library search,
not a claim that the whole libraries have been proved free of overlap.
No lake command ran in either read-only checkout.

Every external fine-grained prerequisite ID resolves to a supplier packet
node. Coarse layer references have the exact mathematical contracts in the
README. Generic Euler-system results are imported directly from ES.1–ES.4
and ES.8, while the Tate-twist dictionary stays with SelmerIwasawaCohomology.
There are no `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholders.
This roadmap is outside the current Caraiani–Newton tier subset; a new tier
was not invented. Early IntegralIwasawaTheory inputs are distinguished from
its later main-conjecture consumer. Its arithmetic μ=0 input explicitly
requires an independent argument. The four missing comparisons above,
rather than a manufactured dependency cycle, are the remaining defects.

## Adversarial mathematical pass

These are specification checks, not claims that admitted Lean proofs prove
the assertions. The table covers all 75 target sections, including the APIs
and conventions within each. “Retained” means the input already imposes the
restriction or contains the indicated witness; only the quotient correction
above was a new mathematical edit.

| Target section | Instance or boundary checked | Outcome |
|---|---|---|
| 0.1 | `m=2, ℓ=2`: primitive fourth root over ℚ | `X²+1`; the ramified hypothesis gives degree 2. Retained. |
| 0.2 | `m=1`; also `m=3, ℓ=2` | The removed lower-field root accounts for degree `ℓ-1`; conductor 1 uses a polynomial identity. Retained. |
| 0.3 | Norm of `1-i` to ℚ | Value 2 equals `1-ζ₂`. Compatible roots are essential. Retained. |
| 0.4 | `η=1` at conductor 1 | Multiplied identity becomes `0=0`; it must not be divided by zero. Retained. |
| 0.5 | Conductor 7, auxiliary prime 2 | Inverse Frobenius exponent is 4, since `2·4≡1 mod 7`; exponent 2 is rejected. Retained. |
| 0.6 | `ζ=-1` in ℚ versus `i` over ℚ | Degree-one norms change sign and degree-two norms do not. Retained. |
| 0.7 | Prime 2 at conductor 1 | Norm is 2 in the degree-one extension. Retained. |
| 0.8 | `p=5,m=3`; additionally `ζ=0` in the ratio example | An individual entry can be torsion. Added nonzero hypothesis and proved counterexample to the false ratio generalisation. |
| 0.9 | Bottom p-step, including p=2 | The definition at the next level gives exactly the required norm, without an Euler factor. Retained. |
| 0.10 | Auxiliary step from `m=1`, with distinct primes | The rational norm is 1, as the Frobenius factor on a rational element requires. Retained. |
| 0.11 | p-power conductor, including the bottom 2-level | Absolute norm p prevents the whole family being torsion; it does not forbid individual torsion entries. Retained. |
| 0.12 | Conductors 1 and 2 versus conductor 5 | Real norm has degree one at the first two; no automatic squaring there. Retained. |
| 0.13 | Bottom real/full tower square | Transitivity uses the actual extension degrees. Retained. |
| 0.14 | Smoothing at `a=1` and failure of coprimality | The zero/torsion boundary and unit requirement distinguish the smoothed class from the unsmoothed number. Retained. |
| 0.15 | Prime p versus a different prime | The p-ramification and auxiliary Frobenius hypotheses have distinct roles; the ray modulus includes the infinite place where required. Retained. |
| 0.16 | Exponent zero and a p-power input | Kummer classes vanish in the prescribed cases; the class of p is detected by valuation. Retained. |
| 0.17 | Tate lattice and its dual | The polynomial is `1-x` for this coefficient convention, not `1-qx`. Retained. |
| 0.18 | Trivial character; sign action on ℤ/2; zero module | Eigenspaces agree with invariants at χ=1; injectivity must be on the module. Retained. |
| 0.19 | Trivial group and a two-element sign character | Sum is identity in the first case and a difference in the second; its square is multiplied by group order. Retained. |
| 0.20 | Order-four value `χ(s)=i` | Frobenius factor is `1+i`, distinguishing the inverse from `1-i`. Retained. |
| 0.21 | `O=ℤ, ω=-1, n=2` | Resulting 2 is not a unit, so invertibility of the order cannot be dropped. Retained. |
| 0.22 | Quadratic character of conductor 5; trivial-character boundary | Ratio `(3-√5)/2` is a unit; the analogous trivial-character prime norm need not be. Retained. |
| 0.23 | Prime-power conductor versus two distinct prime factors | Valuations are killed by the nontrivial character in the first case; the raw cyclotomic number is already a unit in the second. Retained. |
| 0.24 | Conductor 5 at p=3 and p=5; torsion replacement | Both genuine spans have index 1; a torsion family gives zero after completion. Retained. |
| 0.25 | `p|f` and a norm grouped by restriction to L | The character twist is formed via the actual norm and Kummer dictionary, not an unprovided descent. Retained. |
| 0.26 | `χ(p)=0,1` | Factors are respectively 1 and 0. Retained. |
| 0.27 | Nontrivial prime-to-p root versus `χ(p)=1` | Unit Euler factor precisely excludes the vanishing case. Retained. |
| 0.28 | Base number 1, raw prime-conductor number, split p=11 for conductor 5 | Raw family fails the finite condition; the twisted unsmoothed span survives when the p-extended span vanishes. Retained. |
| 0.29 | `m=1`; `m=3,b=5` | Operators are 0 and `-(1-j)`; smoothing must descend the Gauss ratio, not just its power. Retained. |
| 0.30 | Even component and trivial conductor | Both vanish; the raw polynomial remains `1-x` with trivial coefficients. Retained. |
| 0.31 | Auxiliary q=2 at odd p; zero family | New polynomial is `1-x/2`; coefficients remain trivial and the zero family stays zero. Retained. |
| 1.1 | Rank-one nontrivial character and `χ(p)=1` boundary | Cyclotomic error-term vanishing uses the stated character assumptions. Retained. |
| 1.2 | Conductor-5 unit line at p=3 | Divisibility index is a length in the character line, not the full real-unit rank. Retained. |
| 1.3 | Strict versus finite local conditions at p | Extra local term disappears only under the specified nonsplit character condition. Retained. |
| 1.4 | Empty auxiliary product and one auxiliary prime | Identity derivative versus the actual weighted derivative; descent is an input, not an arbitrary lift. Retained. |
| 1.5 | A prime away from the conductor versus a selected auxiliary prime | Unramified and transverse conditions are distinct. Retained. |
| 1.6 | Trivial class group; zero initial class boundary | Bound is meaningful with a nonzero generator and finite unit index; zero is not used to prove a finite bound. Retained. |
| 2.1 | Rank-one local multiplicative limit, not merely Γ | Local rank and torsion-freeness require their own supplier theorem. Retained. |
| 2.2 | Passage from a fixed level to norm-compatible systems | Every arrow is a norm/corestriction arrow with the prescribed character action. Retained. |
| 2.3 | Replacing a generator by its nonunit multiple | Index ideal changes accordingly; no unit normalisation is silently discarded. Retained. |
| 2.4 | Class module zero | Unit characteristic ideal divides the unit-quotient characteristic ideal in the claimed direction. Retained. |
| 3.1 | Global units embedded into semilocal units | The four-term sequence keeps its final unramified quotient; it is not shortened to an isomorphism. Retained. |
| 3.2 | Trivial character of the real ℚ cyclotomic tower | This component is treated separately, not by nontrivial-character division. Retained. |
| 3.3 | General conductor; finite errors growing with n | Finiteness at each level is insufficient for a uniform bound. Remaining obligation 1. |
| 3.4 | Distinct polynomials with equal μ and λ | Growth alone cannot identify ideals; divisibility makes the quotient a unit. Uniform comparison remains required. |
| 3.5 | Non-Vandiver prime and nontrivial even component | Only the characteristic-ideal equality is unconditional; the stronger module isomorphism is not asserted. Depends on obligation 1. |
| 4.1 | Nontrivial p-Sylow, including p=2 | Quotient by the character kernel precedes the prime-to-p component; rational idempotents are not integral definitions. Retained. |
| 4.2 | Norm descent with finite nonzero error | Bounded kernel/cokernel errors are kept rather than called exact. Retained. |
| 4.3 | Exceptional dyadic root/sign term | Generator description retains the difference between odd p and 2. Retained. |
| 4.4 | p=2 and nontrivial coefficient Frobenius | Neither `{±1}` nor the coefficient Frobenius may be suppressed. Retained. |
| 4.5 | Θ versus the interpolation map | Kernel and cokernel statements belong to their specified map, not to a generic identically named Coleman map. Retained. |
| 4.6 | Trivial Δ-character versus nontrivial one | Hypothesis of the one-generator argument cannot be replaced by nontriviality on Φ alone. Retained. |
| 4.7 | `F=ℚ,p=5,ρ=ω²` | Conductor-one `X` is not a unit; remaining obligation 4. |
| 4.8 | Inverted Γ-coordinate and raw Coleman sign | Image identification depends on the unsupplied comparison in 4.7. Remaining obligation 4. |
| 4.9 | p=2 with a prescribed Kummer symbol | Prime selection retains the compatibility and congruence restrictions; odd-prime semisimplicity is not used. Retained. |
| 4.10 | Finite layers with nontrivial inertia commutators | Exact finite-level link includes the inertia module and bounded constants. Retained. |
| 4.11 | p-Sylow character and prime-to-p lift | Maschke is applied only where group order is invertible. Retained. |
| 4.12 | p=2 and zero class component | Divisibility induction uses the all-prime μ=0 input, with its independent supplier obligation. Retained. |
| 4.13 | Complex conjugation and the exceptional twist | Odd/even conversion uses `χ̌=ωχ⁻¹` and the stated finite correction. Retained. |
| 4.14 | Odd p versus p=2 | The one-half normalisation is a unit only at odd p. Retained. |
| 4.15 | Completely split p-primes and real class injection | Divisor classes and plus injection keep the ambiguous-class and faithfulness hypotheses. Retained. |
| 4.16 | `χ(2)=1` | Constant term vanishes, so a derivative and the split-prime quotient are necessary. Retained. |
| 4.17 | Real 2-unit and the dyadic sign subgroup | The quotient kills the real part but retains the specified semilocal kernel. Retained. |
| 4.18 | `F=ℚ(√-7)`; norm from D to a proper subfield; `log₂(2)=0` | Valuation and logarithm vectors differ, log lands in `4M`, and the Gauss sum must be normed. Nonvanishing still needs obligation 3. |
| 4.19 | Zero versus nonzero logarithm line | An index of the zero line is not finite; the derivative identity does not discharge obligation 3. |
| 4.20 | Odd dyadic character on cyclic Δ₂ | Faithfulness supplies the stated character bound; its proof does not justify the odd-p split extension. Retained. |
| 4.21 | Odd p with `χ(p)=1` | No exact split lattice comparison or finite-factor computation supplied. Remaining obligation 2. |
| 4.22 | Split and nonsplit dyadic characters | Trivial-zero derivative case depends on the nonzero Gauss logarithm. Remaining obligation 3. |
| 4.23 | Ray class growth at p=2 | Regulator normalisation uses `½L_p(1,χ)`; replacing it by `L_p` changes dyadic valuations. Retained. |
| 4.24 | Norm followed by inclusion | Composite degree factor and the direction of the maps are preserved. Retained. |
| 4.25 | Real field with trivial versus nontrivial character | Trivial component is separated before the real character formula. Retained. |
| 4.26 | Ramified coefficient ring and p=2 | Lattice defects are compared through a common lattice; the `O/2O` class does not vanish. Retained. |
| 5.1 | p divides the character conductor | Primitive-conductor unit line and conductor correction are still needed; the supplier gap is not removed by the nonsplit case. Retained. |
| 5.2 | Odd character and Tate dual | Twist/parity and rank-one versus torsion modules are distinguished. Retained. |
| 5.3 | Positive/negative twist parity and exceptional twists | The Selmer dictionary is imported with its exact local conditions before transporting characteristic ideals. Retained. |

The generality audit also compared characteristic-zero fields with residue
characteristic p, coefficient DVRs with ramified coefficient DVRs, zero
modules, unit ideals, and the trivial group. Field cyclotomic statements use
characteristic zero; arbitrary-module character identities use a commutative
ring; arithmetic length and characteristic-ideal assertions use their
specified coefficient DVR and Iwasawa algebra. Ramified coefficients do not
allow p-length to be substituted for uniformizer-length without its factor.
There is no assertion over an arbitrary equal-characteristic DVR that uses
an unprovided p-adic logarithm or arithmetic tower. Every division inspected
has its nonzero premise; the newly found failure at zero is fixed above.

## Lean signature and validation record

More than ten theorem signatures were compared individually with the README:

| Suggested declaration | README | Hypotheses/convention checked |
|---|---|---|
| `minpoly_step_of_dvd` | 0.1 | Positive m, prime ℓ, characteristic zero, primitive compatible roots, `ℓ|m`. |
| `minpoly_step_of_not_dvd` | 0.2 | Nondivisibility and inverse exponent modulo m; multiplied polynomial identity at m=1. |
| `norm_one_sub_of_dvd` | 0.3 | Same root and cyclotomic-extension data as the polynomial step. |
| `norm_one_sub_mul_of_not_dvd` | 0.4 | No illegitimate cancellation at conductor 1. |
| `norm_one_sub_mul_frobenius` | 0.5 | Arithmetic automorphism is inverted and coprimality supplied. |
| `norm_sub_one_eq_neg_one_pow_mul` | 0.6 | Finite extension; exponent is the actual dimension. |
| `norm_one_sub_of_prime` | 0.7 | Prime 2 included; conductor positive from primality. |
| `mem_chiComponent` | 0.18 | Real eigensubmodule carrier, no hidden semisimplicity. |
| `chiComponent_trivial_eq_bot` | 0.18 | Scalar injectivity on M, not merely a domain assumption on O. |
| `chiSum_mem`, `chiSum_add` | 0.19 | Finite group and commutative coefficient ring; no division by its order. |
| `chiSum_of_mem`, `chiSum_chiSum` | 0.19 | Unnormalised cardinality factor, also for modular coefficients. |
| `chiSum_map` | 0.19 | The linear map has explicit equivariance. |
| `chiSum_sub_frobenius` | 0.20 | Inverse group action and inverse character value match. |
| `isUnit_one_sub_of_pow_eq_one` | 0.21 | Domain, nontrivial root and invertible order are all present. |

`lean-check` on the corrected Suggested file exited 0. Its only diagnostics
were 27 `declaration uses sorry` warnings. The zero counterexample is proved;
admitted examples and theorem signatures are not represented as proofs.
`scripts/check_sorry_data.py` found no admitted data. `git diff --check`
passed. The intake check on all five permitted package/review paths reported
`5 file(s), 0 problem(s)`. The unchanged accepted packet also passed
`scripts/check_blueprint.py` with zero errors and warnings: 75 targets,
55 API items, 56 named checks, four gaps, twelve requests, five stages
planned and none closed.

To resume, start with the four precise obligations above and their named
owners. The report contains all continuation information; scratch downloads
and temporary extraction scripts are unnecessary and are not deliverables.
