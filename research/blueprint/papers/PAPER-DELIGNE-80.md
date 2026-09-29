# PAPER-DELIGNE-80: Deligne, *La conjecture de Weil. II*

Pierre Deligne, "La conjecture de Weil. II", *Publications mathématiques de l'IHÉS* 52 (1980), 137–252, doi:10.1007/BF02684780.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4495.

## What was read

I read the published text, the Numdam scan (117 pages; SHA-256 `b06eea61…cc71`, fetched 29 September 2026), in full: the introduction, the conventions of §0, §§1–6 and the bibliography.

- **Page images.** Numdam's text layer is OCR and garbles formulas. Every statement and every quoted misprint was therefore read on page images, with small print on 300 dpi crops (600 dpi for single symbols).
- **Corrections in print.** No published erratum to Weil II was found.

## What the paper proves

Weil II passes from varieties to coefficients.

**§1.**
- **Sheaves and weights.** §§1.1–1.2 define ι-pure and ι-mixed ℓ-adic sheaves and Weil sheaves on schemes of finite type over F_q.
- **Determinantal weights (§1.3).** Grothendieck's theorem that the radical of the connected geometric monodromy group is unipotent (1.3.8) leads to finiteness of the geometric monodromy of rank-one sheaves up to twist.
- **The monodromy filtration (§§1.6–1.9).** §1.6 develops the linear algebra of the monodromy filtration of a nilpotent endomorphism: primitive parts, Jacobson–Morozov and relative filtrations. §§1.7–1.9 then prove that the local monodromy filtration of a pure sheaf on a curve is its weight filtration (1.8.4). They also study tame restrictions along normal-crossings divisors and several-variable weight filtrations.
- **Coefficients and families (§§1.10–1.11).** §1.10 gives non-archimedean bounds and Newton polygons, and §1.11 specialization of monodromy.

**§2.** An abstract Hadamard–de la Vallée-Poussin method, and equidistribution with compact forms.

**§3.** The main results.
- **Théorème 1 = (3.3.1).** For f of finite type and ℱ₀ ι-mixed of weights ≤ n, R^i f_!ℱ₀ is ι-mixed of weights ≤ n + i. It is reached through the vanishing-cycle computation (3.1) and the curve case (3.2.3).
- **Applications:**
  - the weight filtration and geometric semisimplicity of lisse pure sheaves (3.4);
  - equidistribution of Frobenius classes, with the function-field Sato–Tate theorem (3.5);
  - the local invariant cycle theorem (3.6).

**§4.** The hard Lefschetz theorem over finite fields (4.1.1), with a finer study of the monodromy of Lefschetz pencils: open, or finite and a Weyl group of type A, D or E (4.4). It also proves the gcd theorem (4.5).

**§5.** The ℓ-adic homotopy type A(X) of a variety, built with the Grothendieck–Miller divided-power de Rham complex. It proves:
- that A(X) computes H*(X, Q_ℓ), and compares with Sullivan's minimal model over C;
- weight gradings on the minimal model (5.3.4);
- formality of proper smooth varieties (5.3.7).

**§6.** Stability of mixed complexes under the six operations, and purity of Rf_* of pure complexes for proper f (6.2.6). It adds the global invariant cycle theorem and hard Lefschetz for pure complexes (6.2.10–6.2.13).

## What the atlas already has

The extraction has 505 items: 302 are `planned`, 5 are `library` and 198 are `missing`.

**Where the planned items sit.**
- DeligneWeightsAndPurity was built for this paper:
  - DWP.5: local weights and the analytic preparation (86 items);
  - DWP.6: curves (35);
  - DWP.7: the fundamental theorem (31);
  - DWP.8: mixed complexes and semisimplicity (44);
  - DWP.9: hard Lefschetz (28).
- LefschetzPencilsAndVanishingCycles LPV.0–LPV.7 plans the local and global monodromy and the invariant cycle theorems.
- EtaleDualityAndPerverseSheaves plans the duality formalism.
- The ℓ-adic formalism follows the Weil I convention: SF.2 and WC.0/WC.1 for the upstream CohomologicalPointCounting supplier, and DWP.0/R34.1 for weights and twists.

**Library items.**
- Tau Ceti's sl₂ representation theory: `TauCeti.Sl2Std.*` gives the classification, the decomposition into irreducibles and Clebsch–Gordan used in §1.6. These are stated for the Lie algebra, not the group.
- Tau Ceti's finiteness of the degree-zero divisor class group (curve case of (1.3.1)).
- Mathlib's `riemannZeta_ne_zero_of_one_le_re`, the model case of §2.

## Routes

1. **DeligneWeightsAndPurity (DWP.5–DWP.8, DWP.10), source. 88 items.** These are the steps DWP.5–DWP.8 rely on but do not name:
   - Weil sheaves and the Weil group, and totally real sheaves;
   - the conjectures (1.2.9)–(1.2.10), recorded as statements, not targets;
   - determinantal weights and Grothendieck's theorem (1.3);
   - the corollaries (1.8.5)–(1.8.12);
   - non-archimedean bounds and Newton polygons (1.10), and specialization of monodromy (1.11);
   - the abstract Hadamard–de la Vallée-Poussin method and compact forms (§2);
   - the Kummer description of the vanishing cycle and the p-adic couples of §3;
   - equidistribution (3.5.3) and the function-field Sato–Tate theorem (3.5.7), which DWP.10's arithmetic interfaces should export;
   - mixedness of nearby cycles (6.1.13) and the Z[1/ℓ] variant (6.2.7).
2. **LefschetzPencilsAndVanishingCycles (LPV.1–LPV.3, LPV.5, LPV.7:invariant-cycles), source. 60 items.**
   - The linear algebra of the monodromy filtration that LPV.1 needs (1.6–1.7, 1.9).
   - §4's pencil theory: the p = 2, n even formula, transverse pencils and Morgan's integral counterexample (4.3.10).
   - The monodromy theorem (4.4.1) with the orthogonal case: finite monodromy is a Weyl group of type ADE (4.4.9). LPV.5 plans only the odd, symplectic case.
   - The gcd theorem (4.5.1), and the complex local invariant cycle theorem (3.6.4).
3. **SchemeAndStackFoundations (SF.2), source. 9 items.** The conventions of §0 and the filtered derived category of (1.1.2), listed so that nothing is unowned.
4. **FiniteFieldsAndCharacterSums (FF.2), source. 2 items.** The family form (3.7) of Weil I's exponential-sum bound.
5. **EtaleDualityAndPerverseSheaves (EDC.4), source. 1 item.** The Z_ℓ refinement (4.1.6) of weak Lefschetz.
6. **New roadmap EllAdicHomotopyTypesAndWeights ("ℓ-adic homotopy types of varieties and their weights"; area `etale`). 38 items.**
   - **Why a new roadmap.** Nothing in the atlas plans §5. The Tau Ceti roadmap on DG and A∞ algebras (DGAInfinity) has A∞ minimal models and formality, but not Sullivan's graded-commutative minimal models or their construction from varieties. A Tau Ceti roadmap is never re-planned, and this is a different direction, so §5 becomes a new roadmap that imports DGAInfinity.
   - **The brief** states:
     - (5.2.2): H*A(X) ≅ H*(X, Q_ℓ);
     - (5.2.5): the comparison with Sullivan's model;
     - (5.3.4), with its index corrected: existence and conjugacy of weight gradings;
     - the unproved Lemma (5.3.5), which must now be proved;
     - formality (5.3.7) and the Morgan analogue (5.3.8).

     It names the imports: DGAInfinity layers 1, 3 and 8; SF.2; DWP.0/DWP.7; DWP.4; and Mathlib's divided-power algebras.

## Mistakes in the paper (`sourceIssues`)

Eighty candidates were checked by two independent readers at 300–600 dpi. Seventy-one findings are recorded, eight were rejected and one was a duplicate. None changes Théorème 1 or the other main theorems. All are new as far as I could find (Numdam, and Katz's and Kiehl–Weissauer's re-expositions). Items use the corrected statements.

**Errors or gaps in stated results.**
- **E50: the Sato–Tate constant.** The measure in (3.5.6)–(3.5.7) is printed (1/2π) sin²θ dθ, which has total mass 1/4. It should be (2/π) sin²θ dθ. E51 is a related sign slip: the point count of E_x is 1 − 2cos θ·q^{n/2} + qⁿ.
- **E47: semisimplicity needs its hypotheses.** Variante (3.4.9) says "tout faisceau pur est géométriquement semi-simple". It needs "lisse" and a normal base, as in (3.4.1)(iii). A lisse sheaf with unipotent monodromy on a nodal cubic is a counterexample.
- **E38: a weight sign.** Proposition (2.2.8)(i) gives the weight 2ℛ(τ). With the conventions of (2.1.1) and (2.2.7) it is −2ℛ(τ). Only ℛ(τ) = 0 is used later.
- **E10: finite index.** Lemme (1.3.10)(iv) prints "sous-groupe fini de Z". The proof and (1.3.11) need a subgroup of finite index.
- **E67: an index.** Théorème (5.3.4) sums over j ≤ m; it should be j ≤ n.
- **E68: an unproved lemma.** Lemme (5.3.5) is "laissé au lecteur", but the conjugacy assertion of (5.3.4) depends on it.

**Errors and gaps in proofs.**
- **E15: a twist sign.** (1.6.14.3) prints the twist (i+j)/2 where −(i+j)/2 is meant. The last step of (1.8.4) needs the corrected sign.
- **E33: an epsilon choice.** In (2.1.7), ε₁ + ε₂ < ε does not suffice; ε₁ + 2ε₂ ≤ ε does.
- **E40: "bounded" is not shown.** In (2.2.9) b), the argument does not give that #X₀(F_{qⁿ}) is bounded.
- **E57: a trace formula.** In (4.4.9), Tr(s_δ s_δ′) is dim − 4 + (δ,δ′)², not dim − 2 + (δ,δ′)².
- **E11: the characteristic.** (1.3.15) is proved only in characteristic 0, which is the only case used.

**Misprints.** The rest are wrong indices, subscripts, references and labels, including the running head "CONJONCTURE" on odd pages.

## Prerequisites the atlas does not cover

The inputs of §5:
- Deligne–Griffiths–Morgan–Sullivan (1975): minimal models and formality;
- Sullivan (1977): rational homotopy theory;
- Miller (1978): the divided-power de Rham complex;
- Morgan (1978): unipotent quotients of π₁.

Other inputs:
- Deligne, *Théorie de Hodge* II–III: the Hodge-theoretic analogues;
- Steenbrink (1976): limit mixed Hodge structures;
- Katz–Messing (1974);
- SGA 4½: [Th. finitude].

Weil I is already PAPER-DELIGNE-74.
