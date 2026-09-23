# Independent review of ERRATA-PAPER-HE-21

Reviewer: Codex, session `codex-hjdg0j`, 23 September 2026. Issue #1865.
Original errata author: ChatGPT Pro, session `cgp-20260923-h7q4`.
This reviewer contributed neither that errata file nor the earlier extraction.

**Complete: twelve confirmed, two rejected (E5, E15).** All fourteen entries
have individual verdicts. No new source finding was established. Stable IDs
are preserved; E7, E8 and E12 were already excluded from the JSON. The
[mathematical report](../errata/PAPER-HE-21.md) now explains the independent
decisions, including the full routine argument behind the rejected E5.

## Fresh sources and version control

All downloads below were obtained on 23 September 2026. The PDFs and exact
diagnostic scripts remain in scratch, outside the repository. The hashes
identify downloaded bytes, including any publisher download watermark.

| Source | SHA-256 | Scope checked |
| --- | --- | --- |
| [he21-v1.pdf](https://arxiv.org/pdf/2001.03325v1) | `818873a568bf37ec0b336cb12bd6822879ca369865cceb332ba06b95910989a3` | H21 v1, pp.4,8–12: named locators and the changed Theorem 5.5. |
| [he15-v3.pdf](https://arxiv.org/pdf/1511.01386v3) | `f6170c52ce24599a5b1b6d7991ae9c9b98a8be8e5cf8753b9a335e74d3fe3cdc` | H15 v3, Theorem 2.27 and context, p.37; page image inspected. |
| [he14-published.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n1-p06-p.pdf) | `372c913d305f2b9d5f285cfe830d00f5ad3fd98242e31a54991fbf2474b72cbf` | Published H14, §1.4 p.372, §§10–11 pp.396–400; finding-page images 399–400. |
| [ghn-published.pdf](https://www.numdam.org/item/10.24033/asens.2254.pdf) | `f0c94caa4855416b4c1949307ea8c4f382d3310f5b27a349216203f5c9d81e3e` | Published GHN, pp.651–652 and 657–658: adjoint comparison, Levi classes, obstruction and alcove lemma; finding-page images. |
| [ghn-erratum.pdf](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf) | `cf7efbf887e8202c7efd7590e2eebd85c93c89bea81c26fa39a80af8082399c0` | Authors’ GHN erratum, all three pages. |
| [hzz-v1.pdf](https://arxiv.org/pdf/2109.02594v1) | `b38e3ce936e294e06ad3cad7e73584a00351ce83c68b380b2fb314a5ed4bfb3e` | HZZ v1, Proposition 3.4.2 and its proof, pp.22–23. |
| [he21-published.pdf](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-deligne-lusztig-varieties.pdf) | `61111c02998a4c318372f11887a1c3d1d4bc3fc1efa7a1bc105591144aaa01d3` | Published H21, pp.3–14 relevant definitions, construction and proof; finding-page images 4,8–10,13–14. |
| [bs-v3.pdf](https://arxiv.org/pdf/1507.06490v3) | `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e` | BS v3, pp.1–2, equal-characteristic background and mixed-characteristic theorem. |
| [hy-v1.pdf](https://arxiv.org/pdf/1203.4680v1) | `4e72d185afa697bdeb7b941916234e40f4f373f720ba9ae76d2079280bea0e71` | HY v1, §§1.2 and 4.2, pp.2,9, support in twisted cosets. |

Unlike the original errata worker, this review obtained the published H21
PDF. All H21 verdicts therefore concern the published page, with the named
preprint locators checked separately. Theorem 5.5 is genuinely different in
v1 and the journal: the latter starts with a shrunken input and asserts
support containment. The original extraction's blanket equivalence of
versions is not used. H14's published PDF is the named version for its four
findings; no claim is made to have compared every H14 preprint version.

## Individual verdicts

| Finding | Verdict | Independent check and reach |
| --- | --- | --- |
| E1 | Confirmed | Confirmed in the published pp.9–10,14 and H15 v3 Theorem 2.27, p.37. Independently generated the A2 Weyl group, reconstructed the parabolic factorization and Demazure product, and computed the three affine root ranges exactly. The input is shrunken and the constructed seed is not. This invalidates this application of the citation, not basic nonemptiness or the main theorem. The discarded claim about every singular coweight remains discarded. |
| E2 | Confirmed | Confirmed in published p.13 against the definition and GHN Lemma 3.6.3. Direct multiplication gives the correct finite factor yσ(x)=σ(ησ(w)); the recorded A2 example puts the printed conjugate outside W_J. Both translation expressions have the same Levi Kottwitz image because W_J acts trivially modulo its coroot lattice. The reach remains the written proof, not its numerical obstruction. |
| E3 | Confirmed | Confirmed in the published p.8 page image and the v1 p.9 proof. Section 2.2 explicitly defines the order with coroots. The cone elements being compared are coweights; α must be α∨ in the indicated sums, while roots in pairings are unchanged. |
| E4 | Confirmed | Confirmed in the same published and preprint proofs. The all-zero feasible case disproves strict positivity over the entire base. Nonnegative coefficients suffice for the componentwise-minimum proof; strict coefficients on the actual nonzero supports remain valid. |
| E5 | Rejected | Rejected as a source-error allegation. The asserted nonempty feasible set has finite lower intervals: use μ0=λ−λ′+N·2ρ∨ and bound the coroot coefficients below it by pairing with ρ. The printed lower-directedness calculation then gives a global least element. This routine well-foundedness argument requires no missing hypothesis or additional theorem and does not make the proof inadequate. The report spells it out for formalization. The bad simple-coroot direction belongs to the earlier extraction, not this source. |
| E6 | Confirmed | Confirmed as a missing carrier/reduction in the written construction, published pp.5,9–10. Exact A2 calculations show both a nonintegral fundamental coweight for SL3 and nonintegral output γ for a shrunken simply connected twisted input. Narrowed the comparison warning: GHN p.652 already supplies a mixed-characteristic set bijection without the equal-characteristic coprimality assumption. The final geometric transfer still needs the correct scope; auxiliary Kottwitz equality does not supply lifts. H14 §1.4 explicitly imposes adjoint type, while H21 does not. |
| E9 | Confirmed | Confirmed directly in the published H14 p.399 image. The statement introduces the Weyl factor x; v is the Hecke parameter. HZZ v1 Proposition 3.4.2 supplies positive evidence of the intended x-support condition. Already known as a later reformulation, not an official erratum. |
| E10 | Confirmed | Confirmed directly in H14 p.399. Minimality as a left parabolic representative forbids a descent in δ⁻¹(J1); a nonidentity element of W_J has a descent in its complement. This is also exactly the condition needed in the next step. Checked the corresponding outside-parabolic choice in HZZ pp.22–23. |
| E11 | Confirmed | Confirmed directly in H14 p.399. The preceding equations establish saturated support only; the node-interchange A2 example separates it from ordinary support. HZZ retains the saturated support required for induction. |
| E13 | Confirmed | Confirmed against the original published p.651 and all three pages of the authors’ erratum. Independently, G=G_m has flag-component map Z→0 for the trivial adjoint group, so automatic injectivity is false even when the characteristic condition holds. The componentwise comparison survives. The semisimple restriction on the erratum’s kernel formula is retained. |
| E14 | Confirmed | Confirmed against original published p.657 and erratum Proposition 0.0.2. Independently checked the two diagonal GL2 representatives: permutation conjugation interchanges them, but torus σ-conjugation preserves each valuation. The basic restriction belongs to Levi-class uniqueness, not the one-way obstruction; He21 explicitly says so in its footnote. |
| E15 | Rejected | Rejected. The published p.13 heading and v1 p.12 use generic argument names (J,w,δ), as in the cited literature. The definition below specializes the names to (J,x,σ). A heading with dummy variables does not assert that the conjugator equals the tested element or that a different automorphism is used. Harmonizing the names is optional editing, not a mathematical misprint. E2 is a different, actual substitution inside an assertion. |
| E16 | Confirmed | Confirmed in the published p.4 image and v1 p.4. The field and normalizer points are defined with F-breve; no local field L is introduced. The later L-action cannot provide that missing field definition. This is a harmless notation slip. |
| E17 | Confirmed | Confirmed directly in the published H14 p.400 image, not merely extracted text. The immediately preceding twisted step ends with y s_{δ(i)}; the induction display drops δ. HZZ’s corresponding branch ends with yσ(s). The correction is needed for nontrivial twists and does not contradict Proposition 11.6. |

## Reproducible mathematical checks

The report retains the explicit matrices and affine maps, so the finite
checks can be repeated without trusting a source-issue description. An
independent scratch script generated the six A2 Weyl elements by breadth
first search, recorded reduced lengths, computed the Demazure product,
and verified the parabolic representative used in E1. With translations
acting by minus the coweight, the input root intervals are
`(-2,-1),(1,2),(0,1)`; the seed intervals are `(1,2),(-1,0),(1,2)`.
The negative base alcove and critical-strip convention are those printed
in H21. The script also checked the E2 wrong conjugator, the E6 shrunken
input and fractional output `(8/3,7/3)` in coroot coordinates, and the D4
distinction between simple-coroot and positive-coroot sums.

For the order argument it tested all 26,798 ordered pairs of feasible A2
coweights obtained with λ-coordinates 0 through 3, λ′=(1,2), and
coroot-difference coordinates 0 through 8. Their componentwise lower bounds
remain dominant. This is a diagnostic for the calculation, not the proof
of E5: the general proof uses the negative off-diagonal Cartan pairings
for the minimum and the finite lower-interval bound by ρ, as written in
the report. Nonempty feasibility follows from adding a sufficiently large
integral multiple of the sum of all positive coroots.

The G_m component counterexample for E13 and GL2 valuation counterexample
for E14 were checked directly. The later HZZ proof was read for all four
H14 slips. It is positive correction evidence, not a formal H14 erratum.
Its adjoint/nonzero-translation hypotheses are not silently exported to
every H21 case. E1 and E6 remain limitations of the written justification;
no counterexample to H21's main theorem or full replacement proof is claimed.

The excluded allegations were also reconsidered: E7's generic point cannot
belong to any proper closed subset of its irreducible scheme; HY explicitly
defines twisted-coset support by saturation (E12); BS pp.1–2 explicitly
discuss the usual equal-characteristic Grassmannian (E8). The focus of BS
on Witt-vector geometry does not prove that the word “equal” in H21 was
a misprint for “mixed”. No extra error is registered on those grounds.

## Correction searches and scope

Fresh searches covered the [H21 published article](https://doi.org/10.1017/fmp.2021.10),
the [H14 journal record](https://annals.math.princeton.edu/2014/179-1/p06),
their [arXiv](https://arxiv.org/abs/2001.03325)
[histories](https://arxiv.org/abs/1201.4901), the
[author's selected-publications page](https://hkumath.hku.hk/~xuhuahe/selected.html),
and title queries with erratum/corrigendum. H21's history has v1; H14 has
v1 and v2. The two successfully fetched Crossref records
([H21](https://api.crossref.org/works/10.1017/fmp.2021.10),
[H14](https://api.crossref.org/works/10.4007/annals.2014.179.1.6))
have no update-to entry and no correction relation. No formal correction
for either paper was located. This is a bounded search, not a novelty
guarantee. The original worker's unsuccessful Crossref requests are not
being treated as evidence; these were fresh successful requests.

The [GHN history](https://arxiv.org/abs/1211.3784) and the authors' separately
posted erratum were checked. E13 and E14 stay explicitly known corrections.
E9–E11 and E17 stay explicitly linked to the later HZZ reformulation.
No author contact occurred.

## Validation and completion boundary

The errata validator, the four-deliverable intake path check, and
`git diff --check` pass. The exact SymPy diagnostic passes. No Lean file
is required or changed, and no Lean compilation or formalization is
claimed. This completes the independent errata review; the broader
extraction, library coverage and proof closure are separate jobs.
