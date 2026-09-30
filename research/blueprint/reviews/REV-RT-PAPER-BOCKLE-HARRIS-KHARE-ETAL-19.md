# REV-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19

**Complete: fifteen findings confirmed, two rejected (/1 and /13).** Several of the confirmed fixes are corrected below.

- **Job:** Refs #4313.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction (`cc-fb70e5`), its review (`cc-d67081`) and the red team (`cc-f805bf`) were done by other sessions.
- **Verdicts:** in `research/blueprint/redteam/RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Sources:**
- arXiv:1609.03491v2 (SHA-256 ec54cf92…43b9), the version the extraction read, with its LaTeX source.
- The published text, Acta Math. 223 (2019), 1–111. It is open access (intlpress PDF, SHA-256 15c4b966…ba2c), although the extraction says it is not.

**Verifiers.** Three worked in parallel:
- ownership and status: findings 2–5, 7 and 9;
- mathematics: findings 1 and 10–15;
- inputs, the brief, statements and provenance: findings 6, 8, 16 and 17.

The lead verifier independently re-checked the hypothesis behind the two rejections. Every confirmed paper mistake is also in the published Acta text.

## Rejected: /1 and /13 (Theorem 4.10's hypothesis)

The red team read "the centralizer of ρ̄ in Ĝ^ad" as the centralizer of the image of ρ̄ in Ĝ^ad. On that reading, Q₈ ⊂ SL₂ fails the hypothesis through the V₄ that centralizes its image in PGL₂.

The paper means the stabilizer of ρ̄, a tuple of elements of Ĝ, under the conjugation action of Ĝ^ad. That is, Z_Ĝ(ρ̄) = Z_Ĝ scheme-theoretically. The TeX shows this:
- ll. 492 and 509 take X = Ĝ^n, with Ĝ^ad acting by simultaneous conjugation, and ask for a trivial stabilizer of x = (g₁, …, gₙ);
- l. 675 speaks of the centralizer of ρ̄(Γ) in Ĝ^ad_k in the same sense.

Five passages need this reading, including the proofs of Theorem 4.10, Lemma 5.1 and Proposition 10.7(i). The red team's reading would make Proposition 10.7(i) false already for SL₂ with a dihedral parameter. With the paper's meaning, Q₈ satisfies the hypothesis, since Z_{GL₂}(Q₈)/G_m = 1.

Consequences:
- The extraction's sentence (for GL_n, Schur's lemma, given the complete reducibility Theorem 4.10 also assumes) is correct.
- The introduction's "centralizer in Ĝ is the centre" is exactly the hypothesis. Its locator should be Acta p. 4, not p. 3.
- The red team's proposed replacement would itself be wrong: the Borel subgroup of GL₂ has trivial centralizer in PGL₂ but is reducible.

## Ownership and status (confirmed)

**/2 (item 34 duplicates Lafforgue).**
- Proposition 8.10's proof is "follows from [Lafa, Prop. 13.1]" plus the Lemme 10.5 rewriting. Corollary 8.11 is Theorem 4.5 applied mod m, which is Lafforgue's Theorem 13.2 at one maximal ideal.
- The note's two sentences about §3.2 are wrong: §3.2 enters only through Theorem 4.10, in Lemma 8.19.
- **Fix:** keep item 34 missing and route it as a source of GS.5, beside LAFFORGUE-18/41, rather than marking it planned. GS.5's text says nothing about integral or mod-l coefficients. Corollary 8.11 is on Acta p. 59.

**/3 (the reconstruction theorem has three owners).**
- It is planned at IHG.1 (this paper and PASKUNAS-QUAST-26), at LP2/LP3 (LAFFORGUE-18 route 3 and the accepted LP decomposition's FS VIII.3.8 node) and in the draft GS.5 node.
- IHG.1 is the right single owner, and the links it needs create no cycle. The IHG packet already has a GL_n pseudocharacter node, although LAFFORGUE-18/36's note says the word appears nowhere.
- **Fix, three additions:**
  - the owned statement must allow a disconnected H (L-groups);
  - LAFFORGUE-18/37 must be redirected along with /42;
  - IHG.1 needs an input link from the invariant-theory stage.

**/4 (item 21 is not planned by SR.1, SR.2 or SR.4).**
- Nothing in the atlas mentions Iwahori–Hecke algebras or the Bernstein presentation. The finding's fix would create a second owner: the accepted KISIN-PAPPAS-18 Part II, SmoothRepresentationsPartIIParahoricCenters, already owns the Iwahori Bernstein presentation, and HE-21, ZHU-17 and CLOZEL-THORNE-17 merge into it.
- **Right split:**
  - the Bernstein presentation to that Part II;
  - Casselman and Lemma 7.2(i) to SR.2, beside the CALEGARI-GERAGHTY-20 and BCGP-21 routes;
  - Lemma 7.2(ii) to this paper's Part II;
  - Lemma 7.1 to FA.4 and RG2.5.
- The Bernstein presentation is on Acta p. 43.

**/5 (Proposition 8.3 and Lemma 8.8 are neither planned nor routed).**
- Chevalley restriction over ℤ holds, and it is needed over the residue field.
- **Fix:** route Proposition 8.3 to LP3 (route 2), not RG2.5, whose text excludes invariant theory.
- A source route may also name planned items, so "a planned item cannot be routed" overstates the rules.

**/7 (§5.1 is generic).**
- The accepted PASKUNAS-QUAST-26 route already puts G-valued framed functors, their representability and presentation for any Γ at LocalGaloisDeformationRings R08.1.
- **Right fix:** import the framed part from R08.1, and route the unframed Def_ρ̄ and Lemma 5.9 to R04.1/R04.2, or to FAKHRUDDIN-KHARE-PATRIKIS-22's layer (0). Record the owner in both Part II briefs.

**/9 (item 3's root data).** These are in Mathlib: `RootDatum`, `RootPairing.flip`, `RootPairing.IsReduced` and `RootPairing.Base`. Use the exact atlas ids for Tau Ceti ReductiveGroups Layers 6, 7 and 9.

## Inputs, brief, statements, provenance (confirmed)

**/6 (key inputs are neither items nor imports).** The finding is right that none is imported. Where each input stands:
- L. Lafforgue's Théorème VII.6 is planned at GS.6.
- The Weil II bound is exactly DWP.7's statement, so DWP.7 owns it, not DWP.6.
- De Jong's conjecture, Larsen, Snowden–Wiles and Völklein are planned nowhere.

Corrections to the finding:
- **Chin.** Chin's Theorem 4.6 is already at GS.6 through the accepted KISIN-ZHOU-25 route 3. Only Theorems 1.4 and 6.12 and Lemma 6.4 are unplanned.
- **Poitou–Tate.** The function-field route to R02.3/R02.4 covers Propositions 5.11 and 5.19. It does not cover Proposition 11.2, which applies Česnavičius's Cassels–Poitou–Tate to the centre of G, whose order may be divisible by char K. That is flat duality, which nothing plans.
- **Lemma 8.16.** Its Levi input is V. Lafforgue for M, which GS.5 plans. It should be a Part II item depending on GS.5 and items 10 and 32, not a new source of GS.5.

**/8 (the route 1 brief).**
- "For every reductive group" contradicts Theorem 1.1, which is stated for split semisimple G in both v2 and Acta.
- The acceptance tests cannot be met as written. GL_n and tori are outside the theorem, and for PGL_n the Part II gives only a finite extension K′, not K′ = K. The r = 0 test is vacuous rather than impossible.
- One overstatement in the finding: §§6–7 open with split reductive groups. This does not change the verdict.

**/16 (items that differ from the paper).** Confirmed for items 4, 6, 35 and 36, the notes of items 13 and 15, and item 26's locator.
- **Correction:** item 27 copies "split reductive group over K" exactly as v2 and Acta print it, and the slip is harmless. If the item is changed, PROTOCOL §18 requires recording it as a misprint.

**/17 (provenance).**
- The review names the wrong extraction session: the commit is on branch cc-fb70e5-paper-bhkt.
- The false "not open access" claim appears in `readSections` and the .md, and also in all sixteen `searched` fields, which the finding misses.
- R23.1 never mentions function fields.
- Both v2 p. 47 and Acta p. 72 print ρ̄_m with the bar (checked at 250 dpi).
- **Extension:** nine of the twelve published-page locators the review added are off by one or two pages (E4 is on p. 72, E1 on p. 77, E14(a) on p. 89; only E9 and E12 are right). The fixer for /17 should correct them.

## Mathematics (confirmed)

**/10 (Theorem 11.9 never ties π to φ).** Confirmed, and the fix is right. However, `affects` should be "the proof" (of Theorem 11.8), not "a stated result": the printed Theorem 11.9 is true, only weaker than intended.

**/11 (Appendix A: strong regularity).** Every step of the G₂ counterexample checks:
- no root reduces to zero mod 2;
- the Coxeter element w satisfies Ť^w = 1 and w³ = −1;
- y² = x³ − x + 1 over F₃ has Frobenius of order 3 on its 2-torsion;
- the Weil system is irreducible;
- −1 ∈ W fixes Ť[2] pointwise.

The paper's own application, to Coxeter parameters, is unaffected.

**/12 (Theorem 5.13 and l = 2).** Confirmed under the natural reading. One caveat: if a representation assumption in §5.1 were read as standing, it would force l > 2 and close the gap. Theorem 5.14 restates the assumption, which suggests it is not standing.

**/14 (Proposition 5.19 when S ≠ ∅).** Verified with the Poitou–Tate and Greenberg–Wiles counts. All three proposed fixes work.

**/15 (further slips).**
- Drop element (g): π^{G(O_{K_v})} ≠ 0 exactly when π_v^{G(O_{K_v})} ≠ 0, so the paper's notation is fine.
- Elements (a) and (d) are false statements, so their kind should be "error".
- Item 14 does not repeat the false step in (a).

## For the fix job

The medium findings /2–/8, /10 and /11 become FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19. Apply them with the corrections above:
- /2: route item 34 to GS.5 as a source;
- /3: make IHG.1 the single owner, allowing disconnected H;
- /4: the four-way split of item 21;
- /5: route Proposition 8.3 to LP3;
- /6: DWP.7, Chin's existing route, and flat duality for Proposition 11.2;
- /7: R08.1 imports;
- /8: rewrite the brief's scope and tests;
- /10: set affects to "the proof".

Do not apply /1 or /13.
