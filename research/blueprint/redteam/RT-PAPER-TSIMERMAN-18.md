# Red team: PAPER-TSIMERMAN-18 (Tsimerman, *The André–Oort conjecture for A_g*)

Job `RT-PAPER-TSIMERMAN-18` (issue #4100), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-TSIMERMAN-18.result.json`, in the format of PROTOCOL section 17.

**Result:** 11 findings: 5 medium and 6 low.

- **The extraction.** It is careful and well argued.
  - It has 101 items (5 library, 30 planned, 66 missing), 11 routes and 8 source issues. E1–E5 are in the errata file and E6–E8 in the extraction.
  - The statements match the published text.
  - The five library claims hold at the pins.
  - The quadratic-Hecke repair of Corollary 3.3 is correct. I re-derived its functional-equation, averaging and metric constants.
- **What breaks.**
  - Four o-minimal/Shimura items have two owners: LD.6 and the Mok–Pila–Tsimerman Part II.
  - One route names AN.0, a layer that the accepted RS-07 had already dropped.
  - Two real mistakes in the paper are silently repaired but not recorded: the Cauchy step for general Artin L-functions, and the rigidity claim in Lemma 4.1.
  - The mixed-Shimura route sends LD.6 statements that nothing lets it write down.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-fb70e5` (issue #1141). It was continued by Codex `codex-c83e7a` (21 September) and by `cc-fb70e5` (22 September). The earlier ChatGPT sessions were `cgp-ao-20260921-a7f3` and `astra-ao-9c47e2`.
  - The review, REV-PAPER-TSIMERMAN-18, is by Codex `codex-hjdg0j` (issue #1142, 23 September, PR #2409).
  - The errata file was reviewed by REV-ERRATA-PAPER-TSIMERMAN-18.
  - `cc-f805bf` appears in none of these files.
- **Disclosure.** This session red-teamed Lawrence–Venkatesh 20 (PR #4763).
  - That report's confirmed finding /2 says LD.6 does not plan Bakker–Tsimerman's Ax–Schanuel theorem, and that the Shimura functional-transcendence owner is LogicAndDefinabilityPartII (from PAPER-MOK-PILA-TSIMERMAN-19).
  - Finding 1 below is of the same kind, for different items. It rests on the LD.6 text, the LD packet and the MPT19 extraction and review, all quoted, and not on that earlier finding.
  - This session also red-teamed Khayutin 19 (PR #4789). Nothing here relies on it.

## What was read

- **The published paper.** Ann. of Math. 187 (2018) 379–390, read in full through pdftotext.
  - Its SHA-256 `43259ca3…40722abc` reproduces the extraction's hash.
  - Printed pp. 381 and 384 were rendered as images: the height formula with |∫σ(ω∧ω̄)|, Corollary 3.3 and Lemma 4.1.
- **arXiv 1506.01466v5.** Its hash `ccc5f8be…d26280643` reproduces the extraction's. It was compared at §§2–6.
  - v5 (1 December 2015) is the latest of v1–v5.
  - Crossref records no update, and the Annals article page links no erratum.
- **Pila–Tsimerman 2014.** Read at §7, Lemma 7.4 and the proof of Theorem 7.1.
- **The repository.**
  - All 101 items, the 11 routes and both Part II briefs, E1–E8, the report, the review JSON and report, and the errata record with its register entries. Every record appears exactly once in `research/errata/REGISTER.md` and `data/source-issues.json`.
  - Stage texts: LD.0–LD.6; R35.1–R35.6; CM.0 and CM.2; M3 and M6; D5; V0, V1, V4 and V5; RP.0; AN.0, AN.2, AN.4 and AN.5; AL.1; and the Tau Ceti GlobalNumberFields Layers 9–10 and ClassFieldTheory Layers 11 and 13.
  - The packets for LD, AN, AL, A, RP and R28. The restructurings RS-02, -03, -04, -06, -07 and -23 at every routed stage. The queue states.
  - The extractions of AGHMP 18, Yuan–Zhang 18, Mok–Pila–Tsimerman 19, Bakker–Klingler–Tsimerman 20, Binyamini 22, Gao–Habegger 19, Richard–Yafaev 25, Masser–Zannier 20 and Gao–Ge–Kühne 26.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`.
  - Every cited declaration was opened: `IsCMField`, the CM regulator lemmas, the discriminant tower, `dedekindZeta` and its residue, and `card_ideal_absNorm_le`.
  - `declarations.tsv` was searched for what is marked missing: CM types, Faltings height, o-minimality, Pila–Wilkie, divisor bounds, Siegel domains and heights.

## What holds up

- **Statements and derivations.**
  - Every theorem item matches its locator.
  - The following re-derive:
    - the Hecke functional equation, ℓ0 + ℓ1 = −log Q + g(γ + log 2π);
    - the average-to-individual bound;
    - the metric shift h_YZ = h_T + (g/2) log 2π;
    - the Cauchy radius;
    - the exponent budget δ < 1/(4κ_g);
    - the degree bound 4·3^{8g²}.
  - Proposition 2.2's claim that isogenies respect the O_E-action is right for primitive Φ. An automorphism of E fixing Φ would make Φ induced from a smaller CM field.
- **Source issues.**
  - E1–E8 all check out.
  - E6 is visible in the printed text of p. 387.
  - E7 matches PT2014 Theorem 6.1, which concludes "weakly special".
- **Libraries.**
  - All five library items are right, including `regulator K / regulator K⁺ = 2^rank K · (indexRealUnits K)⁻¹` (CMField.lean:440).
  - Nothing marked missing exists at the pins. The one partial exception is finding 9.
- **Owners.**
  - The averaged-Colmez items of Tsimerman, AGHMP and Yuan–Zhang go to one CM Part II design, so they are one owner.
  - Masser–Wüstholz goes to the same Faltings Part II from Masser–Zannier 20 as well.
  - No source route lands in a finished blueprint: LD.6 is not_read, and the CM, PEL, AL, RP and A packets are partial.

## Findings

### Medium

1. **Two owners for weakly special subvarieties, Peterzil–Starchenko definability and hyperbolic Ax–Lindemann.**
   - The extraction marks four items planned at LD.6: special-weakly-special, cm-promotes-special, uniformization-definability and hyperbolic-ax-lindemann.
   - LD.6 does not plan them. It builds applications "from separate … definability of uniformization and functional-transcendence theorems", and its packet has no LD.6 node.
   - The accepted MPT19 routes the same notions as missing to LogicAndDefinabilityPartII (its /2 and /8). Its note says: "PAPER-TSIMERMAN-18 routes the same notion to LD.6; one owner must be chosen when these are designed."
   - The MPT19 review was committed 2.5 hours before this extraction's review.
   - **Fix:** mark the four items missing and route them to that Part II, with Ax–Lindemann for A_g as a corollary of Ax–Schanuel there. Keep the arithmetic applications at LD.6.
2. **Route 5 names AN.0, which the accepted RS-07 dropped.**
   - RS-07 (reviewed 21 September) dropped AN.0 in favour of Mathlib and the Tau Ceti ArithmeticDirichletSeries layers, which are existing work.
   - The AN packet has closed AN.0 "Dropped by accepted RS-07".
   - The route reason ("AN.0 supplies coefficient/Euler-product comparison") and the Part II brief still send work there. That work is the bound a_K(m) ≤ d_n(m).
   - **Fix:** move it to AN.5, which already has τ(n) ≪ n^ε nodes.
3. **An unrecorded gap in Corollary 3.3.**
   - For a general Artin ρ, the paper applies Cauchy's formula and the convexity bound to L(s,ρ̄) on a circle of fixed radius ε about 1 (p. 384, and v5).
   - That needs holomorphy on the disc. Brauer's theorem gives L(s,ρ̄) as a quotient of Hecke L-functions, whose zeros are excluded only from 1 − c/log(conductor). So a pole in the disc cannot be ruled out uniformly.
   - The extraction and review saw this ("I do not certify a uniform general-Artin Cauchy contour") and repaired the argument through the entire L(s,η_{E/F}), but recorded no source issue.
   - **Fix:** add E9 (a gap that affects the proof), and restate artin-derivatives as a factorwise bound on the logarithmic derivative.
4. **An unrecorded error in Lemma 4.1.**
   - "A equipped with a basis of A[3] is rigid" is false for an unpolarized A.
   - For A ∈ S(E,Φ) with g ≥ 2, a unit u ≠ 1 with u ≡ 1 mod 3 exists, because O_E^× has rank g − 1 ≥ 1. It acts as a nontrivial automorphism fixing A[3].
   - Theorem 4.2 applies the lemma to such unpolarized A and B.
   - The extraction silently repairs this: level-three-descent and bounded-field-definition assume a polarized A, and cm-common-definition-field chooses a polarization on B.
   - **Fix:** add E10 (an error that affects the proof), stating the polarized form (Serre's lemma) and the choice of polarization on B = A/T_I.
5. **The mixed-Shimura route sends LD.6 statements it cannot state.**
   - The four items of route 11 are phrased with mixed Shimura data (P = W ⋊ G, the pure part, special points, neat level).
   - No item defines these, and no layer plans them. The route itself says the owner screen found none.
   - **Fix:** add a definition item routed to a ShimuraVarieties Part II on mixed Shimura varieties, and put Gao's mixed Ax–Lindemann in the LogicAndDefinabilityPartII. Or hold the items until a Gao 2017 extraction. Either way, merge what remains into route 1, which is the same stage.

### Low

6. **"c_g is a positive constant" (pp. 383–384).**
   - It cannot be positive: Faltings heights are negative for some abelian varieties.
   - With the paper's |∫ω∧ω̄| metric, the CM curve with j = 0 has h = −½ L'(0,χ_{−3})/L(0,χ_{−3}) − ¼ log 3 − ½ log 2π ≈ −1.668. Adding ½ log 2π gives the familiar value −0.7488.
   - The extraction corrects this silently.
   - **Fix:** record it as E11 (a misprint).
7. **"Degree bounded by 2g" for CM lifts (p. 387; also PT2014 Lemma 7.4).**
   - The period point generates the reflex field, because σ(W_Φ) = W_{σΦ}. The reflex field has degree up to 2^g: 8 for a generic sextic CM field.
   - So the claim is false as a field degree for g ≥ 3, and unproved coordinatewise.
   - The item cm-lift-degree already uses a bound d_g depending only on g.
   - **Fix:** record it as E12.
8. **The metric adapter has two owners.**
   - Route 2 gives h_YZ = h_T + (g/2) log 2π to R35.
   - The route-9 brief ("both exact height normalizations") and AGHMP's brief for the same Part II ("prove the adapter") give it to the Part II.
   - h_T = h_AGHMP, so this is one identity.
   - **Fix:** make R35.2 the owner, and have the Part II import it.
9. **Library claim.** algebraic-point-height does not cite `NumberField.absMulHeight₁` (Mathlib Height/NumberField.lean:137), which is the absolute height of an algebraic number in any characteristic-zero field.
10. **pila-wilkie and the prerequisites.**
    - The degree-d version is marked planned, but LD.6 plans only rational points. Gao–Habegger's analogous extension goes to LD.6 as missing.
    - Pila 2009, the proof source named in the item's note, is not among the prerequisites.
    - The Shimura–Taniyama and Bost links point to the Tsimerman PDF, and the Rademacher link points to Thorner–Zaman.
11. **Records.**
    - validation.structuralChecks still says 5/28/68 where the file has 5/30/66.
    - Neither the extraction nor the errata file has sourceVersions (PROTOCOL §18), although both texts were read and hashed.

## Considered and not raised

- **"f_ρ ≤ |Disc(E)| for any irreducible Artin representation" (p. 384).** Only the constituents of Ind η_{E/F} survive averaging, and for those it follows from the conductor–discriminant formula.
- **The equality [Q(A):Q] = |Cl(K*)|/|H| (p. 386).** It is already open as the extraction's gap G2.
- **An owner for Siegel's classical fundamental domain.** V0's Siegel sets suffice for a fundamental set.
- **Theorem 5.2's direction.** It is equivalent to Edixhoven's form.
- **Algebraicity of CM points (§6.1).** It is part of the main theorem of CM, which V5 plans.
