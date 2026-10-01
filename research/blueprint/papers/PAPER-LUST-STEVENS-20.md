# PAPER-LUST-STEVENS-20: Lust–Stevens, *On depth zero L-packets for classical groups*

Jaime Lust and Shaun Stevens, "On depth zero L-packets for classical groups", *Proc. London Math. Soc.* 121 (2020), 1083–1120, doi:10.1112/plms.12340; arXiv:1611.08421.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4589.

## What was read

- **The text.** I read the whole of arXiv v1 (2016; 36 pp.; SHA-256 recorded), the only arXiv version: §§1–9 and the references. Quoted formulas were checked on page images.
- **The published version.** The PLMS text could not be fetched, because the publisher serves a bot challenge. Locators and findings therefore refer to arXiv v1, and some slips may be corrected in print.
- **Added by the review.** The version of record is open access (CC BY 4.0), and the University of East Anglia repository serves it. The independent review read it and collated every finding with it (see the last section).

## What the paper proves

Let G be a p-adic symplectic, special orthogonal or unitary group, with p odd. For π a depth-zero irreducible cuspidal representation of G, and ρ a self-dual cuspidal representation of some GL_n(F), let s_π(ρ) be the reducibility point of Ind ρ|det|^s ⊗ π. Mœglin's theory turns these reducibility points into the Jordan set Jord(π), and hence into the Langlands parameter. The main theorem (§1, p. 4) has three parts:

- **(i)** Σ⌊s_π(ρ)²⌋ n_ρ ⩾ N_Ĝ, the depth-zero terms alone summing to N_Ĝ (8.1). This is the printed statement (1.4); arXiv v1 claims the equality (1.3) (E33).
- **(ii)** The multiset IRed(π) is computed explicitly from the compact-induction data of π.
- **(iii)** The cuspidal representations with the same IRed are described and counted, matching one, two or four L-packets.

For symplectic groups this describes the cuspidal members of Π_φ ∪ Π_φ′ for any tame parameter φ.

**The method.**
- **§§2–3:** Morris's description of depth-zero cuspidals, via the lattice model of parahorics.
- **§§4–5:** Bushnell–Kutzko covers (Miyauchi–Stevens) and Blondel's formula relating reducibility points to Hecke-algebra parameters.
- **§6:** reduction to the finite reductive quotients.
- **§7:** computation of the parameters from Lusztig's theory: Lusztig series, the Jordan decomposition, cuspidal unipotent representations, and extension from SO to O.
- **§§8–9:** synthesis, and counting of L-packet sizes with examples.

## What the atlas has

Of 158 items, 4 are `planned` and, after the review, none is in the libraries:
- **Planned.** Induction and the Bernstein subcategories (SmoothRepresentationsOfLocalGroups SR.2–SR.3), Witt theory (QuadraticFormInvariants layer 1, GN.2) and the local-field setup (LocalFieldsRamification layer 0).
- **Library.** None. The extraction listed the Mackey formula (7.5) as Tau Ceti's `Rep.mackeyDecomposition`. The review made it missing, because (7.5) also needs the Harish-Chandra splitting, which neither library has.

The other 154 items are `missing`. Nothing in the atlas plans any of the following:
- depth-zero types and covers for classical groups;
- Silberger's reducibility theory or Blondel's formula;
- Deligne–Lusztig theory, Lusztig series or the Jordan decomposition;
- L-packets of classical groups.

## Route

**One `part-ii` route joins the existing SmoothRepresentationsPartII.** Its title is "Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations"; parent SmoothRepresentationsOfLocalGroups, area `representations`.

- **Why join rather than propose.** The maintainer's note asks for a Part II of SmoothRepresentationsOfLocalGroups. An existing proposal in exactly this direction (PAPER-FINTZEN-21) has already been joined by Bushnell–Henniart, Newton–Thorne (which cites this paper) and Gan–Harris–Sawin et al. Joining it, with byte-identical id, parent, title and area, follows PROTOCOL.md §15.
- **What the brief adds** to that Part II:
  - the final theorems (i)–(iii) as the paper states them;
  - the lattice model of parahorics of classical groups;
  - Morris's depth-zero classification, recording the SO(1,1) exception;
  - Silberger's reducibility theorem and Blondel's formula;
  - the finite-group computation of §7;
  - the L-packet counting of §9.
- **What the brief imports rather than re-plans:**
  - SR.1–SR.3;
  - the Part II's own Fintzen layers for types and covers;
  - ReductiveGroupsPartII and the Tau Ceti reductive-groups roadmap for parahorics and finite groups of Lie type;
  - Deligne–Lusztig representations from ModularRepresentationsOfFiniteReductiveGroups, adding Lusztig series and the Jordan decomposition;
  - the local Langlands correspondence for GL_m from ET.6;
  - Arthur–Mœglin packets as statements from ML.4.
- **One dependency recorded.** Equality in (i) depends on Mœglin's results and on the then-unpublished Blondel–Henniart–Stevens. The brief records this as a dependency to state, not something to assume.

## Mistakes (`sourceIssues`, arXiv v1)

Thirty-six candidates were checked at 300 dpi by an independent reader; 34 were confirmed and 2 rejected. Items use the corrected statements.

**In stated results.**
- **E33: equality in (i) is not proved.** The paper proves ⩾ in (8.1). Equality relies on Mœglin, "in many cases", and on the unpublished [6], which concerns symplectic groups.
- **E34: (iii) omits a case.** It leaves out the case in which the count is half the expected number, for even special orthogonal groups (§9.3, Example 9.6).
- **E7: SO(1,1) ≅ GL₁ breaks §3.** Depth-zero cuspidals of this group are not compactly induced from a compact open subgroup, and the standard lattice is not unique.

**In proofs.**
- **E16: Lemma 7.4 is vacuous as printed.** Its hypothesis 𝒢*_s ⊆ ℒ* makes the induced representation irreducible; s ∈ ℒ* is meant.
- **E20: an anti-commutation claim is false.** The proof of Proposition 7.9 claims that odd-length elements of the Clifford algebra anti-commute; this fails, with an explicit counterexample on SO₆. The conclusion is plausibly still true.

**Other errors.**
- **E5: the J/J¹ formula fails for ramified unitary groups.** For U(1), J/J¹ = {±1}.
- **E6: the maximality criterion on p. 6 is wrong.** It contradicts the correct criterion on p. 7.
- **E27: Example 9.7's IRed is inconsistent.**

**Misprints.**
- **E26:** the examples list s_π(ρ) where IRed calls for m = 2s_π(ρ) − 1.
- **E28:** the characteristic polynomial in Example 9.9 lacks a factor (X − 1).
- **The rest:** index and notation slips.

## Prerequisites the atlas does not cover

- **Mœglin (2003):** reducibility points and Jordan sets.
- **Moy–Prasad (1994), Invent. Math. 116:** unrefined minimal K-types, cited as [MP] in §3 (corrected by the review from the 1996 paper, which the text does not cite).
- **Morris (1999):** level-zero types.
- **Bushnell–Kutzko (1998):** covers.
- **Miyauchi–Stevens (2014):** semisimple types for classical groups.
- **Blondel (2012), Ann. Inst. Fourier 62:** formula (5.1) for reducibility points from the Hecke parameters of covers (corrected by the review from the 2005 paper, which the text does not cite).
- **Lusztig (1977):** representations of finite classical groups.
- **Shahidi (1990):** reducibility points and Plancherel measures.
- **Added by the review:**
  - Howlett–Lehrer (1980): End(Ind τ) for cuspidal τ;
  - Lusztig (1984): *Characters of reductive groups over a finite field*, Theorem 8.6;
  - Silberger (1980): the uniqueness of the reducibility point.

Stevens's 2008 supercuspidals paper and Bushnell–Henniart 2017 are already in the batch list.

## Corrections by the independent review (REV-PAPER-LUST-STEVENS-20)

Claude Code, session `cc-fb70e5`, 29 September 2026. The full report is `research/blueprint/reviews/REV-PAPER-LUST-STEVENS-20.md`.

- **Version of record read.**
  - Proc. London Math. Soc. (3) 121 (2020) 1083–1120 is CC BY 4.0. The review read it from the University of East Anglia repository (eprint 74421; SHA-256 `bd8295cf…4c55`), and `sourceVersions` records it.
  - Print renumbers §7: [32, Lemma 8.9] becomes Lemma 7.3, and arXiv 7.3–7.10 move up by one. It adds Remark 8.2 and states result (i) as the inequality (1.4).
  - Item locators still refer to arXiv v1, and `source.readSections` gives the correspondence.
- **Route split.**
  - The 52 finite-group items move to a new route 2, a `part-ii` route that coalesces with ModularRepresentationsOfFiniteReductiveGroups. These are all of §7; Green's classification, self-dual polynomials and Lusztig's classification from §3; and the full finite classical group and the Howlett–Lehrer parameter from §6.
  - ModularRepresentationsOfFiniteReductiveGroups is the Part II of Tau Ceti's Reductive algebraic groups roadmap that builds Deligne–Lusztig representations, proposed by LLHLM20. SmoothRepresentationsPartII's accepted brief excludes Deligne–Lusztig classification, and PROTOCOL.md §15 wants one owner.
  - Route 1 keeps the 102 p-adic items. Its brief now states result (i) as printed, adds the even orthogonal caveat to (iii), and imports §7 from route 2. It names its owners exactly: ReductiveGroupsPartII RG2.2–RG2.3 for parahorics, and GN.2 for hermitian Witt theory.
- **Status.** s7-7.5-mackey-formula becomes missing. `Rep.mackeyDecomposition` gives only the general decomposition, not the Harish-Chandra splitting into ℓ ∈ {1, 2} constituents.
- **Corrected statements.** The following items now use the corrected statements, not the printed ones:
  - s1-main-thm-i;
  - s3-depth-zero-gl-classification (E35);
  - s7-lemma-7.4-i (E16);
  - s7-7.7-unitary-parameter-formula (E24);
  - s7-7.1-self-dual-root-criterion (E38);
  - s9-def-E-e-e0 (E25);
  - Examples 9.3, 9.4, 9.6, 9.7, 9.8 and 9.9 (E26–E28).
- **Mistakes.**
  - All 34 findings are confirmed, and each locator now gives the printed page.
  - Print corrects E8, E12, E13, E14, E22, E32 and E33, and part of E21; their `known` fields say so.
  - The review adds four:
    - **E35:** "ρ self-dual iff τ self-dual" in §3 is false.
    - **E36:** a sign in the IRed formula of print's new algorithm section.
    - **E37:** a stray word in print's introduction.
    - **E38:** the root criterion for self-dual polynomials ignores multiplicities.
- **Prerequisites.** Moy–Prasad and Blondel now name the papers the text cites (1994 and 2012). Howlett–Lehrer, Lusztig (1984) and Silberger (1980) are added.

## Fixes from the red team (FIX-RT-PAPER-LUST-STEVENS-20)

Claude Code, session `cc-c2c06b`, 1 October 2026. The fixes apply the five confirmed findings of RT-PAPER-LUST-STEVENS-20. The full account is `research/blueprint/redteam/RT-PAPER-LUST-STEVENS-20.fixes.md`. The extraction still has 158 items and two routes. It now has 40 sourceIssues.

- **The Weyl representative of §7.3** (s7-7.6-weyl-representative-action):
  - **The fix.** On the exchanged pairs it is now w(e_i^−) = e_i^+, w(e_i^+) = ε e_i^−. The printed w(e_i^±) = ε e_i^∓ is not symplectic for ε = −1.
  - **What it gives.** The corrected map preserves the form and has determinant (−ε)^n, so it lies in Sp, or in SO when n is even.
  - **Unchanged.** The induced action (7.6), which is (7.7) in print, and the later parameter table.
  - **New sourceIssue E39** records the sign slip, which is in both versions.
- **The Levi of the §7.3 reduction** (s7-7.3-eigenspace-levi) now follows the version of record (p. 1100).
  - **The construction.** ℒ* is the minimal F-stable Levi containing the centralizer of s. Its dual is a product of general linear groups with twisted Frobenius and one classical group on ker(s² − 1).
  - **What it replaces.** arXiv v1's stabilizer of the rational primary decomposition, which need not be a Levi. In SO_5 at q = 3 it contains SO_4.
  - **New sourceIssue E40** records this, with `known` naming the published correction.
- **J/J¹** (s2-reductive-quotient-J) is branched by ramification. The determinant condition applies only when F = F_o or F/F_o is unramified. In the ramified case J/J¹ is the full U(V̄_(1)) × U(V̄_(2)) (E5).
- **Maximality of J°** (s2-parahoric-Jo-properties) now uses the criterion of s2-maximal-parahoric-exceptions. Only a split SO(1,1,k_F) factor obstructs maximality, and not when G is itself two-dimensional special orthogonal (E6). The two items now agree.
- **Split SO(1,1) ≅ GL₁** (E7). The following assume G is not split SO(1,1):
  - the normalizer, maximal-compact and standard-label statements;
  - Morris's compact-induction classification and the uniqueness of the local data;
  - the §8 local-data set-up;
  - main results (ii) and (iii).

  The lattice-orbit statement is kept for every G. For split SO(1,1) the depth-zero cuspidals are characters of F^×, not compactly induced from 𝔬_F^×, and that case is deferred.

Both route briefs now carry these corrections.