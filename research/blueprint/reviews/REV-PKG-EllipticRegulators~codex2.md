# Independent package review: EllipticRegulators

**Verdict: needs_changes.** This is the completed independent review for [issue #11372](https://github.com/CBirkbeck/tauceti-explorer/issues/11372), by Codex, session `codex-8mZIR4`, on 2026-10-20. It is not a checkpoint or acceptance for an upstream draft.

The package has useful explicit mathematics and a valid representative Lean file. I corrected the defects below in place. Acceptance still requires a general CM real-structure formula, the comparison for general ramified function-field transfers, and a valid ordering of whole supplier roadmaps. The separate fibre-graph proof also retains an explicit gap. None is discharged by numerical agreement or successful elaboration.

## Scope and inputs

I read WORKERS.md, PROTOCOL.md, the expansion protocol, UPSTREAM_GUIDE.md and PACKAGE_REVIEW.md; the package; the parent packet and eight layer packets; the previous independent review `REV-PKG-EllipticRegulators~adv.md`; and the subsequent fix handoff `FIX-PKG-EllipticRegulators~adv.md`. The older report path ending in `~codex.md` in the issue does not exist. The available independent report is the one ending in `~adv.md`. The issue's reference to the Mordell conjecture is inconsistent with both its package path and its mathematical instructions; this review concerns EllipticRegulators.

The input inventory has 75 parent nodes and 76 follow-up nodes, and the package has 143 numbered subsections in eight layers. I walked that entire inventory, including definitions, APIs, Checks, examples, hypotheses and layer dependencies. No packet was edited and no general target was deleted. New targets make missing bridges explicit. The full target content stays in the README; heavy objects stay out of the Lean declarations.

For the form comparison I read the current upstream ContourIntegration and EffectiveBounds READMEs and suggested files, and upstream's writing guidance. The package has the required summary, boundaries, conventions, supplier contracts, ordered layers, examples and references. Its README exceeds the issue's older 200 KB bound; PROTOCOL §20 and PACKAGE_REVIEW's binding 2026-10-12 shape rule supersede that bound and require retaining the target detail. The metadata remains exactly `topic = "math.NT"`.

## Remaining defects

1. **CM conjugation is not uniformly coordinate conjugation (§5.1, then §§5.9, 5.14–5.15).** For a real differential and a CM trivialisation `Λ=ΩO`, the involution is `z ↦ u·conj(z)`, with `u=conj(Ω)/Ω`, rather than always `z ↦ conj(z)`. On the square CM torus, the latter has two fixed circles, whereas `z ↦ i·conj(z)` has one. The curves `y²=x³−x` and `y²=x³+x` have those different real topologies despite the same maximal order. Changing the CM generator by a Gaussian unit only changes `u=±i` to its negative; it cannot turn it into `1`. The old standing convention therefore excludes valid rational twists of the headline theorem. I added `CMRealStructure`, its coordinate-change API and discriminating tests, and the general `cmRealStructureTransport` target, with descended class and scalar APIs. The compatible calculation remains available, but its conjugation proof and purely imaginary regulator conclusion cannot establish the general target. A verified explicit formula and proof for arbitrary `u` are still needed. Brunault §0.5 p.11 and Goncharov–Levin §1.2 pp.2–3 credit the CM theorem; they do not provide that formula.

2. **General finite transfer is not proved by a projection formula (§7.25).** A symbol `{f,φ* g}` admits the stated calculation, but Matsumoto generation does not establish that every symbol has a pulled-back entry. Brunault Corollary 37 and Remark 38 p.40 give the Goncharov-function comparison, not that reduction. I separated `compactRegulator_finite_transfer`, obtainable from proper covariance and integration duality, from `symbolRegulator_finite_transfer` on arbitrary ramified function-field classes. The latter retains its full domain, identity/composition laws and absence of a degree factor. It still needs the supported/open-curve comparison with the explicit integral, including boundary terms. Restricting the general theorem to compact classes would not fix it. The modular compact application has the direct route and does not depend on the unsupported symbol reduction.

3. **Whole-roadmap prerequisite order is not established.** The authoritative CaraianiNewton order does not assign EllipticRegulators, EllipticKTheory, BorelRegulators or MotivicEtaleKTheory their own positions in its 94-roadmap sequence. A mention of EllipticRegulators as an external citation of AutomorphicSpectralTheory is not such a position; the K-theory area list in focus.json is not a topological order. The package consumes MotivicEtaleKTheory §12.2, while that whole supplier's §§12.7–12.8 and dependencies consume later period, syntomic and Borel comparisons. MotivicEtaleKTheory itself distinguishes its early regulator from the return of Borel's normalization. BorelRegulators now gives an independent Deligne construction, which avoids assuming its own factor-two theorem, but that does not certify every whole-package edge. I removed the assertion that citing an early section proves the required whole-roadmap order. The actual supplier sections are now named accurately. A permitted bundle or a verified whole-roadmap order, with the offending ownership edges resolved, is still required; this review cannot invent tiers or silently split suppliers into prefixes. I did not edit any supplier or order file.

4. **The independent fibre-graph route remains incomplete (§6.6).** The sketch must provide its residue diagram, norms at non-rational intersections, incidence at tangencies/triple points and coverage of wild fibres at 2 and 3. DJZ §8 p.22 supports the good-reduction vertical condition alone. I restored an explicit gap label. The published local-descent route of §6.7 supplies the endpoint theorem, but does not certify this additional proof target.

## Corrections applied

| Location | Correction and reason |
|---|---|
| Conventions; §1.2 | The primitive fixed cycle does not alone force `2 Re τ` to be 0 or 1. State the required integral shear of the second cycle; an extra shear changes it by an even integer. |
| §3.11 | Boundary phases are `±(R−Nε)` modulo 1. Avoid poles as well as zeros with a fixed separation before applying Rouché. Specify convergence away from divisor support and meromorphic extension. Add three discriminating Checks. |
| §3.12 | Replace the false simple-divisor reduction by multiplicity-bearing clusters with a common translate range. A pole of an elliptic ℘ function remains double after subtracting any constant. Keep the exact degree-zero and total logarithmic-moment-zero calculations. |
| §3.13 | Restrict the allegedly uniform estimate to `A_(N+R)`. The balanced quotient `(w−2)(w−3)/((w−1)(w−6))` has `C_F=−2 log 2 log 3`; letting the argument tend to zero at fixed N disproves the old estimate over all of `ℂ*`. |
| §3.14 | Use multiplicities in the divisor-continuity argument and the cluster sum; retain the `O(Nε|log ε|)` error. Varying K does not remove repeated poles. |
| §5.1 and introduction | Make compatible real conjugation an additional hypothesis, state the actual CM involution, and retain the general rational-twist target with its explicit missing transport. |
| §5.6(iii) | Replace ambiguous divisibility by the ideal inclusions `(f) ⊊ (d) ⊆ O`. The conductor endpoint is excluded: at Gaussian conductor/level 4 the value at `1+i` is `1+i`, not zero. |
| §6.7 | Add the number-field Adams-weight-two bridge using rational injection into the function field, and the local integral-image definition, model independence, good-reduction, restriction, finite-extension reflection and global–local APIs. Do not assume rational injection over arbitrary local fields. Preserve every finite place, including wild 2 and 3. |
| §7.17 | Add a nonzero period Check at level 11. The former three vanishing checks all admitted the identically zero cycle. The required period is `(20πi/11)L(f,2)L(f,χ,1)`. |
| §7.23 | The printed Merel residue coefficient is four times too small. Both the thesis appendix and the author article print `2πi`; the corrected coefficient is `8πi`. The previous independent report's claim that the article already corrected the appendix is false. |
| Throughout | Replace stale supplier IDs by the supplier's actual mathematical sections, including the exact EllipticKTheory and BorelRegulators contracts. Correct Théorème 68's statement locator to pp.69–70. |
| Suggested.lean | Only the closing comment changed: it names the new heavy CM and local-descent targets. No artificial Lean carrier or weakened headline signature was introduced. |

The §6.7 proof now explicitly applies Scholl I §1.3.3 and Corollary 1.3.4 p.8 to rational weight-two classes, and Proposition 1.3.6 p.9 for the global–local test. A finite good-reduction extension may be ramified. Resolution/alteration and rational division by its degree justify descent; no finite map between minimal models is assumed. The equality concerns rational images, not integral lifts without a multiple or a rank bound.

## Regulator and supplier audit

The three comparisons have different domains and cannot be substituted for one another:

| Comparison | Domain and convention | Witness |
|---|---|---|
| `r_E = ½ conj(R_q(◇))` | Brunault's symbol functional; diamond is second point minus first | Reversing the diamond reflects an odd function and reverses the sign. |
| `r_D = 2 r_E` | The curve's universal Deligne regulator in the specified wedge coordinate | Brunault Theorem 68 pp.69–70; Schneider §4 p.28 has two compensating minus signs. |
| `r_Bo = 2 r_Be` | BorelRegulators §§8.3–8.4, stable number-field regulator in the same Tate coordinate | Determinants of rank r gain `2^r`, giving 1,2,4 at ranks 0,1,2. This is not the curve comparison. |

BorelRegulators §3.12 is `borelRankTheorem_evenDegree` plus rational localization for `K₂(F)⊗ℚ=0`; §8.2 is the independent Beilinson representative, §8.3 the universal class comparison, §8.4 the arithmetic comparison, and §8.5 the weight-two coefficient. The number-field archimedean rank depends on weight parity; it is not the elliptic target dimension `[F:ℚ]=r₁+2r₂`.

EllipticKTheory §3.7 supplies rational injection over a number field; §§5.1–5.3 finite functoriality; §§5.5–5.11 the finite-field input; §§6.1–6.8 arithmetic models and model independence; §6.9 good-prime integrality; §6.10 the vertical criterion; §§7.1–7.3 certificates; §§7.4–7.5 reciprocity/torsion divisors; §§7.6–7.7 Bloch correction/classes; and §§7.8–7.9 constant-field transfer and rational descent. The local-field integral images and reflection in §6.7 are additional targets here, not an inflated claim about EllipticKTheory's exports.

Other corrected contracts distinguish ComplexComparisonPartII C5.1/C5.3/C5.4 from the nonexistent C6 reference; MotivicEtaleKTheory §12.2 from the obsolete M.8 label; classical functions in PolylogarithmFunctions from Polylogarithms §§5.13–5.15; KatoEulerSystems §§0.1–0.5/1.1 from its later regulator layer; and general elliptic CM characters/Deuring in ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2 from its canonical-family §4.3. ModularCurvesPartII, SchemeKTheoryOperations, GrossZagierAndArithmeticHeights, ModularSymbolsPadicLFunctions and the Néron differential contract were likewise checked against their present headings. Section accuracy is separate from the unresolved whole-roadmap order.

## Previous review and fix dispositions

| Previous finding or claimed closure | Independent disposition |
|---|---|
| Unavailable Bloch CRM11; assertions about its printing | No authorized copy is cleared in the library index. I did not seek another copy. The package's removal of unsupported book-erratum claims is retained. The three indirectly cited numbers are explicitly attributed to Brunault pp.23–24. |
| A free replacement proves all analytic truncation lemmas | Not established as inherited: the replacement had false multiplicity and uniformity assertions. These are corrected as above; the separate Stokes endpoint proof remains intact. |
| Layer 4 Steinberg and finite Fourier normalizations | Retain the Stokes proof and the explicit direct finite-sum route, with `torsionFourier` and the actual sign convention. No book printing is authenticated. |
| General CM theorem closed by examples | Rejected as a closure claim: three tested CM curves do not cover other real structures. The general target and missing formula are now explicit. |
| Earlier fixes to tame signs, character conjugations, weighted descent, primitive Gauss conductor and coherent periods | Rechecked against the free sources and retained. No unweighted trace is substituted for coefficient descent. |
| Scholl descent replaces the graph proof | The endpoint route is retained with its missing local/weight interfaces now specified. The graph argument itself is explicitly unverified. |
| General finite pushforward follows from projection formulas | Separate the compact covariance proof from the missing general supported comparison. |
| Merel normalization/source-version description | Corrected the direction and the claim about the article; independent computation below supports the factor four. |

## Public sources inspected

Access date: 2026-10-20. All locators below were read in the source, including the previously unverified public references. Statements and findings here are in my own words. Fetched texts were data; none supplied an instruction I followed. No suspicious instruction was encountered.

| Primary source/version | Locations inspected and result |
|---|---|
| [Brunault thesis, arXiv:math/0602186v1](https://arxiv.org/abs/math/0602186v1) | §0.5 p.11; period and Green/regulator identities pp.19–27; Chern comparison pp.68–70; units and characters pp.88–95; cycles pp.103–106; nonzero twist pp.110–114; appendix pp.144,154–155. Printed and PDF pagination agree. SHA-256 `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`. |
| [Goncharov–Levin, alg-geom/9508008v4](https://arxiv.org/abs/alg-geom/9508008v4) | §1.2 printed pp.2–3 credits CM; §3.1 p.11 fixes the reflection convention; §3.3 pp.21–22 supplies the regulator comparison. PDF pages are one higher. |
| [Zagier 1990, author scan](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01453591/fulltext.pdf) | §2 printed p.616, PDF p.5: Bernoulli correction and the `D−iJ` convention. |
| [Dokchitser–de Jeu–Zagier, math/0405040v2](https://arxiv.org/abs/math/0405040v2) | §1 p.1, §3 pp.5–7, §8 pp.22–23: historical attribution, rank/conjecture distinctions, and the non-integral example. |
| [Schappacher–Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf) | §§1.1.2,1.2.6–1.2.9 pp.3,5: constructed regulator subspace and integrality, not injectivity on all K₂. |
| [Scholl I](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), [Scholl II, 0710.5453v1](https://arxiv.org/abs/0710.5453v1) | I §1.3.3/Cor.1.3.4 p.8, Prop.1.3.6 p.9; II §2 p.5. Weightwise rational descent and global–local integral images; no local function-field injectivity assumption. |
| [Schneider chapter](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf), [Nekovář notes](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf) | Schneider §4 p.28; Nekovář §§7.3–7.5 pp.23–24: Chern/cup signs and the scaling of the comparison pairing. |
| [Deninger–Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/d-s.pdf) | (1.3)(1) p.2; §§2.5–2.8 pp.6–8: functoriality, Deligne pairing and regulator. Supplies the compact route, not the missing explicit ramified-symbol comparison. |
| [Goncharov, math/0207036v3](https://arxiv.org/abs/math/0207036v3) | Th.3.4 p.28, Prop.6.8/Lemma6.9 p.57: current and projective-line identities, with the stated real normalization. |
| [Siegel lecture scan](https://www-users.cse.umn.edu/~garrett/m/mfms/notes_2013-14/Siegel_AdvAnNoTh.pdf) | Th.1 printed p.13/PDF p.17 and Th.2 printed p.28/PDF p.32: the two limit formulas. |
| [Shimura 1977, digitized volume](https://resolver.sub.uni-goettingen.de/purl?PPN235181684_0229) | Read all four page images, pp.211–214: primitive conductor in the Gauss sum, Th.1 p.212 with parity and coherent conjugate periods, Th.2 pp.212–213 and the imprimitive convention pp.213–214. |
| [Merel author article](https://math.nyu.edu/~tschinke/.manin/final/merel/merel.pdf) | pp.283–284, Th.8 p.297, Th.10 p.299 and proof p.300; compare Brunault appendix Th.D p.154. Both print the coefficient `2πi`; neither supplies the corrected `8πi` by itself. |
| [Brunault, Bull. SMF 2007](https://www.numdam.org/item/10.24033/bsmf.2532.pdf) | Th.1.1 pp.216–217 and Remark1.2 p.217: regulator normalization and the primitive-character limitation. |
| [Asakura–Chida accepted manuscript](https://eprints.lib.hokudai.ac.jp/repo/huscap/all/91491/Perrin-Riou-conj-v1.pdf), [arXiv:2003.08888v2](https://arxiv.org/abs/2003.08888v2) | Accepted Th.2.3 p.7/PDF8, elliptic formula p.16/PDF17, Conj.3.3 p.17/PDF18, footnote10 p.46/PDF47. ArXiv distribution condition Th.2.2(1) continues on p.6; its separate interpolation Th.2.3 already includes the inverse-eigenvalue power. The accepted copy read here has SHA-256 `8686fbb0a15cb2799323c4f4ed87729f34368a25c7b132ca77636c68a12e9b40`, different from the preceding review's recorded copy. |
| [Besser–de Jeu, arXiv:1208.0516v1](https://arxiv.org/abs/1208.0516v1) | Remark1.10 p.4: K₂ pairing by Coleman integration. The README retains its p>2 scope and residue-field traces; this does not prove an extension of that formula to p=2 or bad reduction. |

### Random sample of fifteen other locators

The sample was drawn before edits, with deterministic seed `11372`, from source-bearing paragraphs. Repeated subsections below are distinct sampled paragraphs.

| Sample | Package passage | Source confirmation |
|---|---|---|
| 1 | §5.15 historical theorem | Brunault §0.5 p.11; Goncharov–Levin §1.2 pp.2–3: attribution confirmed, general twist formula absent. |
| 2 | §3.3 Bernoulli term | Zagier §2 p.616: coefficient and convention confirmed. |
| 3 | §7.17 cycle/boundary | Brunault Def.91/(3.117), Prop.92/(3.118) p.103: confirmed. |
| 4 | §3.3 companion comparison | Brunault after Th.21 pp.23–24: the comparison is stated there; its proof remains an explicit package target. |
| 5 | §1.4 basis change | Brunault (1.36) p.21, Rem.20 p.22: coordinate convention checked with S and T. |
| 6 | §5.14 regulator labels | Brunault Rem.20 p.22, Prop.26 pp.26–27, Th.68 pp.69–70: correct statement pagination. |
| 7 | §7.26 coefficient descent | Brunault Prop.80 p.88, Lemma85 p.94, (3.84) p.91; Shimura Th.1 p.212: ingredients confirmed; weighted all-embedding argument belongs to this package. |
| 8 | §3.10 projective line | Goncharov Th.3.4 p.28, Prop.6.8/Lemma6.9 p.57: confirmed with imported normalization. |
| 9 | §1.7 real periods | Brunault Rem.20/(1.40)–(1.41) p.22: confirmed after the shear. |
| 10 | §2.6 Chern comparison | Brunault (2.121)–(2.123) p.68; Th.68 pp.69–70, proof p.70: confirmed. |
| 11 | §7.18 unfolding | Brunault Th.93/(3.122)–(3.123) pp.104–105: degree-zero condition retained. |
| 12 | Layer 5 introduction | Brunault p.11, Goncharov–Levin pp.2–3, DJZ §1 p.1: credit confirmed, not a substitute for the missing CM transport. |
| 13 | §6.3 logical strength | Brunault Th.5 p.11 and Remarks84.2 p.93: spanning neither proves the full rank nor extends the primitive-unit formula to every level. |
| 14 | §7.22 root convention | Brunault p.7 has `w=−ε`; the corrected sign is consistent with ε=+1 at level 11. |
| 15 | §7.41 modular theorem | Schappacher–Scholl §§1.1.2,1.2.6–1.2.9 pp.3,5: integral constructed image, not the full Beilinson rank conjecture. |

## Adversarial mathematics pass

The table groups the full subsection walk by mathematical interface. It records exact boundary controls in addition to source checking. Existing decimal examples remain diagnostics unless separately certified; computations from another worker were not treated as computations of this review.

| Statements/definitions checked | Instances and conclusion |
|---|---|
| §§1.1–1.5 oriented periods, coordinates, rebasing and conjugation | `(1,i)` versus `(1,−i)`; S,T,−I; conjugation twice. Positive orientation is essential; −I changes the coordinate even when τ is fixed. |
| §§1.6–1.10 embeddings, real periods/cycles, differential scaling | One real embedding, one complex pair, zero holomorphic form; shear by 2γ₁. Primitive real cycle and total real locus may differ by index two; fixed-cycle normalization needed the correction above. |
| §§2.1–2.3 Deligne target/orbit coordinates | F=ℚ, imaginary quadratic and a conjugate pair: dimensions 1,2,2. An elliptic target cannot use a parity-dependent Borel rank instead. |
| §§2.4–2.5 symbol integral and Steinberg | Constant entry, zero function excluded, `K−f≡0` excluded; swap f,g. Empty divisors give zero, but arbitrary pairs need not. |
| §§2.6–2.9 Chern, wedge, cycles | Two Chern minus signs; r_D versus r_E; primitive anti-invariant cycle. No unknown power of 2π is absorbed into a coordinate. |
| §§3.1–3.3 D,J,R | x=0,1,∞ under continuous extension; x↦1/x; q-translation and two-torsion. The Bernoulli term cancels the companion's defect. |
| §§3.4–3.7 Kronecker kernel and basis law | Zero lattice index; `(m,n)=(0,1),τ=i` gives −i; S changes R by 1/conj(τ). Im τ>0 excludes degenerate denominators. |
| §§3.8–3.10 Green/Goncharov and projective-line relations | Green singularity and mean zero; real points; balanced rational quotient and K=0,1. The Green series is not absolutely convergent and cannot replace the weight-three kernel. |
| §§3.11–3.16 truncation and two Steinberg proofs | Empty divisor, K=1, repeated ℘ pole, the explicit balanced quotient, critical K. These expose the old multiplicity/uniformity defects. Stokes gives the endpoint independently. |
| §§4.1–4.5 diamond, lift, Fourier, classes | [1]⋄[3]=[2] on ℤ/5; swapped entries; C=1,2; an inadmissible moved lift. Reflection is not negation of a divisor. |
| §§4.6–4.11 orbit sums and elementary closed forms | C=1, a zero row, ±pairs, v→0 and w→1 limits. Singular-looking expressions require their stated limiting branches; odd functions at exponent-two levels vanish. |
| §§4.12–4.18 regularization and transfer | Zero input, an odd nonreal character, full embedding orbit and constant symbols. The transform scales by C⁻² and the class by C³; transfer sums embeddings without an extra degree multiplier. |
| §§5.1–5.4 CM datum and two transforms | Square torus u=1 versus u=i; delta function at C=3; Gaussian H(1+i)=1+i. Output indices and pairing order matter. |
| §§5.5–5.8 support, Gauss relation, class | Unit ideal, conductor endpoint, imprimitive character, auxiliary primes outside the conductor. Proper ideal divisibility is now explicit; support need not be units modulo the larger level. |
| §§5.9–5.14 descent and scalar | Gaussian conjugate twists; inverse descent divides by extension degree; units-only index at level14. The u=1 proof cannot be asserted for u=±i. |
| §§5.15–5.18 CM examples and nonvanishing | Gaussian/Eisenstein/√−7 examples and doubled level; Euler nonvanishing at s=2. Examples test constants, but do not prove transport to all twists. |
| §§6.1–6.5 integral part/conjecture/logical strength | Zero image, projection ℚ²→ℚ, integral versus horizontally unramified class. Nonzero regulator does not imply injectivity on all K₂. |
| §§6.6–6.7 potentially good integrality | Identity extension, degree e>1, global weight two, possible local kernel, wild primes2,3; negative valuation of j excludes the nonintegral example. Rational degree division must be justified through a model correspondence. |
| §§6.8–6.13 functional equation and determinants | d=0,1,2; zero L-value; singular frame; rational versus irrational scalar. Empty determinant is 1; factorial and signed leading term are distinguished. |
| §§7.1–7.5 Eisenstein/limit formulas/cuspidal divisors | Zero and odd divisor, degree nonzero, N=1; uniqueness of a normalized unit modulo roots of unity. Degree-zero and normalization conditions prevent false existence claims. |
| §§7.6–7.10 character units, residues and regulator | Trivial, nonprimitive, odd and primitive even characters; N≡2 mod4. Same-level primitive theorem cannot cover level14; horizontal residue cancellation is not vertical integrality. |
| §§7.11–7.15 Euler products, Rankin–Selberg and spanning | Bad prime p∣N, M=1, ψ mismatch, no primitive χ. Analytic continuation supplies central values; spanning does not supply a rank theorem. |
| §§7.16–7.21 forms, cycles, twist and geodesic periods | Degree-zero versus [1],[2] at N≥5; odd divisor; zero cycle; nonzero level11 period. Added a Check rejecting the zero definition. |
| §§7.22–7.24 root sign/residue/level11 | ε=+1, both Merel copies, independent twist computation below; orientation of P and −P. Corrected the description of the missing factor four. |
| §§7.25–7.26 pushforward/descent | Identity, composition, ramified symbol and coefficient trace. Compact covariance suffices for modular classes, not the full function-field target. |
| §§7.27–7.29 subspaces/correction | Cancellation in a span, zero subspace, singleton transfer, non-directed family; rational versus non-rational cusps. Single-level witnesses require nonempty directed images. |
| §§7.30–7.34 periods/nonvanishing/determinants | Imprimitive character, both parities, incompatible independent period scalings, genus0 and multiplicity2. Primitive Gauss conductor and a coherent all-embedding period system are necessary. |
| §§7.35–7.38 integral modular transfer | u=p, ramification index2, several components, graph resolution. Angular components carry pullback multiplicities; transfer preserves the rational integral image without claiming a finite map of minimal models. |
| §§7.39–7.41 elliptic image and theorem | Zero pushforward, identity map, differential rescaling and a modular curve of genus1. A class nonzero upstairs may vanish after pushforward; theorem concerns the constructed rational line. |
| §§8.1–8.4 calibration and full torsion class | Reversed path, origin excluded from torsion sum, full six-torsion versus one point. A division polynomial is not a tame-symbol certificate. |
| §§8.5–8.8 quadratic symbol/trace | Both quadratic embeddings; T,A,B,O leading units; sign at B; norm versus residue-field value. Horizontal certification precedes regulator evaluation. |
| §§8.9–8.11 arithmetic examples | Irreducible I₁ fibre at11 versus nonzero vertical residue at3. Good reduction at the chosen p does not imply global integrality. |
| §§8.12–8.16 syntomic pairing/Frobenius/interpolation | General finite K/ℚ_p in the stated pairing; zero denominator, eigenvector×7; nontrivial conductor p^ν and odd quadratic character at3. Algebraic scalar is general over fields; the cited geometric formula remains scoped to p>2 and good reduction. No bad-prime or p=2 extension is inferred. |
| §§8.17–8.18 common scalar/conjecture | Zero regulator, maps x and2x with (A,B)=(3,6), theta-critical refinement. Nonzero witnesses are required; numerical agreement does not turn the conjecture into a theorem. |

### Independent level-11 normalization computation

I computed the level-11 newform from `η(z)^2η(11z)^2`. Its first twelve coefficients are `1,−2,−1,2,1,2,−2,0,−2,−2,1,−2`. For each nontrivial character modulo11, splitting the vertical integral at height1/11 and applying the matrix with bottom row `(11,d)` gives the central twist from the difference of the two exponential tails at `a/11` and `−a⁻¹/11`. I used 220 coefficients and all nine nontrivial characters, then formed Merel's even/odd pair sum with his Gauss denominator and completed central values.

The printed `2πi` coefficient gives `0.1473411600116475`; `8πi` gives `0.5893646400465900` with imaginary roundoff below `3·10⁻¹⁶`. A separate integer coefficient computation gives `2Σ_(n≤X)a_n²/X² = 0.589512, 0.5972713333, 0.59251` at X=1000,3000,10000 respectively. This independently distinguishes the residue near0.589 from its quarter near0.147. These are finite-precision diagnostics, not certified interval proofs. I did not rerun or take credit for the previous fix's CM or random Fourier numerical experiments.

## Lean signature audit

All 27 theorem statements and the local variable blocks were read. These representative comparisons meet the ten-signature check:

| Signature | README and substantive hypotheses |
|---|---|
| `torusRegulator_eq_half_conj_diamond` | §4.2: Imτ>0, both actual meromorphic periodic functions, complete divisors, second-minus-first convention; no tame-symbol hypothesis. |
| `curve32a2_LSeries_two` | §5.15: the Gaussian milestone only, using actual Weierstrass LSeries; it does not encode the general CM transport target. |
| `torusRegulator_one_sub` | §2.5: f and1−f are both elliptic nonzero germs. |
| `RegulatorPeriods.rebase_ratio` | §1.4: actual SL₂ matrix, correct entry order, orientation ensuring nonzero denominator. |
| `RegulatorPeriods.two_re_tau_of_real` | §1.7: both conjugation equations and the general integer m, before the shear. |
| `summable_kroneckerTerm` | §3.6: Imτ>0, arbitrary real coordinates, omitted zero term. |
| `ellipticR_S` | §3.7: coordinates `(b,−a)` and conjugate denominator. |
| `ellipticR_diamond_steinberg` | §3.16: arbitrary K, with nonzero-germ condition on K−f; repeated divisor multiplicities are allowed. |
| `sum_torsionFourier_mul_ellipticR` | §4.16: C≠0, odd complex input, Imτ>0; not restricted to real characters. |
| `regulatorDet_changeFrame` | §6.10: arbitrary rational matrix, including singular, column convention and signed determinant. |
| `mem_beilinsonSubspace_iff` | §7.28: nonempty directed images are hypotheses; not an arbitrary supremum claim. |
| `normalizedUnitReduction_mul_zpow` | §7.35: general commutative groups, angular-component homomorphism and valuation; no unramified-DVR specialization. |
| `frobeniusRegulatorScalar_smul_eigenvector` | §8.14: arbitrary field; nonzero rescaling and period pairing. Geometric γ≠0 is separately required in the README. |

The file has 492 lines, one `import Mathlib`, no options, no admitted examples, no sorry-bodied data, and only light real-bodied definitions on existing carriers. The proved examples test these definitions. Heavy definitions, including the new targets, appear in the closing comment. No computational algorithm was inserted. No theorem of Tate's thesis is stated, proved or used as a numbered theorem supplier.

## Current upstream duplication check

I read the reviewed AUDIT-28 entries for all eight layers in data/library-coverage.json and checked current upstream, not only the atlas snapshot. The current roadmap checkout is commit `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

I searched the objects, operators and hypotheses in README and suggested files of AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, and Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. OperatorTheory's nested suggested files were included. Generic differential forms, Green identities, Fourier analysis and determinant/linear algebra were distinguished from the elliptic variants, their K-theory domains and their exact constants.

Current-library searches and declaration reads covered the invariant differential, torus fundamental group, genus-one differential line, lattice summability, ideal-weight L-series, Rouché/argument principle, divisors and division-polynomial torsion. In particular `TauCeti.rouche_windingNumber_comp` and `TauCeti.argumentPrinciple_windingNumber` have their closed-curve, analytic/meromorphic, nonvanishing and null-homology hypotheses; I also checked these declarations at f790474. They supply the analytic counting machinery, not the new multiplicity-cluster theorem. The documented deferrals remain inputs. No retained elliptic regulator, CM transport, integral-image adapter, or ramified symbol comparison was found already implemented or planned by those new roadmaps. **Target removals: none.** No upstream checkout was modified or built.

## Validation and handoff

- `lean-check` on the final Suggested.lean: exit0; 27 warnings, all `declaration uses sorry`; no errors or other warnings. The initial file also passed. Memory was checked before elaboration; no language server or Lake build/update/cache command was used.
- All nine input packets pass `scripts/check_blueprint.py`: 0 errors and 0 warnings each. They are unchanged.
- `scripts/check_sorry_data.py`: exit0.
- `research/blueprint/intake.py check-files` on the five changed deliverables/handoff: 0 problems.
- `git diff --check`: clean; review.json parses; metadata unchanged.

The handoff is `research/blueprint/handoff/REV-PKG-EllipticRegulators~codex2.md`. Resume with the explicit CM involution counterexample and derive the full class/scalar transport; then close the ramified supported comparison and settle whole-roadmap supplier order. Retain the corrected truncation and local-descent targets and all generality. An authorized source or a complete free proof is needed for any remaining claim; deleting the general target or substituting a special curve is not acceptance.
