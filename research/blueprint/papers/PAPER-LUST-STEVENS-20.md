# PAPER-LUST-STEVENS-20: Lust–Stevens, *On depth zero L-packets for classical groups*

Jaime Lust and Shaun Stevens, "On depth zero L-packets for classical groups", *Proc. London Math. Soc.* 121 (2020), 1083–1120, doi:10.1112/plms.12340; arXiv:1611.08421.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4589.

## What was read

- **The text.** I read the whole of arXiv v1 (2016; 36 pp.; SHA-256 recorded), the only arXiv version: §§1–9 and the references. Quoted formulas were checked on page images.
- **The published version.** The PLMS text could not be fetched, because the publisher serves a bot challenge. Locators and findings therefore refer to arXiv v1, and some slips may be corrected in print.

## What the paper proves

Let G be a p-adic symplectic, special orthogonal or unitary group, with p odd. For π a depth-zero irreducible cuspidal representation of G, and ρ a self-dual cuspidal representation of some GL_n(F), let s_π(ρ) be the reducibility point of Ind ρ|det|^s ⊗ π. Mœglin's theory turns these reducibility points into the Jordan set Jord(π), and hence into the Langlands parameter. The main theorem (§1, p. 4) has three parts:

- **(i)** Σ⌊s_π(ρ)²⌋ n_ρ = N_Ĝ.
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

Of 158 items, 4 are `planned` and 1 is in the libraries:
- **Planned.** Induction and the Bernstein subcategories (SmoothRepresentationsOfLocalGroups SR.2–SR.3), Witt theory (QuadraticFormInvariants layer 1, GN.2) and the local-field setup (LocalFieldsRamification layer 0).
- **Library.** The Mackey formula, which is Tau Ceti's `Rep.mackeyDecomposition`.

The other 153 items are `missing`. Nothing in the atlas plans any of the following:
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
- **Moy–Prasad (1996):** depth-zero cuspidals from parahorics.
- **Morris (1999):** level-zero types.
- **Bushnell–Kutzko (1998):** covers.
- **Miyauchi–Stevens (2014):** semisimple types for classical groups.
- **Blondel (2005):** the Hecke parameters of covers.
- **Lusztig (1977):** representations of finite classical groups.
- **Shahidi (1990):** reducibility points and Plancherel measures.

Stevens's 2008 supercuspidals paper and Bushnell–Henniart 2017 are already in the batch list.
