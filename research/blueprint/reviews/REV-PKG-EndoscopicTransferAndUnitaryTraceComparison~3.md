# Independent fixing review: Endoscopic transfer and unitary trace comparison (round 3)

Job `REV-PKG-EndoscopicTransferAndUnitaryTraceComparison~3`, issue #9873. Reviewer: Claude, session `claude-IpdOh4`, 15 October 2026. The reviewed revision is the package revision of #9872 / PR #9874, commit `5e8beb34f`. This session wrote none of the three package revisions and did neither earlier package review.

## Verdict: accepted

The one finding left open by the round-2 review, the structured CM realization that §8.15 depended on, is resolved by the revision: the effectivity proof no longer needs a lift that preserves the PEL Lie signature. I checked the new route against the sources and found it correct. With the corrections listed below applied in place, items 1–6 of the job hold and the package is ready for the draft pull request.

## The round-2 finding and the revised route

Round 2 asked for a proof of the structured lift that Shin, *Counting points on Igusa varieties*, Lemma 11.1 (pp. 36–37) takes from Harris–Taylor, or for a direct proof of the paired realization. The revision instead removes the need for that lift. I read the relevant proofs in full:

- **Kottwitz, *Points on some Shimura varieties over finite fields*, §13, pp. 414–418.** Lemma 13.2 first shows that the product of the local characters does not depend on the rational symplectic comparison space or on the compatible polarization. Changing the comparison by a global torus class t changes the character at *every* place, the infinite one included, by −t_v; the infinite character is computed from the comparison space's own positive complex structure. Changing the polarization by a totally positive element changes only the finite characters, since the real torsor class is trivial. Only after this does Kottwitz compute on a CM lift supplied by Tate's theorem. There the prime-to-p terms vanish and the p and ∞ terms are −μ and μ (Lemma 13.1). The CM type of the lift is whatever the lift has, so no Lie signature has to be preserved. §8.14's torus-cancellation paragraph matches this, including the orientation α_v(W′)−α_v(W)=−loc_v(t).
- **Kottwitz §15, Lemma 15.2, pp. 425–428.** This carries out the B-linear version: choose a torus elliptic at ∞ and at the finite places where I₀ is not quasi-split, transfer it by the §14 argument, and pass to the commutant N. Then make the involution on B⊗_F N≅Mat_d(N) the adjoint of a diagonal Hermitian matrix (Hilbert 90 for N over N₀) and reduce to Lemma 13.2 on one CM factor. This is exactly the Morita step §8.14 now describes. The package cited only §§13–14 for it, so I added the Lemma 15.2 locators.
- **Shin §§11–12, pp. 34–41.** Lemma 12.1 reduces the triple invariant to the torus invariant α(N,V;A,λ′) and then makes two changes, of comparison and of polarization, with the same orientation as Kottwitz. Corollary 12.2 repeats this for the auxiliary α and β. §8.15 now applies the torus cancellation directly with W=V, so Lemma 11.1's real-signature condition is not needed. The surjectivity and injectivity steps follow Lemma 12.3 unchanged.
- **Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*, §2.3.** Proposition 2.3.11 (pp. 33–34), Lemma 2.3.13 (pp. 34–35), Corollary 2.3.15 and Remark 2.3.16(3) (p. 36) are where the package says. They support `CMIsogenyLift.pelRealization` as stated:
  - it starts from an existing point of the unramified PEL model;
  - it uses a Q̄-isogeny CM lift and the nonempty T-torsor of T-equivariant isogenies;
  - it takes a rational point after forgetting the polarization;
  - it transports the CM polarization.

  No polarization-preserving rational isogeny is claimed, which matters because that stronger statement can fail in type A_n with n even. The target is no longer an input to §8.15.

**The worked obstruction in §8.14** (p=3, F=Q(i), K=Q(√2), N=Q(ζ₈), E:y²=x³−x) was checked by hand:
- The matrix with rows (0,2),(1,0) squares to 2, and is self-adjoint for diag(1,2).
- The isogeny diag(1,π) changes the F-signature from (1,1) to (2,0).
- The transported √2 is not Rosati-stable for the product principal polarization. Its Rosati image would have to equal z·S_A with z=1/6, which forces π⁻²=−12, but π²=−3.
- The norm-reciprocity contradiction holds: x=N_{K/Q}(a/u) is a local norm from F at every finite place (automatically at 3, where K₃≅F₃ is unramified) but is negative at ∞.

As an independent confirmation via Shimura–Taniyama, the CM types of Q(ζ₈) with F-signature (1,1) reduce to ordinary surfaces at 3. So a supersingular signature-(1,1) A has no characteristic-zero lift with this N-action. I added this as a Check.

**For the maintainer (errata candidate, not acted on here).** The obstruction also shows that Shin's Lemma 11.1, read literally for an arbitrary maximal commutative N⊂End⁰_B(A) together with an integral identification Σ≅A[p^∞], cannot hold: its conclusion fails in this example. Shin applies the lemma only to commutants of tori in the polarized automorphism group, where Kottwitz's route suffices. No errata file was written, since this job does not cover errata.

## Corrections applied in this review

1. **§8.14 and §8.15.** Added Kottwitz §15, Lemma 15.2, pp. 425–428, as the locator for the B-linear Morita reduction (with what it does), and pp. 425–426 for the torus transfer in the effectivity proof. The bibliography entry for Kottwitz 1992 now lists §§13–15 as well as Lemma 9.2 and Lemmas 17.1–17.2.
2. **§8.14 Checks.** Added the CM-type and slope check for N=Q(ζ₈) at p=3 (Tate, Lemma 5, pp. 103–104).
3. **Prerequisite interfaces.** §8.14 now relies on three supplier sections that the interface bullets did not list, so I added them:
   - PELModuli §M4.1 (reciprocity on CM points);
   - AbelianSchemesAndArithmeticModuli §§A5.1–A5.2 and A6.14–A6.15 (Riemann forms, Rosati positivity, ample cone);
   - FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25 (filtered crystalline comparison over O_K, every p).

   All three are lower-tier suppliers: tiers 13, 6 and 10, against tier 14 for this roadmap.
4. **§2.2, twisted a-data.** The README attributed a-data and χ-data on the restricted root system to Kottwitz–Shelstad 2012 (2.2.2). In fact (2.2.2) defines twisted a-data as θ-invariant a-data on the full root system R(T,G). The restricted-root data are Kottwitz–Shelstad 1999, *Foundations*, §1.3, (1.3.10), p. 16. The sentence now attributes each convention to its source and notes that Δ_I^new agrees with Δ_I unless R_res is non-reduced; the bibliography entry gains §1.3.
5. **§6.14, scope of transferability.** The README attached Liu–Tian–Xiao–Zhang–Zhu's transferability statement to the similitude group's places. Their Lemma D.2.2 is about U(V)(F⁺_v) and has three cases:
   - every compact open at split places;
   - sufficiently small ones at the bad set Σ⁺_min ∪ Σ⁺_lr;
   - the hyperspecial subgroup elsewhere.

   The statement and locator now say this.
6. **Locator pages:**
   - Kottwitz's Clay notes §5.9 starts on p. 415, not 417; the GL₂ elliptic germ coefficients are Lemma 5.2 and (5.9.8), (5.9.11), pp. 416–417.
   - Scholze's LLC §12 runs pp. 30–32, not p. 31 (§6.24).
   - Colmez–Dospinescu–Nizioł Proposition 4.8 is on p. 38 only.
   - Liu–Tian–Xiao–Zhang–Zhu Proposition D.2.3 and Appendix D.2 end on p. 372, not 371 (four places).

No target, hypothesis, Check or locator was dropped. Suggested.lean and metadata.toml are unchanged.

## Items 1–6

1. **Upstream form.** The README follows the upstream order:
   - title and **Summary**;
   - scope and ownership, with prerequisites and boundaries;
   - conventions;
   - prerequisite interfaces by supplier;
   - how to read the build;
   - fifteen layers of prose subsections, each with Checks, Examples and Dependencies;
   - downstream consumers and references.

   The italic *Hypotheses.* lead-ins are the form other accepted packages use, such as CrystallineCohomology and PadicDifferentialEquationsAndRigidCohomology.
2. **Fidelity.** All 210 accepted nodes of ET.0, ET.4, ET.5, ET.6 and ET.6a are represented across 211 sections. A title match finds 199 of them directly. The other 11 are:
   - three nodes whose ownership moved to the boundary section in earlier rounds: the generic orbital integral and pseudo-coefficients, now AutomorphicSpectralTheory, and the unramified Lang/Kottwitz-kernel input, now ReductiveGroupsPartII with the integral z-extension in §1.12;
   - eight ET.6/ET.6a nodes renamed to §§10.21, 10.26, 10.30, 12.22, 6.12/6.24, 6.26, 15.4 and 15.3.

   §8.14 and §8.15 state the packet statements and hypotheses verbatim from the plan. The new CMIsogenyLift API is proof support with sources, not an unsupported claim.
3. **Own words.** The revision's additions and mine are in our own words; there are no source passages and no section-by-section summaries.
4. **No process.** A search for packet ids, job and review language, checkpoint, coverage, handoff, G4b, FoundationsAndLibraryIntegration and `UPSTREAM:` finds nothing. "packet" occurs only as L-packet, and "node" only as a nodal curve.
5. **Suggested.lean.** It has 311 lines and ten light real-bodied definitions; there are no sorry'd data, no `True` placeholders and no theory development. `lean-check` exits **0** with **16 warnings, all `declaration uses sorry`**, at the pinned Mathlib `082e2d37e8` and Tau Ceti `f790474`, with 99 GB available. I checked every signature against the prose:
   - `kottwitzSign_gl` gives (n−1)−(r−1)=n−r with 1≤r≤n.
   - The separable characteristic-polynomial criterion is true over any field, and the Jordan-block example is a correct non-example.
   - `kappaSum_rebase` gives κ(d₀)⁻¹ by substituting e=d₀d.
   - The companion matrix has characteristic polynomial Xⁿ+ΣaᵢXⁱ, and the 1×1 and nilpotent 2×2 cases are right.
   - `specialFrobenius_mul_monodromy` gives FN=q⁻¹NF, since the entry q^{−(j+1)} equals q⁻¹q^{−j}. It also holds at q=0 in ℚ.
   - Nilpotence index k, and the `comparisonTrace` examples, are correct.
   - `AcceptableValuations` matches Shin Definition 6.1: decreasing slopes, smaller valuations on earlier blocks.
   - `unitaryComponentCount` matches the dual-centre calculation below and Shin 2011 Lemma 3.1 and Remark 3.2.
6. **metadata.toml.** It is the single line `topic = "math.NT"`, which fits.

## Adversarial pass (independent of the earlier rounds)

| Location | Instance tried | Result |
| --- | --- | --- |
| §8.14 cancellation | A comparison W′ of a different real signature, so t has nonzero real localization | The orientation −loc_v(t) at every place, ∞ included, agrees with Kottwitz Lemma 13.2. Requiring t_∞=0 would wrongly restrict to one signature; the existing Check records this. |
| §8.14 cancellation | A polarization change by a totally positive u, and by a u negative at one real place | The first has trivial real class. The second is not a polarization of the same CM object. Agrees with Kottwitz p. 417. |
| §8.14 obstruction | p=3, Q(ζ₈) CM types | Computed directly (above). Added the Check. |
| §8.14 `.pelRealization` | Type A_n with n even | Only the Q̄-isogeny lift and an unpolarized rational isogeny are used, so the possible failure of the Hasse principle for G^ab does not enter. Correct as stated. |
| §6.5 / Lean `unitaryComponentCount` | r blocks, d=[F⁺:ℚ] | The coinvariants of X_*(G/G^der) contain (Z/2)^r modulo the image of the class (n_i mod 2) when d is odd. This gives 2^r unless d is odd and some block is odd, then 2^{r−1}. For r=1 and n even, ker¹ of the norm-one torus vanishes by the Hasse norm theorem. Both agree with the README. |
| §1.13 | Compact U(2), U(3), U(4); D^× over ℚ_p; quaternion product formula | The signs −1, +1, +1, −1 and product 1 agree with q(U(a,b))=ab. A real-rank shortcut fails at U(3), as the Check says. |
| §2.6 | Γ versus Γ̄ homogeneity, zero orbit, regular orbit | The exponent −dim 𝒪 for Γ follows from Kottwitz (17.11.2) and D(t²X)=t^{2(dim G−rank)}D(X). |
| §2.2 | Twisted a-data under θ | The source convention is corrected (item 4 above). |
| §8.1 | Slopes (1,0) with δ=(1,p) and δ=(p,1); the shift fr^{−sN} | Agrees with Shin Definition 6.1. |
| §12.10 | The bracket of f₁, f₂ | f₁f₂′−f₂f₁′=2AB/g=2f₃, matching CDN p. 38. |
| §§15.2–15.5 | vol(K)=3; α=2, β=3 and r=2; ε=½; JL trivial↔Steinberg | 3; X²−5X+6 and X²−13X+36; ½; −1. All agree. |

## Source checks

Of the 211 sections, the 17 checked by the previous review were excluded and 15 were drawn with seed 9873. Haiku subagents fetched the sources and returned page locations and short quotes; every verdict below is mine, from those quotes and, where needed, the pages themselves.

| Section | Sources and result |
| --- | --- |
| §2.1 | Kottwitz Clay notes §§2, 3, 7 (pp. 403, 406, 421); Waldspurger *tordue* §1.5 (pp. 11–12, the index normalization); Langlands–Shelstad §5.4 (p. 259). All confirmed. |
| §2.2 | Langlands–Shelstad §2.2 (p. 229), §2.5 (p. 235) and Theorem 3.7.A (p. 248); Kottwitz–Shelstad 2012 §§2.1–2.2 and (2.2.2) (PDF pp. 3–4) and §5.1 (PDF p. 12); Kottwitz–Shelstad 1999 §1.3 (p. 16). Confirmed, and the twisted a-data attribution corrected. |
| §2.6 | Clay notes §§5.9, 6, 15–17, 27 and (17.11.2) (p. 465); Waldspurger, *changement de caractéristique*, Théorème 7.2 (p. 62). The §5.9 page is corrected. |
| §5.2 | Mœglin–Waldspurger, Introduction theorem (p. 606) and §II.3 with its corollary (pp. 647–649). Confirmed. |
| §6.14 | Caraiani–Scholze (noncompact, arXiv v2) Lemma 5.4.4 (p. 71) and Remark 5.4.5 (p. 72); LTXZZ Definition D.2.1 and Lemma D.2.2 (p. 369). Confirmed, and the scope corrected. |
| §6.24 | Arthur–Clozel Ch. 3, Definitions 1.1–1.2 through Theorem 5.1 (pp. 199–213), and Ch. 1, Definition 6.1, Theorem 6.2 (p. 51) and Proposition 6.7 (p. 59); Scholze LLC §§12–13. The §12 page is corrected. |
| §6.28 | Caraiani–Scholze noncompact Remark 5.5.4 (p. 74) and Theorem 5.6.1 (p. 75); Shin 2011 Lemma 3.1 (p. 13) and Remark 3.2 (p. 14). Confirmed. |
| §10.2 | Scholze LLC Definitions 2.1–2.2, Proposition 2.3 and Theorem 2.4 (pp. 7–8). Confirmed. |
| §11.3 | Kaletha–Mínguez–Shin–White §1.6.4 and (1.6.3)–(1.6.4) (pp. 86–87); Remark 1.7.2 (p. 89). Confirmed. |
| §12.4 | Dat §3.1 (pp. 15–18); Scholze–Weinstein §7.3 (pp. 71–73). Confirmed. |
| §12.10 | Colmez–Dospinescu–Nizioł Proposition 4.8. Corrected to p. 38; the formulas confirmed. |
| §12.20 | Dat Theorem 4.1.2 (Boyer) (p. 28). With d_ρ=1, degree n−1 has twist \|·\|^{(1−n)/2} and the dual parameter, as stated. |
| §14.3 | Caraiani–Scholze compact Lemma 5.4.2 (p. 740); Caraiani–Scholze noncompact Lemma 5.6.2 and its proof (pp. 75–76). Confirmed. |
| §14.6 | Caraiani–Scholze compact Corollary 5.5.2 and Remark 5.5.3 (p. 743); Caraiani–Scholze noncompact Remark 5.6.3 (p. 76). Confirmed. |
| §15.6 | Caraiani–Scholze noncompact §5.6 (pp. 74–76); LTXZZ C.3 and D.2; Fargues–Scholze Theorem IX.7.4 (p. 338). The D.2 end page is corrected. |

The Imperial and arXiv v2 copies of the noncompact Caraiani–Scholze paper have identical numbering on these pages. Arthur–Clozel is cited by the book's own page numbers.

## Ownership and packets

TauCetiRoadmap `0d144d04` and Tau Ceti `a91d3aaf`, the checkouts used by the round-2 ownership audit, are unchanged. Searches by object (CM lifting, Honda–Tate, CM types, Kottwitz invariants) in the current roadmaps and library find nothing that §8.14's new content duplicates. The new suppliers exist at the cited sections: AbelianSchemesAndArithmeticModuli §§A4, A5.1–A5.2, A6.14–A6.15; PELModuli §§M2, M4.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25.

The ET.6a packet still has the 26 obsolete-prerequisite errors documented by the previous rounds. Packets are outside a package review's edit scope; this is a packet-maintenance item and does not affect the package.

## Verification

- `lean-check` on Suggested.lean: exit 0, 16 `sorry` warnings and nothing else, both before and after the README edits. The Lean file is unchanged.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables: 0 problems.
- `git diff --check`: clean.
- No language server and no Lake build, update or cache command was started; no Lake command ran in the read-only checkouts.

## Public-source receipts (SHA-256, accessed 2026-10-15)

| Source | SHA-256 |
| --- | --- |
| [Kottwitz, Points](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf) | `ae2f2f148d791b6cc1d79d360868182c9abd2e0e5954d5c96df2d94b98570d2b` |
| [Shin, Igusa](https://math.berkeley.edu/~swshin/IgusaVar.pdf) | `022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8` |
| [Kisin–Madapusi Pera–Shin](https://math.berkeley.edu/~swshin/HT.pdf) | `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db` |
| [Kottwitz–Shelstad, Foundations](https://www.numdam.org/item/AST_1999__255__R3_0.pdf) | `1363bde68b000fe9dbd8677e6da5cc65cf28449abb4f026b34dbde8c3068d6f3` |
| [Kottwitz–Shelstad 2012](https://arxiv.org/pdf/1201.5658v1) | `eaa0a8ab1e182e0297dd9b4e46c296fa370060a5f0c2d90136b4d925700a0904` |
| [Kottwitz, Clay notes](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf) | `f57278711bf829491bae0e2fa510ecf0185d378fe8acc6105a7ac73878154e54` |
| [Langlands–Shelstad](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf) | `5e8a1ef64c7e264716ed9f7cbc8781208606d454ea33a9ab890ea70056393516` |
| [Waldspurger, tordue](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf) | `5d4b25c8b67140aad537efaba3fe509b842ea381c4c9d428f63560ac68a3daae` |
| [Waldspurger, changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf) | `17e707c396eeab61417f72e2b936ec7ab91a572c03284937c11a558c759d695b` |
| [Mœglin–Waldspurger](https://www.numdam.org/article/ASENS_1989_4_22_4_605_0.pdf) | `a46e3549d05d2cd39f396ef326840f4484f3935ff3daa17e6339091962de9e94` |
| [Caraiani–Scholze noncompact v2](https://arxiv.org/pdf/1909.01898v2) | `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e` |
| [Caraiani–Scholze noncompact, author copy](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf) | `9c9b723d20f35af25f45c236224fb3a4d72c57379ea54759a3b609f4092d8eb5` |
| [Caraiani–Scholze compact](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| [Shin 2011](https://math.berkeley.edu/~swshin/StableGal.pdf) | `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b` |
| [LTXZZ](https://par.nsf.gov/servlets/purl/10323568) | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| [Arthur–Clozel](https://www.claymath.org/library/cw/arthur/pdf/30.pdf) | `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737` |
| [Scholze LLC](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf) | `11358ca04e158f455a08d59fc31afa3dc324ad816c53eef571d5fa7dbce6f002` |
| [Kaletha–Mínguez–Shin–White](https://arxiv.org/pdf/1409.3731v1) | `0084fd8b65f3b74d0053400f2254b3ff6a0e5a5c8d6debb511eb6fad65a6d5fe` |
| [Dat](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf) | `4973a260e5af4b046652956ad63e95a412fb82873cdecc6bd585c85e1aa4a04d` |
| [Scholze–Weinstein](https://arxiv.org/pdf/1211.6357) | `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d` |
| [Colmez–Dospinescu–Nizioł](https://arxiv.org/pdf/1704.08928) | `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073` |
| [Fargues–Scholze v4](https://arxiv.org/pdf/2102.13459v4) | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
