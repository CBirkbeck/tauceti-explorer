# Errata: Bresciani, strong birationality assumptions

Independent review by Codex (`codex-7e92bd`), 23 September 2026, for `REV-ERRATA-PAPER-BRESCIANI-24`.

Seven findings are confirmed in the versions specified below. E1–E3 preserve the original errata identifiers; E4–E7 add findings from the later extraction, checked independently. E3 also corrects a theorem-part citation and E7 adds an adjacent action-codomain slip.

The six main-paper findings were collated against both [arXiv v3](https://arxiv.org/pdf/2108.13397v3) and the [final Inventiones article](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), volume 235 (2024), 129–150. E7 concerns a cited dependency and is restricted to its [arXiv v2](https://arxiv.org/pdf/1904.00789v2); its final publication was inaccessible.

The most consequential finding is E2: a false universal claim about cuspidality leaves a parabolic reduction unjustified. Its counterexample is geometric, so it does **not** disprove Theorem A. The review supplies no complete repair for that reduction. E3 and E4 are repairable proof gaps; the other findings are misprints whose intended mathematics survives.

## Findings

### E1: misprint — affects nothing

**Locator:** §2, the two base-change citations: published pp.133 and 135, reference [6]; arXiv 2108.13397v3 pp.4 and 5, reference [Bre21b]. Both versions directly read on 23 September 2026.

**Printed:** [Bre21b, Proposition A.18] (v3); [6, Proposition A.18] (published).

**Correction or missing step:** Replace A.18 by A.23 in both citations.

**Verification:** In the cited published Some implications between Grothendieck’s anabelian conjectures, Algebr. Geom. 8 (2021), Proposition A.18 on p.262 covers algebraic separable extensions (finite, or with X concentrated). Proposition A.23 on p.264 covers every field extension in characteristic zero for geometrically connected concentrated X. The smooth finite-type curves here satisfy those hypotheses, and the applications include transcendental base change. Both propositions and the proof of A.23 were read at https://algebraicgeometry.nl/2021-2/2021-2-005.pdf, SHA-256 768ca87a4659e905b2ae938db90a8224569de1776de6bc6aff05897a39372908. This is the extraction’s item 26.

**Independent verdict:** confirmed. Confirmed against both versions and the cited propositions. Corrected the original locator: the first v3 occurrence is p.4, not p.5. The needed theorem exists with the stated hypotheses, so this is a reference misprint affecting nothing.

### E2: error — affects a stated result

**Locator:** §4, paragraph after Corollary 15: published p.141; arXiv 2108.13397v3 p.11. Consequent reductions: Lemma 16 p.142, Definition 18 paragraph p.144, Theorem A proof p.146 (published). Both versions directly read.

**Printed:** “every Galois section of X is cuspidal” (for affine parabolic X).

**Correction or missing step:** Delete this universal assertion. In the split-boundary cases A¹ and G_m the usual cuspidal description applies, but a nonsplit degree-two boundary must be treated separately. To justify the subsequent use of Lemma 16 and the reduction through Proposition 22, supply a direct argument for t-birationally liftable sections on the remaining parabolic curves, or a separate reduction covering them. Taking the identity map in Definition 18 only proves t-b.l. implies quasi-t-b.l. when X is non-parabolic. This review records the missing argument; it does not claim to supply a complete repair in arbitrary transcendence degree.

**Verification:** Let k=Q and X=P¹_Q minus the degree-two closed point cut out by T²−2. Then X is smooth affine of genus zero and its boundary has degree two, so it is parabolic by the paper’s definition. The point 0 lies in X(Q) and induces a geometric Galois section. There is no rational boundary point, hence no cuspidal section by the definition on published p.129. The section at 0 is also t-b.l.: after extending to Q(t), the local parameter at 0 supplies the usual birational lift. Thus even restricting the printed cuspidality assertion to t-b.l. sections does not fix it. Schmidt, Homotopy Rational Points of Brauer-Severi Varieties, arXiv 1503.08108v1, Theorem A p.2, provides splitting/existence of rational points for the relevant open variety; it does not turn a degree-two boundary into rational cusps. Lemma 16 assumes away the parabolic case, and the start of Theorem A uses Proposition 22 via quasi-t-b.l. The example is geometric and therefore does not contradict Theorem A. The false unnumbered universal assertion is itself a stated result; the downstream issue is a missing reduction, not a demonstrated false main theorem.

**Independent verdict:** confirmed. Confirmed by the nonsplit-boundary counterexample and by reading the dependent reductions in the final article. Changed affects from the proof to a stated result because the printed universal cuspidality claim is false. Explicitly distinguished that false claim from Theorem A and left the unproved parabolic reduction visible. Schmidt’s actual theorem does not prove the printed sentence.

### E3: gap — affects the proof

**Locator:** Lemma 26 proof: published p.148, reference [19, Theorem 17 (2)]; arXiv 2108.13397v3 p.17, [Sti12, Theorem 17 (2)]. Both versions directly read.

**Printed:** “by hypothesis it is cuspidal”; later, ι_U(s) ∈ P_{U,x} for every U ⊂ X.

**Correction or missing step:** First use the hypothesis that each image is geometric or cuspidal. On the hyperbolic X, it determines a unique associated rational point x of the smooth completion, using geometric-section injectivity together with Stix Theorem 17(1) and (3). Compatibility implies that the associated point for every smaller open is the same x. Now restrict to the cofinal family U⊂X with x∉U: only on that family are all images cuspidal at x. Compute both inverse limits over this family to obtain the birational cuspidal section at x. Cite Theorem 17(1) for cusp uniqueness and (3) for disjointness; (2) concerns injectivity of a packet map and is not the uniqueness statement.

**Verification:** If x lies inside X, an open U containing x receives the geometric section at x, not a section in a cuspidal packet indexed by x. Removing x is cofinal among opens, so it does not change the function-field inverse limit. Once x is outside U, disjointness of geometric and cuspidal sections and uniqueness of the associated point force the image to lie in P_{U,x}. The compatibility maps for these packets are the ones already used by the printed inverse-limit argument. Stix, On cuspidal sections of algebraic fundamental groups, Theorem 17 and Remark 18, author PDF p.8, https://www.math.uni-frankfurt.de/~stix/research/preprints/STIXcuspsec20120802homepage.pdf, were directly read. Its injectivity hypothesis holds over finitely generated extensions of Q and their finite extensions: rational points of abelian varieties are finitely generated, hence have no nonzero divisible subgroup; the standard Abel–Jacobi injectivity argument and finite étale neighborhoods give the corresponding geometric-point uniqueness on a hyperbolic curve. The original finding missed the adjacent incorrect theorem-part citation.

**Independent verdict:** confirmed. Confirmed the geometric-versus-cuspidal mismatch in both versions. Checked the cofinal-family repair and added the adjacent correction from Stix 17(2) to the actual uniqueness/disjointness statements 17(1),(3). The lemma’s conclusion survives; the printed proof requires this repair.

### E4: gap — affects the proof

**Locator:** Lemma 8 proof: published p.138; arXiv 2108.13397v3 p.9. Both directly read.

**Printed:** “canonical identification” Π_X/k^ab = Π_J/k.

**Correction or missing step:** Use the generalized Albanese torsor P under the semiabelian Jacobian J. The Albanese morphism gives Π_X/k^ab ≃ Π_P/k. The object s=γ(*) supplies a neutralization of this gerbe, giving a chosen-object equivalence Π_P/k ≃ B_k TJ. Identify Π_J/k with B_k TJ using the identity of J. Make the quotient map to B_k TA compatible with these chosen objects before reading it as a homomorphism of Tate modules.

**Verification:** Geometrically, the generalized Albanese map identifies the abelianized fundamental group with TJ; the torsor construction descends that comparison to the banded gerbe Π_P/k. Equality of bands alone does not identify an arbitrary gerbe with the neutral gerbe Π_J/k. Here no extra rational point of X or P is needed: γ maps the preferred object of B_k Zhat(1) to an object of Π_X/k^ab, and any gerbe banded by the commutative group TJ becomes B_k TJ after choosing such an object. Thus the missing choice/descent step is available within the hypotheses. Equivalences preserve isomorphism classes and the finite-image hypothesis; the weight and torus argument can then proceed as written. The following sentence of the source already mentions the images of the preferred object, so this is a small repairable gap in the claimed canonical comparison, not an obstruction to Lemma 8. Added from the later extraction; independently checked here.

**Independent verdict:** confirmed. Confirmed in the precise sense of a missing torsor/choice step. The source’s next sentence contains the object needed to repair it; recorded that fact to avoid overstating the gap. Verified the band comparison and neutralization and that no rational point of the Albanese torsor is being inferred.

### E5: misprint — affects nothing

**Locator:** Lemma 9 proof: published p.140; arXiv 2108.13397v3 p.10, polynomial lift and finite étale extension paragraph. Both directly read.

**Printed:** “any lifting” q ∈ R[t] of q̄; R′ = R[t]/(q).

**Correction or missing step:** Choose q̄ monic and q a monic lift of the same degree. Write z=f(p) for the closed point of A¹_k occurring here, and use q̄ to present k(z); this avoids confusing it with the original point p of X_k.

**Verification:** For R=Q[u]_(u), q̄=T and q=uT²+T, reduction modulo u is indeed q̄. But T and uT+1 are comaximal, since (uT+1)−uT=1, so R[T]/(q) ≃ R×R[1/u] = R×Q(u), which is not finite over R and has more than one maximal ideal. In contrast, a monic lift of the same degree gives a finite free R-algebra, and separability of q̄ makes its discriminant a unit. It is therefore finite étale; its special fiber is the field k(z), so it is local, and an étale local algebra over a DVR is a DVR. This is exactly the extension needed for the curve through z, whose inverse image has a component through the original p. The intended choice is clear and leaves the lemma unchanged. Added from the later extraction; the polynomial counterexample and the corrected construction were independently checked.

**Independent verdict:** confirmed. Confirmed the explicit counterexample and the finite-free, étale, local repair. Retained misprint/affects nothing: the evident monic lift supplies the intended construction without changing Lemma 9. Clarified that the residue field in the polynomial step is that of f(p).

### E6: misprint — affects nothing

**Locator:** §6 opening paragraph: published p.144, [20, Theorem B]; arXiv 2108.13397v3 p.14, [Sti13, Theorem B]. Both directly read.

**Printed:** [20, Theorem B] (published); [Sti13, Theorem B] (v3).

**Correction or missing step:** Replace with [21, Theorem B] (published), respectively [Sti15, Theorem B] (v3): Stix, On the birational section conjecture with local conditions, Invent. Math. 199 (2015), 239–265.

**Verification:** The statement used is the density-one integrality alternative for birationally liftable sections of hyperbolic curves over number fields. It is Theorem B of Stix’s local-conditions paper, read on p.1 of the 27 February 2014 author PDF linked by his publication list: https://www.math.uni-frankfurt.de/~stix/research/preprints/STIX-birSCoverQthmAB20140227.pdf. The proof of Lemma 16 in Bresciani, published p.142, already cites that paper correctly as [21]. Reference [20] is the 2013 book. Added from the later extraction and verified against the actual supplier statement.

**Independent verdict:** confirmed. Confirmed by reading Stix’s Theorem B and comparing the final bibliography and the correct citation in Lemma 16. This is only a citation correction; it does not remove E2’s parabolic scope issue.

### E7: misprint — affects nothing

**Locator:** Cited dependency: Bresciani, Essential dimension and pro-finite group schemes, arXiv 1904.00789v2, Lemma 5.8 proof, pp.19–20. Findings asserted only for this directly read author version; the final Annali version was not obtained.

**Printed:** “banded by A” (p.20); ρ : A × A₁ → A (p.19).

**Correction or missing step:** The last band is TA, the full Tate module, as in the lemma statement and preceding sentence. The action has codomain A₁: ρ : A × A₁ → A₁.

**Verification:** The construction expresses the gerbe as the inverse limit of gerbes banded by A[n]; its band is lim_n A[n]=TA. A itself is not the resulting profinite band. The displayed torsor trivialization (ρ,p₂): A×A₁ → A₁×A₁ also forces the action’s codomain to be A₁. Both repairs follow from the same proof and leave its mathematical assertion intact. The band slip was in the later extraction; the adjacent action-codomain slip was added during this review.

**Independent verdict:** confirmed. Confirmed both slips directly in the named preprint, including the adjacent action target omitted by the extraction. Restricted the verdict to arXiv v2; the inaccessible final publication is not certified as containing either slip.

## Correction searches and provenance

On 23 September 2026 I checked the main paper’s arXiv history, publisher page, Crossref update and relation fields, author institutional page and title/erratum searches. No correction was located. A bounded check of Pop’s [2026 follow-up](https://arxiv.org/pdf/2604.26131v1)—introductory references and text searches—found no correction of these passages. It does discuss Bresciani; the earlier errata’s unqualified assertion that it makes no comments has been removed.

For E7, the journal PDF led to a subscription page, and the institutional accepted manuscript returned HTTP 403. The failure to obtain them is an access limitation, not evidence that the final article contains the preprint slips. All newness claims mean no correction was found in the listed checks, not that none exists.

The JSON contains the exact public URLs, SHA-256 hashes of the two main versions and E7’s version, and the search scope for every finding. Additional directly read suppliers are [Bresciani’s anabelian appendix](https://algebraicgeometry.nl/2021-2/2021-2-005.pdf), [Schmidt’s Theorem A](https://arxiv.org/pdf/1503.08108v1), [Stix’s cuspidal Theorem 17](https://www.math.uni-frankfurt.de/~stix/research/preprints/STIXcuspsec20120802homepage.pdf), and [Stix’s density Theorem B](https://www.math.uni-frankfurt.de/~stix/research/preprints/STIX-birSCoverQthmAB20140227.pdf). Source downloads remain outside the repository.
