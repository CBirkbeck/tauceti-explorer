# Review: PAPER-CESNAVICIUS-21 (Česnavičius, Macaulayfication of Noetherian schemes)

Job `REV-PAPER-CESNAVICIUS-21` (issue #2185), by Claude Code, session `cc-38267a`, 24 September 2026. The extraction was written by Claude Code, session cc-7b31c4. That session's own review (#2320) was closed by the maintainer as not independent; I did neither the extraction nor that review, and did not use its branch. **Verdict: accept**, after the corrections below, which were made in place. All six routes are accepted as corrected: three were rewritten, and three are new.

## What was read

- **The three files of the extraction**, with their SHA-256 sums re-checked:
  - the arXiv e-print of 1810.04493v2 (8704c071…: macaulayfication.tex and bibliography.ltb);
  - the compiled arXiv PDF (a07d62e6…);
  - the author's copy of the published version (55ded201…).

  Page numbers below are those of the author's copy; they agree with the arXiv PDF.
- **Method.** Three checkers:
  - C1 took §§1–2 and the recorded mistakes E1–E3;
  - C2 took §§3–5 and the bibliography;
  - C3 took the status of every item and every route. It worked from `data/atlas.json`, the proposed roadmaps in `research/blueprint/roadmaps/`, the accepted restructurings RS-08 and RS-25, the library audits (AUDIT-01, -17, -18) and the other extractions and their reviews.

  Each checker compared items with the TeX and with page renders of both PDFs and opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474. I re-read at the TeX every new mistake and every changed locator, checked the counterexamples of E5 and E9 by hand, and verified every declaration the corrected record cites against a declaration index built from the pinned trees.
- **Not read:** the cited books and papers themselves (EGA, Kawasaki 2000, Ferrand–Raynaud, Stacks 0BK3). Items that depend on their exact hypotheses say so (items 67 and 68).

## Items

61 items became **81 (3 library, 5 planned, 73 missing)**. Each changed item's note records the change.

### Status corrections

- **13, the Nagata compactification: missing → planned** in AdicCoefficientsAndComparisons L2. L2 plans "the nonnoetherian Nagata statement", and the accepted PAPER-BOXER-PILLONI-26/nagata-compactification is planned there. Route 3's reason had cited only R09.7d and L4.
- **17 was split.**
  - Blowing up became item 62, planned in Tau Ceti StableReduction Layer 4 (Rees algebra, universal property, projectivity, flat base change, charts) and Layer 2 (finitely generated relative Proj, by RS-25). The extraction had cited Algebraic moduli R09.7a, which plans only *smooth* base change inside a characteristic-zero resolution roadmap; the paper uses flat base change (Stacks 0805).
  - The rest is library: ringKrullDim, ringKrullDim_stalk_eq_coheight, Order.height/coheight, Ideal.height, Submodule.torsionBy/torsionBySet, AdicCompletion. The note warns that Mathlib's coheight is the paper's height, and that Submodule.colon is an ideal, not M' :_M 𝔯.
- **38, local cohomology, was narrowed** to what Mathlib has: the colimit of Ext and its dependence on the radical (LocalCohomology.lean:175, 180, 229, 263). The Čech, derived-functor, spectral-sequence and base-change calculus the proofs use is item 76, missing, which Mathlib's own "Future work" list says is not there. The item had cited idealPowersToSelfLERadical, which is only the comparison functor; the isomorphism is isoSelfLERadical.

### Disagreements between checkers, and how I settled them

- **1 and 19 (excellence, universal catenarity).** C3 proposed "planned in R03.3". I kept them **missing on route 1**, as C1 proposed.
  - R03.3's text says to *state catenarity and excellence as hypotheses* for local rings.
  - The accepted extractions that need the ring-level notions (PAPER-BOCKLE-IYENGAR-PASKUNAS-23/028 and /088, PAPER-PASKUNAS-QUAST-26/76) record them as missing sources of R03.3, not as planned.
  - These items are scheme-level and include theorems no layer plans. The openness of Reg(X) for quasi-excellent X is one: ModularCurves 4D plans it only in finite type over an excellent base. Another is the universal catenarity of closed subschemes of quasi-Cohen–Macaulay schemes.

  The notes say what route 1 imports from R03.3.
- **Kollár's criterion and EGA I 9.4.7.** C1 put both on route 1. C2 put 9.4.7 on the old route 3 (SF.0). C3 proposed re-using route 3 for Kollár at SF.4. I followed C3 and C2.
  - Route 3 now sources SF.0 with the extension of coherent submodules and closed subschemes (item 71).
  - It sources SF.4 with Kollár's criterion (item 67), beside the SGA 2 VIII 2.3 criteria that the accepted PAPER-CESNAVICIUS-19 route 4 put there. The paper cites SGA 2 VIII 2.3 as the earlier result.
- **The dualizing-complex facts of §3.5.** C2 proposed appending them to item 39; C3 proposed a new item on route 1. I split them by the notion they use:
  - item 80 (existence over complete local rings, localisation, the Cohen–Macaulay criteria) goes to AS.1;
  - item 81 (rings with a dualizing complex are CM-excellent) stays on route 1, beside the definition of CM-excellence.
- **Numbering.** C1's and C2's proposed new items collided at 62–67. The final numbers are 62–83; duplicates between checkers were merged: EGA I 9.4.7 appeared in both reports, and local duality and the injective hull appeared in C2's and C3's.

### Other corrections

**Statements.**

- **12** now carries E1's "divisor in X̄".
- **16**'s Cohen–Macaulay clause is quantified over Supp(𝓜) (E4). Its note was wrong: the "(S_n)-loci item" only states openness. It now says that R03.3 plans the Serre conditions (as for PAPER-HACON-WITASZEK-23/cm-depth) and that only the sheaf form is added. Module.support, Module.annihilator, associatedPrimes and Rees's theorem are cited.
- **43** copied the misprint E5, and **45**(iii) copied E6. Both are corrected. 45 also records the paper's list of Kawasaki's misprints, which a formaliser reading Kaw00 needs.
- **49** (the proof of Theorem 3.14) was rewritten from TeX ll. 1536–1705:
  - I_s, R', M' and i are defined;
  - the reduction through Proposition 3.11(iii) is included;
  - the Goto–Yamagishi equalities, which the proof never cites, are dropped.
- **55** (the construction of Proposition 4.4) defines ω^•_{X_m}, 𝓘_{𝓜,m}, j_{m,x} and m_x. It states the ideal membership that Definition 3.1(ii) needs, with the repair of E9.
- **58** has the step Z ⊂ Y_{R/𝔪^n}, which is why Z descends to Y, and the flat base change of blowups (Stacks 0805).

**Splits.**

- **20**: Ratliff's theorem became item 63.
- **21**: part (b) became item 64.
- **29**: the final clause became item 65, where E3 attaches.
- **34**: secant sequences became item 83, in R03.3 with systems of parameters.

**Locators.**

- **21**: HIO 18.20, 18.26.
- **22**: EGA IV₂ 6.4.2.
- **29**: pp. 7–8, with its sources.
- **40**: local duality, Stacks 0A7Z, 0A7U.
- **45**: Kaw00 2.9–3.3.
- **51**: Heinrich, not Heitmann.
- **53**: GLL, *Hypersurfaces in projective schemes and a moving lemma*, Duke 2015, not *The index of an algebraic variety*.

**Notes.**

- 1, 2 (an open conjecture: state it, plan no proof), 18 (Rees's theorem), 19, 25 (finite normalisation in A0-extension; Mathlib's normalization), 35 (the three supportDim lemmas of KrullDimension/Regular.lean), 39 and 52 (AS.1 ownership), 47 (strict transforms of schemes and modules come from Layer 4 and L5).

**Removed.** Items 14 (the §1.12 literature survey) and 15 (the §1.13 sketch) are prose, not definitions or theorems. Their content is in items 54, 55, 57 and 58 and in route 1's brief. Both checkers of §1 said so.

### New items

The twenty-two new items (62–83) are:

- **the splits above** (62, 63, 64, 65, 83) and the local cohomology calculus (76);
- **inputs the proofs use and the extraction did not list:**
  - catenary (S₂) local rings are equidimensional, EGA IV₂ 5.10.9 (66);
  - Kollár's criterion (67);
  - Ferrand–Raynaud formal patching (68);
  - Zariski's main theorem in the finite form used (69);
  - the (S₂) property of j_* (70);
  - extension of coherent submodules (71);
  - (S_n) along flat maps (72);
  - Grothendieck's depth criterion (77);
  - the injective hull and Matlis facts (78);
  - local duality (79);
  - the §3.5 existence and Cohen–Macaulay criteria (80, 81);
  - Zariski's connectedness theorem (82);
- **three notions the paper uses without defining them:**
  - divisors: planned in JacobianChallenge Layer C, whose effective Cartier divisors ModularCurves 0A reuses (73);
  - birational morphisms, built on Mathlib's PartialIso (74);
  - schematic images: Mathlib's Scheme.Hom.image, with the compatibilities planned in L2 (75).

## Routes

1. **MacaulayficationOfNoetherianSchemes (Part II of SchemeAndStackFoundations): accept as corrected.**
   - The direction is right: nothing plans any of its targets.
   - The brief paraphrased the final theorems. It now states Theorems 1.6 and 5.3, Remark 5.4, Corollaries 1.8, 1.10 and 1.11 (with X̄) and Proposition 5.5 as printed.
   - It names every import by title and id, and replaces R09.7a by StableReduction Layers 4 and 2.
   - Its reason was wrong in two places, and both are corrected. "Nothing in the atlas defines quasi-excellence or catenarity" is untrue of R03.3. The roadmap has four accepted Part IIs, not two.
   - 45 items.
2. **KawasakiCohenMacaulayBlowingUps (Part II of DeformationAndDerivedPatchingAlgebra): accept as narrowed.** It was LocalCohomologyAndDualizingComplexes.
   - Local cohomology beyond Mathlib, secant sequences and systems of parameters belong to R03.3, and dualizing complexes to AS.1. Accepted routes of PAPER-ANDRE-18-B, PAPER-BHATT-ETAL-23 and PAPER-HACON-WITASZEK-23 already put them there.
   - The reason's claim that the atlas has only perverse-sheaf dualizing complexes was false.
   - The Part II keeps what nothing plans:
     - CM-secant sequences;
     - Schenzel's bound;
     - the annihilator identity and Lemma 3.6;
     - d-sequences;
     - Proposition 3.11;
     - module blowups;
     - Theorem 3.14.
   - 14 items. The brief states Theorem 3.14 exactly and names E5–E8 for the design job.
3. **Source of SchemeAndStackFoundations SF.0 and SF.4: accept as rewritten.** It carries items 71 and 67 (above), in place of the Nagata compactification, which is planned.
4. **Source of DeformationAndDerivedPatchingAlgebra R03.3 (new): accept.** Seven items: 35, 66, 72, 76, 77, 78, 83.
5. **Source of AnalyticStacks AS.1 (new): accept.** Four items: 39, 52, 79, 80.
   - This follows the accepted routes 5 of PAPER-HACON-WITASZEK-23 and PAPER-BHATT-ETAL-23. The rejected route 3 of PAPER-IYENGAR-KHARE-MANNING-24 had put local dualizing complexes in R03.3.
   - AS.1 sits on AS.0's ∞-categorical formalism, so it is a heavy home for the Noetherian ring case. If the maintainer moves them, these items and the accepted ones should move together. The route's reason says so.
6. **SchemeAndStackFoundationsPartIIArithmeticPresentation (Part II, reused): accept.** One item, 53: the GLL avoidance lemma is the Noetherian projective case of PAPER-CESNAVICIUS-22/avoidance.
   - PAPER-CESNAVICIUS-22 route 7 proposed this Part II. That route is rejected pending revision, although its review found the direction justified.
   - The accepted PAPER-BHATT-ETAL-23 route 13 reuses the id.
   - The route copies the title, area, imports and brief of the accepted PAPER-BHATT-ETAL-23 route 13 and adds one sentence.
   - make_queue.py keeps one brief per shared design id, and the later paper in papers.json wins. This paper (index 212) comes after BHATT-ETAL-23 (191) and CESNAVICIUS-22 (164), so a shorter brief would silently replace theirs.

Every missing item is taken by exactly one route (check_paper).

## Mistakes in the paper

I looked for existing corrections in three places:
- the arXiv abstract page, which lists v1 and v2 ("final version") and no erratum;
- the author's publications page, which lists no corrigendum;
- a word-by-word comparison of the published and arXiv texts, which are the same.

**Recorded mistakes:**

- **E1** (Corollary 1.11, "divisor in X"): **confirmed.** The renders of p. 3 of both PDFs and TeX l. 855 agree.
- **E2** ("ificaiton", p. 4): **confirmed.**
- **E3** (the final clause of Lemma 2.11 is never proved): **confirmed.**
  - The locator was wrong: the lemma and its proof are on pp. 7–8, not 8–9.
  - The correction now covers the clause's use in the last sentence of the proof of Theorem 2.13, where checking its hypothesis is also left implicit. X̃ is finite over a complete local base and (S₂), so its local rings over the closed point are complete, hence catenary, hence equidimensional by EGA IV₂ 5.10.9. Their punctured spectra of dimension ≥ 2 therefore have no isolated points.

**New mistakes, all confirmed at the TeX:**

- **E4** (misprint, §1.14, p. 4): "depth(𝓜_x) = dim(Supp(𝓜_x)) for all x ∈ X" should be "for all x ∈ Supp(𝓜)". At x ∉ Supp(𝓜) the depth is +∞ and the dimension is −∞.
- **E5** (misprint, Remark 3.9, p. 12): "the r_i-torsion and the r_ir_{i'}-torsion … agree" should be "the r_{i'}-torsion". This is Huneke's condition.
  - The corrected form follows from Definition 3.8.
  - The printed form fails for M = R/(u) ⊕ R over k[[t,u]] with the d-sequence (t, u). I checked the example by hand.
- **E6** (misprint, Proposition 3.11(iii), p. 13): "r_{s'}" should be "r'_{s'}", as the use in the proof of Theorem 3.14 shows (s' = 1, TeX l. 1541).
- **E7** (misprint, proof of Theorem 3.14, p. 15): "I_s := ∏_{i=1}^s (r_1,…,r_s)" should be "(r_1,…,r_i)". This matches Proposition 3.11's I_j (TeX l. 1421) and the blowup identity the proof uses.
- **E8** (misprint, (3.14.10), p. 16): "r_aT − r_b" should be "r_bT − r_a", the map of (3.14.7). The printed claim is also true, so nothing is lost.
- **E9** (error, affects the proof, (4.4.1), p. 19).
  - The problem: identifying 𝓘_{𝓜,m} with its preimage in O_X does not make its stalk the product of the O_{X,x}-annihilators. The preimage of a product is the product of the preimages plus K = (j_{1,x},…,j_{m,x}), and can be strictly larger.
  - A counterexample, checked by hand: k[[s,t,u,v,z]]/((s,t) ∩ (u,v)) with K = (z) and the module (A/K) ⊕ k. There the product is 𝔪², but the preimage is 𝔪² + (z).
  - The effect: read literally, Lemma 4.3 then gives only j_{m+1,x} ∈ (product) + K, not the membership that Definition 3.1(ii) requires.
  - The repair is one line: apply Lemma 4.3 to V(product of the O_X-annihilators), or change j_{m+1,x} modulo K, which alters none of the ideals the proof uses.
  - Proposition 4.4 stands.

The checker of §§3–5 had classed E9 as a gap. I recorded it as an error, because the displayed equality is false as written.

## Prerequisites

Corrected against the paper's bibliography:

- **Gabber–Liu–Lorenzini:** the extraction cited the wrong paper. It is now *Hypersurfaces in projective schemes and a moving lemma*, Duke Math. J. 164 (2015), doi 10.1215/00127094-2877293.
- **Deligne:** the DOI 10.1215/0023608X-2010-001 resolves to a different paper. It is now …-009.
- **Kollár:** the extraction cited *Variants of normality*, which the paper does not cite. It is now *Coherence of local and global hulls*, Methods Appl. Anal. 24 (2017), Thm. 2.
- **§1.12 names:** "Seok-Jin Hong" and "Marcel Morales" are Morten Oskar Honsen (MIT thesis, 2004) and Francesco Mordasini (Manuscripta Math. 99, 1999). Heinrich's arXiv:1403.6082 is added.
- **Ogoma:** Japan. J. Math. (N.S.) 6 (1980), not Nagoya Math. J. 77.
- **Cuong:** the link was a site homepage and is replaced by the MathSciNet record.
- **Split entries:** Heitmann's example (Rocky Mountain J. Math. 12, 1982) and Heinrich's J. Commut. Algebra 9 (2017) now have their own entries.
- **Stacks tags:** eight used tags are added to the list.

## For the maintainer

- **Shared design id.** Route 6 shares its design id with PAPER-CESNAVICIUS-22 route 7 (rejected pending revision) and PAPER-BHATT-ETAL-23 route 13 (accepted). This is one of the 66 ids that make_queue.py does not merge (the later paper's brief wins).
- **AS.1 as owner.** The home of Noetherian dualizing complexes is a single decision for items from four papers (HACON-WITASZEK-23, BHATT-ETAL-23, ZAVYALOV-25 and this one).
- **Order of the two Part IIs.** Route 2 must be designed before route 1, which imports Theorem 3.14 and the module blowups from it.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- The result keeps the file's serialisation (indent 1, trailing newline), so the diff shows only the changes.
- No Lean file belongs to this job, and none was compiled.
